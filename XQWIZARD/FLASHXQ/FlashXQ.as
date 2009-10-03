/*
FlashXQ.as - Source Code for FlashXQ

FlashXQ - a Web XiangQi (Chinese Chess) Score Publish Program
Designed by Morning Yellow, Version: 1.0, Last Modified: Mar. 2009
Copyright (C) 2008 mobilechess.sourceforge.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

package {
	import flash.display.SimpleButton;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	// import flash.net.navigateToURL;
	// import flash.net.URLRequest;
	import flash.text.TextField;

	public class FlashXQ extends Sprite {
		private static const SQUARE_SIZE:int = 24;

		// 把字符转换为数字
		private static function char2Digit(c:String):int {
			var retVal:int = c.charCodeAt() - '0'.charCodeAt();
			return retVal >= 1 && retVal <= 9 ? retVal : 0;
		}

		// 把纵坐标转换为数字
		private static function char2File(c:String):int {
			var retVal:int = c.charCodeAt() - 'A'.charCodeAt();
			return retVal >= 0 && retVal <= 8 ? retVal : 0;
		}

		// 把横坐标转换为数字
		private static function char2Rank(c:String):int {
			return 9 - char2Digit(c);
		}

		// 把字符转换为棋子代号(只适合大写字母)
		private static function char2Piece(c:String):int {
			var cUCase:String;
			if (c.charCodeAt() > 'Z'.charCodeAt()) {
				cUCase = String.fromCharCode(c.charCodeAt() - 'a'.charCodeAt() + 'A'.charCodeAt());
			} else {
				cUCase = c
			}
			var retVal:int;
			switch (cUCase) {
			case 'K':
				retVal = 8;
				break;
			case 'A':
				retVal = 9;
				break;
			case 'B':
			case 'E':
				retVal = 10;
				break;
			case 'N':
			case 'H':
				retVal = 11;
				break;
			case 'R':
				retVal = 12;
				break;
			case 'C':
				retVal = 13;
				break;
			case 'P':
				retVal = 14;
				break;
			default:
				return 0;
			}
			return cUCase == c ? retVal : retVal + 8;
		}

		private var bFlipped:Boolean = false;
		private var nMaxStep:int, nCurrStep:int;
		private var mcSquares:Array = new Array(90);
		private var sqBoardList:Array;

		// 绘制一个格子
		private function drawSquare(sq:int, pc:int):void {
			mcSquares[bFlipped ? 89 - sq : sq].gotoAndStop(pc + 1);
		}

		// 重绘棋盘上的所有格子
		private function initBoard():void {
			for (var i:int = 0; i < 90; i ++) {
				drawSquare(i, sqBoardList[nCurrStep][i]);
			}
			txtStep.text = nCurrStep + "/" + nMaxStep;
		}

		// 绘制与上一局面不同的格子
		private function flushBoard(nNewStep:int):void {
			nNewStep = (nNewStep < 0 ? 0 : nNewStep > nMaxStep ? nMaxStep : nNewStep);
			for (var sq:int = 0; sq < 90; sq ++) {
				if (sqBoardList[nCurrStep][sq] != sqBoardList[nNewStep][sq]) {
					drawSquare(sq, sqBoardList[nNewStep][sq]);
				}
			}
			nCurrStep = nNewStep;
			txtStep.text = nCurrStep + "/" + nMaxStep;
		}

		// 主过程从这里开始
		public function FlashXQ() {
			var i, j;

			// 初始化棋盘格子
			for (i = 0; i < 10; i ++) {
				for (j = 0; j < 9; j ++) {
					var sq:int = i * 9 + j;
					mcSquares[sq] = new Square();
					mcSquares[sq].x = j * SQUARE_SIZE;
					mcSquares[sq].y = i * SQUARE_SIZE;
					addChild(mcSquares[sq]);
				}
			}

			// 从HTML中读取"Position", "MoveList", "Step"变量
			var strFen:String = loaderInfo.parameters.Position;
			if (strFen == null) {
				strFen = "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1"
			}
			var strMoveList:String = loaderInfo.parameters.MoveList;
			if (strMoveList == null) {
				strMoveList = "";
			}
			var nStep:int = parseInt(loaderInfo.parameters.Step);

			// 解析走法列表
			var sqSrcList:Array = new Array();
			var sqDstList:Array = new Array();
			for (i = 0; i < strMoveList.length - 4; i += 6) {
				var xSrc:int = char2File(strMoveList.charAt(i));
				var ySrc:int = char2Rank(strMoveList.charAt(i + 1));
				var xDst:int = char2File(strMoveList.charAt(i + 3));
				var yDst:int = char2Rank(strMoveList.charAt(i + 4));
				sqSrcList.push(ySrc * 9 + xSrc);
				sqDstList.push(yDst * 9 + xDst);
			}

			// 生成局面数组
			sqBoardList = new Array(sqSrcList.length + 1);
			for (i = 0; i < sqBoardList.length; i ++) {
				sqBoardList[i] = new Array(90);
				for (j = 0; j < 90; j ++) {
					sqBoardList[i][j] = 0;
				}
			}

			// 解析FEN串，读入"sqBoardList[0]"
			j = 0;
			var k:int = 0;
			for (i = 0; i < strFen.length; i ++) {
				var c:String = strFen.charAt(i);
				if (c == ' ') {
					break;
				} else if (c == '/') {
					j ++;
					if (j == 10) {
						break;
					}
					k = 0;
				} else {
					var n:int = char2Digit(c);
					if (n == 0) {
						if (k < 9) {
							sqBoardList[0][j * 9 + k] = char2Piece(c);
							k ++;
						}
					} else {
						for (var m:int = 0; m < n; m ++) {
							if (k < 9) {
								sqBoardList[0][j * 9 + k] = 0;
								k ++;
							}
						}
					}
				}
			}

			// 根据走法给每个"sqBoardList"赋值
			for (i = 1; i < sqBoardList.length; i ++) {
				for (j = 0; j < 90; j ++) {
					sqBoardList[i][j] = sqBoardList[i - 1][j];
				}
				var sqSrc:int = sqSrcList[i - 1];
				var sqDst:int = sqDstList[i - 1];
				if (sqSrc == sqDst) {
					// 仕相升变成兵
					sqBoardList[i][sqDst] = (sqBoardList[i][sqDst] > 16 ? 22 : 14);
				} else {
					sqBoardList[i][sqDst] = sqBoardList[i][sqSrc];
					sqBoardList[i][sqSrc] = 0;
				}
			}

			// 状态：原来的棋盘，现在的棋盘，是否翻转
			nMaxStep = sqBoardList.length - 1;
			nCurrStep = (nStep < 0 ? 0 : nStep > nMaxStep ? nMaxStep : nStep);

			initBoard();

			// 按钮和提示 - 翻转棋盘
			mcFlipTip.gotoAndStop(0);
			setChildIndex(mcFlipTip, numChildren - 1);
			btnFlip.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				bFlipped = !bFlipped;
				initBoard();
			});
			btnFlip.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcFlipTip.gotoAndPlay(0);
			});
			btnFlip.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcFlipTip.gotoAndStop(0);
			});

			// 按钮和提示 - 起始局面
			mcBeginTip.gotoAndStop(0);
			setChildIndex(mcBeginTip, numChildren - 1);
			btnBegin.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(0);
			});
			btnBegin.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcBeginTip.gotoAndPlay(0);
			});
			btnBegin.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcBeginTip.gotoAndStop(0);
			});

			// 按钮和提示 - 后退十步
			mcPrev10Tip.gotoAndStop(0);
			setChildIndex(mcPrev10Tip, numChildren - 1);
			btnPrev10.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(nCurrStep - 10);
			});
			btnPrev10.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcPrev10Tip.gotoAndPlay(0);
			});
			btnPrev10.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcPrev10Tip.gotoAndStop(0);
			});

			// 按钮和提示 - 后退一步
			mcPrevTip.gotoAndStop(0);
			setChildIndex(mcPrevTip, numChildren - 1);
			btnPrev.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(nCurrStep - 1);
			});
			btnPrev.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcPrevTip.gotoAndPlay(0);
			});
			btnPrev.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcPrevTip.gotoAndStop(0);
			});

			// 按钮和提示 - 前进一步
			mcNextTip.gotoAndStop(0);
			setChildIndex(mcNextTip, numChildren - 1);
			btnNext.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(nCurrStep + 1);
			});
			btnNext.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcNextTip.gotoAndPlay(0);
			});
			btnNext.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcNextTip.gotoAndStop(0);
			});

			// 按钮和提示 - 前进十步
			mcNext10Tip.gotoAndStop(0);
			setChildIndex(mcNext10Tip, numChildren - 1);
			btnNext10.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(nCurrStep + 10);
			});
			btnNext10.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcNext10Tip.gotoAndPlay(0);
			});
			btnNext10.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcNext10Tip.gotoAndStop(0);
			});

			// 按钮和提示 - 结束局面
			mcEndTip.gotoAndStop(0);
			setChildIndex(mcEndTip, numChildren - 1);
			btnEnd.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				flushBoard(nMaxStep);
			});
			btnEnd.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcEndTip.gotoAndPlay(0);
			});
			btnEnd.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcEndTip.gotoAndStop(0);
			});

			// 按钮和提示 - 本Flash棋盘由象棋巫师生成
			mcAboutTip.gotoAndStop(0);
			setChildIndex(mcAboutTip, numChildren - 1);
			btnAbout.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				// navigateToURL(new URLRequest("http://www.elephantbase.net/xqwizard/xqwizard.htm"), "_blank");
				ExternalInterface.call("window.open", "http://www.elephantbase.net/xqwizard/xqwizard.htm", "_blank");
			});
			btnAbout.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
				mcAboutTip.gotoAndPlay(0);
			});
			btnAbout.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void {
				mcAboutTip.gotoAndStop(0);
			});
		}
	}
}