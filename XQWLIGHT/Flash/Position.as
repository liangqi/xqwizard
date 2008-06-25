package {
	public class Position {
		private static const cnInBoard:Array = new Array(
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		);

		private static const cnInFort:Array = new Array(
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		);

		private static const cpcStartup:Array = new Array(
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0,20,19,18,17,16,17,18,19,20, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0,21, 0, 0, 0, 0, 0,21, 0, 0, 0, 0, 0,
			0, 0, 0,22, 0,22, 0,22, 0,22, 0,22, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0,14, 0,14, 0,14, 0,14, 0,14, 0, 0, 0, 0,
			0, 0, 0, 0,13, 0, 0, 0, 0, 0,13, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0,12,11,10, 9, 8, 9,10,11,12, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		);

		public static const RANK_TOP:int = 3;
		public static const RANK_BOTTOM:int = 12;
		public static const FILE_LEFT:int = 3;
		public static const FILE_RIGHT:int = 11;

		public static const PIECE_KING:int = 0;
		public static const PIECE_ADVISOR:int = 1;
		public static const PIECE_BISHOP:int = 2;
		public static const PIECE_KNIGHT:int = 3;
		public static const PIECE_ROOK:int = 4;
		public static const PIECE_CANNON:int = 5;
		public static const PIECE_PAWN:int = 6;

		public static function RANK_Y(sq:int):int {
			return sq >> 4;
		}

		public static function FILE_X(sq:int):int {
			return sq & 15;
		}

		public static function COORD_XY(x:int, y:int):int {
			return x + (y << 4);
		}

		public static function SQUARE_FLIP(sq:int):int {
			return 254 - sq;
		}

		public static function IN_BOARD(sq:int):Boolean {
			return cnInBoard[sq] != 0;
		}

		public static function IN_FORT(sq:int):Boolean {
			return cnInFort[sq] != 0;
		}

		public static function FILE_FLIP(x:int):int {
			return 14 - x;
		}

		public static function RANK_FLIP(y:int):int {
			return 15 - y;
		}

		public static function SIDE_TAG(sd:int):int {
			return 8 + (sd << 3);
		}

		public static function OPP_SIDE_TAG(sd:int):int {
			return 16 - (sd << 3);
		}

		public static function SRC(mv:int):int {
			return mv & 255;
		}

		public static function DST(mv:int):int {
			return mv >> 8;
		}

		public static function MOVE(sqSrc:int, sqDst:int):int {
			return sqSrc + sqDst * 256;
		}

		public var pcSquares:Array = new Array(256);
		public var sdPlayer:int = 0;

		public function startup():void {
			var sq:int;
			for (sq = 0; sq < 256; sq ++) {
				pcSquares[sq] = cpcStartup[sq];
			}
			sdPlayer = 0;
		}

		public function changeSide():void {
			sdPlayer = 1 - sdPlayer;
		}

		public function addPiece(sq:int, pc:int):void {
			pcSquares[sq] = pc;
		}

		public function delPiece(sq:int):void {
			pcSquares[sq] = 0;
		}

		public function movePiece(mv:int):void {
			var sqSrc:int = SRC(mv);
			var sqDst:int = DST(mv);
			var pcCaptured:int = pcSquares[sqDst];
			delPiece(sqDst);
			var pc:int = pcSquares[sqSrc];
			delPiece(sqSrc);
			addPiece(sqDst, pc);
		}

		public function makeMove(mv:int):void {
			movePiece(mv);
			changeSide();
		}
	}
}