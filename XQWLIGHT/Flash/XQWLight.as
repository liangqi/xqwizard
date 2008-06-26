package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Sound;

	public class XQWLight extends Sprite {
		[Embed("images/board.gif")] private static const BoardBitmap:Class;

		[Embed("pieces/oo.gif")] private static const EmptySquareBitmap:Class;
		[Embed("pieces/rk.gif")] private static const RedKingBitmap:Class;
		[Embed("pieces/ra.gif")] private static const RedAdvisorBitmap:Class;
		[Embed("pieces/rb.gif")] private static const RedBishopBitmap:Class;
		[Embed("pieces/rn.gif")] private static const RedKnightBitmap:Class;
		[Embed("pieces/rr.gif")] private static const RedRookBitmap:Class;
		[Embed("pieces/rc.gif")] private static const RedCannonBitmap:Class;
		[Embed("pieces/rp.gif")] private static const RedPawnBitmap:Class;
		[Embed("pieces/bk.gif")] private static const BlackKingBitmap:Class;
		[Embed("pieces/ba.gif")] private static const BlackAdvisorBitmap:Class;
		[Embed("pieces/bb.gif")] private static const BlackBishopBitmap:Class;
		[Embed("pieces/bn.gif")] private static const BlackKnightBitmap:Class;
		[Embed("pieces/br.gif")] private static const BlackRookBitmap:Class;
		[Embed("pieces/bc.gif")] private static const BlackCannonBitmap:Class;
		[Embed("pieces/bp.gif")] private static const BlackPawnBitmap:Class;

		[Embed("pieces/oos.gif")] private static const SelectedEmptySquareBitmap:Class;
		[Embed("pieces/rks.gif")] private static const SelectedRedKingBitmap:Class;
		[Embed("pieces/ras.gif")] private static const SelectedRedAdvisorBitmap:Class;
		[Embed("pieces/rbs.gif")] private static const SelectedRedBishopBitmap:Class;
		[Embed("pieces/rns.gif")] private static const SelectedRedKnightBitmap:Class;
		[Embed("pieces/rrs.gif")] private static const SelectedRedRookBitmap:Class;
		[Embed("pieces/rcs.gif")] private static const SelectedRedCannonBitmap:Class;
		[Embed("pieces/rps.gif")] private static const SelectedRedPawnBitmap:Class;
		[Embed("pieces/bks.gif")] private static const SelectedBlackKingBitmap:Class;
		[Embed("pieces/bas.gif")] private static const SelectedBlackAdvisorBitmap:Class;
		[Embed("pieces/bbs.gif")] private static const SelectedBlackBishopBitmap:Class;
		[Embed("pieces/bns.gif")] private static const SelectedBlackKnightBitmap:Class;
		[Embed("pieces/brs.gif")] private static const SelectedBlackRookBitmap:Class;
		[Embed("pieces/bcs.gif")] private static const SelectedBlackCannonBitmap:Class;
		[Embed("pieces/bps.gif")] private static const SelectedBlackPawnBitmap:Class;

		[Embed("sounds/click.mp3")] private static const ClickSound:Class;
		[Embed("sounds/illegal.mp3")] private static const IllegalSound:Class;
		[Embed("sounds/move.mp3")] private static const MoveSound:Class;
		[Embed("sounds/move2.mp3")] private static const Move2Sound:Class;
		[Embed("sounds/capture.mp3")] private static const CaptureSound:Class;
		[Embed("sounds/capture2.mp3")] private static const Capture2Sound:Class;
		[Embed("sounds/check.mp3")] private static const CheckSound:Class;
		[Embed("sounds/check2.mp3")] private static const Check2Sound:Class;
		[Embed("sounds/win.mp3")] private static const WinSound:Class;
		[Embed("sounds/draw.mp3")] private static const DrawSound:Class;
		[Embed("sounds/loss.mp3")] private static const LossSound:Class;

		private static const FILE_LEFT:int = Position.FILE_LEFT;
		private static const RANK_TOP:int = Position.RANK_TOP;

		private static const BOARD_EDGE:int = 8;
		private static const SQUARE_SIZE:int = 56;
		private static const BITMAP_SIZE:int = 57;
		private static const BOARD_WIDTH:int = BOARD_EDGE + SQUARE_SIZE * 9 + BOARD_EDGE;
		private static const BOARD_HEIGHT:int = BOARD_EDGE + SQUARE_SIZE * 10 + BOARD_EDGE;

		private static const bmpBoard:BitmapData = Bitmap(new BoardBitmap()).bitmapData;
		private static const bmpOo:BitmapData = Bitmap(new EmptySquareBitmap()).bitmapData;
		private static const bmpRk:BitmapData = Bitmap(new RedKingBitmap()).bitmapData;
		private static const bmpRa:BitmapData = Bitmap(new RedAdvisorBitmap()).bitmapData;
		private static const bmpRb:BitmapData = Bitmap(new RedBishopBitmap()).bitmapData;
		private static const bmpRn:BitmapData = Bitmap(new RedKnightBitmap()).bitmapData;
		private static const bmpRr:BitmapData = Bitmap(new RedRookBitmap()).bitmapData;
		private static const bmpRc:BitmapData = Bitmap(new RedCannonBitmap()).bitmapData;
		private static const bmpRp:BitmapData = Bitmap(new RedPawnBitmap()).bitmapData;
		private static const bmpBk:BitmapData = Bitmap(new BlackKingBitmap()).bitmapData;
		private static const bmpBa:BitmapData = Bitmap(new BlackAdvisorBitmap()).bitmapData;
		private static const bmpBb:BitmapData = Bitmap(new BlackBishopBitmap()).bitmapData;
		private static const bmpBn:BitmapData = Bitmap(new BlackKnightBitmap()).bitmapData;
		private static const bmpBr:BitmapData = Bitmap(new BlackRookBitmap()).bitmapData;
		private static const bmpBc:BitmapData = Bitmap(new BlackCannonBitmap()).bitmapData;
		private static const bmpBp:BitmapData = Bitmap(new BlackPawnBitmap()).bitmapData;

		private static const bmpOos:BitmapData = Bitmap(new SelectedEmptySquareBitmap()).bitmapData;
		private static const bmpRks:BitmapData = Bitmap(new SelectedRedKingBitmap()).bitmapData;
		private static const bmpRas:BitmapData = Bitmap(new SelectedRedAdvisorBitmap()).bitmapData;
		private static const bmpRbs:BitmapData = Bitmap(new SelectedRedBishopBitmap()).bitmapData;
		private static const bmpRns:BitmapData = Bitmap(new SelectedRedKnightBitmap()).bitmapData;
		private static const bmpRrs:BitmapData = Bitmap(new SelectedRedRookBitmap()).bitmapData;
		private static const bmpRcs:BitmapData = Bitmap(new SelectedRedCannonBitmap()).bitmapData;
		private static const bmpRps:BitmapData = Bitmap(new SelectedRedPawnBitmap()).bitmapData;
		private static const bmpBks:BitmapData = Bitmap(new SelectedBlackKingBitmap()).bitmapData;
		private static const bmpBas:BitmapData = Bitmap(new SelectedBlackAdvisorBitmap()).bitmapData;
		private static const bmpBbs:BitmapData = Bitmap(new SelectedBlackBishopBitmap()).bitmapData;
		private static const bmpBns:BitmapData = Bitmap(new SelectedBlackKnightBitmap()).bitmapData;
		private static const bmpBrs:BitmapData = Bitmap(new SelectedBlackRookBitmap()).bitmapData;
		private static const bmpBcs:BitmapData = Bitmap(new SelectedBlackCannonBitmap()).bitmapData;
		private static const bmpBps:BitmapData = Bitmap(new SelectedBlackPawnBitmap()).bitmapData;

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
			var sprite:Sprite = new Sprite();
			var board:Bitmap = new Bitmap();
			board.bitmapData = bmpBoard;
			sprite.addChild(board);
			var sq:int;
			for (sq = 0; sq < 256; sq ++) {
				if (Position.IN_BOARD(sq)) {
					bmpSquares[sq] = new Bitmap();
					bmpSquares[sq].x = BOARD_EDGE + (Position.FILE_X(sq) - FILE_LEFT) * SQUARE_SIZE;
					bmpSquares[sq].y = BOARD_EDGE + (Position.RANK_Y(sq) - RANK_TOP) * SQUARE_SIZE;
					sprite.addChild(bmpSquares[sq]);
				}
			}
			sprite.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addChild(sprite);
			pos.startup();
			drawBoard();
		}
	}
}