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
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.utils.Timer;

	public class FlashXQ extends Sprite {

		// 把字符转换为数字
		function Char2Digit(c:String):Number {
			switch (c) {
			case '1':
				return 1;
			case '2':
				return 2;
			case '3':
				return 3;
			case '4':
				return 4;
			case '5':
				return 5;
	case '6':
		return 6;
	case '7':
		return 7;
	case '8':
		return 8;
	case '9':
		return 9;
	default:
		return 0;
	}
}

// 把纵坐标转换为数字
function Char2File(c:String):Number {
	switch (c) {
	case 'A':
		return 0;
	case 'B':
		return 1;
	case 'C':
		return 2;
	case 'D':
		return 3;
	case 'E':
		return 4;
	case 'F':
		return 5;
	case 'G':
		return 6;
	case 'H':
		return 7;
	case 'I':
		return 8;
	default:
		return 0;
	}
}

// 把横坐标转换为数字
function Char2Rank(c:String):Number {
	return 9 - Char2Digit(c);
}

// 把字符转换为棋子代号
function Char2Piece(c:String):Number {
	switch (c) {
	case 'K':
		return 1;
	case 'A':
		return 2;
	case 'B':
	case 'E':
		return 3;
	case 'N':
	case 'H':
		return 4;
	case 'R':
		return 5;
	case 'C':
		return 6;
	case 'P':
		return 7;
	case 'k':
		return 8;
	case 'a':
		return 9;
	case 'b':
	case 'e':
		return 10;
	case 'n':
	case 'h':
		return 11;
	case 'r':
		return 12;
	case 'c':
		return 13;
	case 'p':
		return 14;
	default:
		return 0;
	}
}

// 初始化图片
var bmpPieces:Array = new Array(15);
bmpPieces[0] = BitmapData.loadBitmap("oo.gif");
bmpPieces[1] = BitmapData.loadBitmap("rk.gif");
bmpPieces[2] = BitmapData.loadBitmap("ra.gif");
bmpPieces[3] = BitmapData.loadBitmap("rb.gif");
bmpPieces[4] = BitmapData.loadBitmap("rn.gif");
bmpPieces[5] = BitmapData.loadBitmap("rr.gif");
bmpPieces[6] = BitmapData.loadBitmap("rc.gif");
bmpPieces[7] = BitmapData.loadBitmap("rp.gif");
bmpPieces[8] = BitmapData.loadBitmap("bk.gif");
bmpPieces[9] = BitmapData.loadBitmap("ba.gif");
bmpPieces[10] = BitmapData.loadBitmap("bb.gif");
bmpPieces[11] = BitmapData.loadBitmap("bn.gif");
bmpPieces[12] = BitmapData.loadBitmap("br.gif");
bmpPieces[13] = BitmapData.loadBitmap("bc.gif");
bmpPieces[14] = BitmapData.loadBitmap("bp.gif");

// 从HTML中读取"Position", "MoveList", "Step"变量
if (Position == null) {
	Position = 'rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1';
}
if (MoveList == null) {
	MoveList = "";
}
if (Step == null) {
	Step = 0;
}

// 解析走法列表
var sqSrcList:Array = new Array();
var sqDstList:Array = new Array();
for (var i:Number = 0; i < MoveList.length - 4; i += 6) {
	var xSrc:Number = Char2File(MoveList.charAt(i));
	var ySrc:Number = Char2Rank(MoveList.charAt(i + 1));
	var xDst:Number = Char2File(MoveList.charAt(i + 3));
	var yDst:Number = Char2Rank(MoveList.charAt(i + 4));
	sqSrcList.push(ySrc * 9 + xSrc);
	sqDstList.push(yDst * 9 + xDst);
}

// 生成局面数组
var sqBoardList:Array = new Array(sqSrcList.length + 1);
for (var i:Number = 0; i < sqBoardList.length; i ++) {
	sqBoardList[i] = new Array(90);
	for (var j:Number = 0; j < 90; j ++) {
		sqBoardList[i][j] = 0;
	}
}

// 解析FEN串，读入"sqBoardList[0]"
var j:Number = 0;
var k:Number = 0;
for (var i:Number = 0; i < Position.length; i ++) {
	var c:String = Position.charAt(i);
	if (c == ' ') {
		break;
	} else if (c == '/') {
		j ++;
		if (j == 10) {
			break;
		}
		k = 0;
	} else {
		var n:Number = Char2Digit(c);
		if (n == 0) {
			if (k < 9) {
				sqBoardList[0][j * 9 + k] = Char2Piece(c);
				k ++;
			}
		} else {
			for (var m:Number = 0; m < n; m ++) {
				if (k < 9) {
					sqBoardList[0][j * 9 + k] = 0;
					k ++;
				}
			}
		}
	}
}

// 根据走法给每个"sqBoardList"赋值
for (var i:Number = 1; i < sqBoardList.length; i ++) {
	for (var j:Number = 0; j < 90; j ++) {
		sqBoardList[i][j] = sqBoardList[i - 1][j];
	}
	var sqSrc:Number = sqSrcList[i - 1];
	var sqDst:Number = sqDstList[i - 1];
	if (sqSrc == sqDst) {
		// 仕相升变成兵
		sqBoardList[i][sqDst] = (sqBoardList[i][sqDst] > 7 ? 14 : 7);
	} else {
		sqBoardList[i][sqDst] = sqBoardList[i][sqSrc];
		sqBoardList[i][sqSrc] = 0;
	}
}

// 状态：原来的棋盘，现在的棋盘，是否翻转
var nMaxStep:Number = sqBoardList.length - 1;
var nOldStep:Number = (Step < 0 ? 0 : Step > nMaxStep ? nMaxStep : Step);
var bFlipped:Boolean = false;

// 初始化格子
var mcSquares:Array = new Array(90);
for (var i:Number = 0; i < 90; i ++) {
	mcSquares[i] = createEmptyMovieClip("mcSquares_" + i, i);
}

// 绘制一个格子
function DrawSquare(sq:Number, pc:Number) {
	mcSquares[sq].clear();
	mcSquares[sq] = createEmptyMovieClip("mcSquares_" + sq, sq);
	mcSquares[sq]._x = (bFlipped ? 8 - sq % 9 : sq % 9) * 24;
	mcSquares[sq]._y = (bFlipped ? 9 - int(sq / 9) : int(sq / 9)) * 24;
	mcSquares[sq].attachBitmap(bmpPieces[pc], sq)
}

// 重绘棋盘上的所有格子
function InitBoard() {
	for (var i:Number = 0; i < 90; i ++) {
		DrawSquare(i, sqBoardList[nOldStep][i]);
	}
	txtStep.text = nOldStep + "/" + nMaxStep;
}

// 绘制与上一局面不同的格子
function FlushBoard(nNewStep:Number) {
	nNewStep = (nNewStep < 0 ? 0 : nNewStep > nMaxStep ? nMaxStep : nNewStep);
	for (var i:Number = 0; i < 90; i ++) {
		if (sqBoardList[nOldStep][i] != sqBoardList[nNewStep][i]) {
			DrawSquare(i, sqBoardList[nNewStep][i]);
		}
	}
	nOldStep = nNewStep;
	txtStep.text = nOldStep + "/" + nMaxStep;
}

InitBoard();

btnFlip.onRelease = function() {
	bFlipped = !bFlipped;
	InitBoard();
}

btnBegin.onRelease = function() {
	FlushBoard(0);
}

btnBack10.onRelease = function() {
	FlushBoard(nOldStep - 10);
}

btnBack.onRelease = function() {
	FlushBoard(nOldStep - 1);
}

btnNext.onRelease = function() {
	FlushBoard(nOldStep + 1);
}

btnNext10.onRelease = function() {
	FlushBoard(nOldStep + 10);
}

btnEnd.onRelease = function() {
	FlushBoard(nMaxStep);
}

	}
}