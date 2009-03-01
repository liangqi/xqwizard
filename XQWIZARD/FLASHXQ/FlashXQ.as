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
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class FlashXQ extends Sprite {
		private static const SQUARE_SIZE:int = 24;
		private static const BITMAP_SIZE:int = 24;

		private static const bmpOo:BitmapData = new EmptySquare(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRk:BitmapData = new RedKing(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRa:BitmapData = new RedAdvisor(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRb:BitmapData = new RedBishop(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRn:BitmapData = new RedKnight(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRr:BitmapData = new RedRook(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRc:BitmapData = new RedCannon(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRp:BitmapData = new RedPawn(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBk:BitmapData = new BlackKing(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBa:BitmapData = new BlackAdvisor(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBb:BitmapData = new BlackBishop(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBn:BitmapData = new BlackKnight(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBr:BitmapData = new BlackRook(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBc:BitmapData = new BlackCannon(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBp:BitmapData = new BlackPawn(BITMAP_SIZE, BITMAP_SIZE);

		// 棋子图片数组
		private static const bmpPieces:Array = new Array(
			bmpOo, null, null, null, null, null, null, null,
			bmpRk, bmpRa, bmpRb, bmpRn, bmpRr, bmpRc, bmpRp, null,
			bmpBk, bmpBa, bmpBb, bmpBn, bmpBr, bmpBc, bmpBp, null
		);

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
		private var bmpSquares:Array = new Array(90);
		private var sqBoardList:Array;

		// 绘制一个格子
		private function drawSquare(sq:int, pc:int):void {
			bmpSquares[sq].bitmapData = bmpPieces[
				pc >= 0 && pc < bmpPieces.length && bmpPieces[pc] != null ? pc : 0
			];
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

		private function clickFlip(e:MouseEvent):void {
			bFlipped = !bFlipped;
			initBoard();
		}

		private function clickBegin(e:MouseEvent):void {
			flushBoard(0);
		}

		private function clickPrev10(e:MouseEvent):void {
			flushBoard(nCurrStep - 10);
		}

		private function clickPrev(e:MouseEvent):void {
			flushBoard(nCurrStep - 1);
		}

		private function clickNext(e:MouseEvent):void {
			flushBoard(nCurrStep + 1);
		}

		private function clickNext10(e:MouseEvent):void {
			flushBoard(nCurrStep + 10);
		}

		private function clickEnd(e:MouseEvent):void {
			flushBoard(nMaxStep);
		}

		// 主过程从这里开始
		public function FlashXQ() {
			var i, j;

			// 初始化棋盘格子
			for (i = 0; i < 10; i ++) {
				for (j = 0; j < 9; j ++) {
					var sq:int = i * 9 + j;
					bmpSquares[sq] = new Bitmap();
					bmpSquares[sq].x = j * SQUARE_SIZE;
					bmpSquares[sq].y = i * SQUARE_SIZE;
					addChild(bmpSquares[sq]);
				}
			}

			// 从HTML中读取"Position", "MoveList", "Step"变量
			var strFen:String = loaderInfo.parameters.Position;
			if (strFen == null) {
				strFen = "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1'"
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
			btnFlip.addEventListener(MouseEvent.CLICK, clickFlip);
			btnBegin.addEventListener(MouseEvent.CLICK, clickBegin);
			btnPrev10.addEventListener(MouseEvent.CLICK, clickPrev10);
			btnPrev.addEventListener(MouseEvent.CLICK, clickPrev);
			btnNext.addEventListener(MouseEvent.CLICK, clickNext);
			btnNext10.addEventListener(MouseEvent.CLICK, clickNext10);
			btnEnd.addEventListener(MouseEvent.CLICK, clickEnd);
		}
	}
}