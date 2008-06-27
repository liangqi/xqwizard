package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Sound;

	public class XQWLight extends Sprite {
		private static const FILE_LEFT:int = Position.FILE_LEFT;
		private static const RANK_TOP:int = Position.RANK_TOP;

		private static const BOARD_EDGE:int = 8;
		private static const SQUARE_SIZE:int = 56;
		private static const BITMAP_SIZE:int = 57;
		private static const BOARD_WIDTH:int = BOARD_EDGE + SQUARE_SIZE * 9 + BOARD_EDGE;
		private static const BOARD_HEIGHT:int = BOARD_EDGE + SQUARE_SIZE * 10 + BOARD_EDGE;

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

		private static const bmpOos:BitmapData = new EmptySquareSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRks:BitmapData = new RedKingSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRas:BitmapData = new RedAdvisorSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRbs:BitmapData = new RedBishopSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRns:BitmapData = new RedKnightSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRrs:BitmapData = new RedRookSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRcs:BitmapData = new RedCannonSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpRps:BitmapData = new RedPawnSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBks:BitmapData = new BlackKingSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBas:BitmapData = new BlackAdvisorSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBbs:BitmapData = new BlackBishopSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBns:BitmapData = new BlackKnightSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBrs:BitmapData = new BlackRookSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBcs:BitmapData = new BlackCannonSelected(BITMAP_SIZE, BITMAP_SIZE);
		private static const bmpBps:BitmapData = new BlackPawnSelected(BITMAP_SIZE, BITMAP_SIZE);

		private static const sndClick:Sound = new ClickSound();
		private static const sndIllegal:Sound = new IllegalSound();
		private static const sndMove:Sound = new MoveSound();
		private static const sndMove2:Sound = new Move2Sound();
		private static const sndCapture:Sound = new CaptureSound();
		private static const sndCapture2:Sound = new Capture2Sound();
		private static const sndCheck:Sound = new CheckSound();
		private static const sndCheck2:Sound = new Check2Sound();
		private static const sndWin:Sound = new WinSound();
		private static const sndDraw:Sound = new DrawSound();
		private static const sndLoss:Sound = new LossSound();

		private const bmpPieces:Array = new Array(
			bmpOo, null, null, null, null, null, null, null,
			bmpRk, bmpRa, bmpRb, bmpRn, bmpRr, bmpRc, bmpRp, null,
			bmpBk, bmpBa, bmpBb, bmpBn, bmpBr, bmpBc, bmpBp, null
		);

		private const bmpSelected:Array = new Array(
			bmpOos, null, null, null, null, null, null, null,
			bmpRks, bmpRas, bmpRbs, bmpRns, bmpRrs, bmpRcs, bmpRps, null,
			bmpBks, bmpBas, bmpBbs, bmpBns, bmpBrs, bmpBcs, bmpBps, null
		);

		private var bmpSquares:Array = new Array(256);
		private var pos:Position = new Position();
		private var bFlipped:Boolean = false;
		private var sqSelected:int = 0, mvLast:int = 0;

		private const DRAW_SELECTED:Boolean = true;

		private function drawSquare(sq:int, bSelected:Boolean = false):void {
			var pc:int = pos.pcSquares[sq];
			sq = bFlipped ? Position.SQUARE_FLIP(sq) : sq;
			bmpSquares[sq].bitmapData = bSelected ? bmpSelected[pc] : bmpPieces[pc];
		}

		private function drawMove(mv:int, bSelected:Boolean = false):void {
			drawSquare(Position.SRC(mvLast), bSelected);
			drawSquare(Position.DST(mvLast), bSelected);
		}

		private function clickSquare(sq:int):void {
			sq = bFlipped ? Position.SQUARE_FLIP(sq) : sq;
			var pc:int = pos.pcSquares[sq];
			if ((pc & Position.SIDE_TAG(pos.sdPlayer)) != 0) {
				if (sqSelected != 0) {
					drawSquare(sqSelected);
				}
				sqSelected = sq;
				drawSquare(sq, DRAW_SELECTED);
				if (mvLast != 0) {
					drawMove(mvLast);
				}
				sndClick.play();
			} else if (sqSelected != 0) {
				var mv:int = Position.MOVE(sqSelected, sq);
				if (pos.legalMove(mv)) {
					if (pos.makeMove(mv)) {
						mvLast = mv;
						drawMove(mvLast, DRAW_SELECTED);
						sqSelected = 0;
						if (pos.isMate()) {
							sndWin.play();
						} else if (pos.checked()) {
							sndCheck.play();
						} else if (pc != 0) {
							sndCapture.play();
						} else {
							sndMove.play();
						}
					} else {
						sndIllegal.play();
					}
				}
			}
		}

		private function onClick(e:MouseEvent):void {
			var xx:int = FILE_LEFT + (e.localX - BOARD_EDGE) / SQUARE_SIZE;
			var yy:int = RANK_TOP + (e.localY - BOARD_EDGE) / SQUARE_SIZE;
			if (xx >= FILE_LEFT && xx <= Position.FILE_RIGHT && yy >= RANK_TOP && yy <= Position.RANK_BOTTOM) {
				clickSquare(Position.COORD_XY(xx, yy));
			}
		}

		private function drawBoard():void {
			var sq:int;
			for (sq = 0; sq < 256; sq ++) {
				if (Position.IN_BOARD(sq)) {
					drawSquare(sq);
				}
			}
		}

		public function XQWLight() {
			var board:Sprite = new Sprite();
			var sq:int;
			for (sq = 0; sq < 256; sq ++) {
				if (Position.IN_BOARD(sq)) {
					bmpSquares[sq] = new Bitmap();
					bmpSquares[sq].x = BOARD_EDGE + (Position.FILE_X(sq) - FILE_LEFT) * SQUARE_SIZE;
					bmpSquares[sq].y = BOARD_EDGE + (Position.RANK_Y(sq) - RANK_TOP) * SQUARE_SIZE;
					board.addChild(bmpSquares[sq]);
				}
			}
			board.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addChild(board);
			pos.startup();
			drawBoard();
		}
	}
}