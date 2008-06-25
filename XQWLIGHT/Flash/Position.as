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

		private static const cnKingDelta:Array = new Array(-16, -1, 1, 16);
		private static const cnAdvisorDelta:Array = new Array(-17, -15, 15, 17);
		private static const cnKnightDelta:Array = new Array(
			new Array(-33, -31), new Array(-18, 14), new Array(-14, 18), new Array(31, 33)
		);
		private static const cnKnightCheckDelta:Array = new Array(
			new Array(-33, -18), new Array(-31, -14), new Array(14, 31), new Array(18, 33)
		);
		private static const cnMvvValue:Array = new Array(50, 10, 10, 30, 40, 30, 20, 0);

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

		public function movePiece(mv:int):int {
			var sqSrc:int = SRC(mv);
			var sqDst:int = DST(mv);
			var pcCaptured:int = pcSquares[sqDst];
			delPiece(sqDst);
			var pc:int = pcSquares[sqSrc];
			delPiece(sqSrc);
			addPiece(sqDst, pc);
			return pcCaptured;
		}

		public function undoMovePiece(mv:int, pcCaptured:int):void {
			var sqSrc:int = SRC(mv);
			var sqDst:int = DST(mv);
			var pc:int = pcSquares[sqDst];
			delPiece(sqDst);
			addPiece(sqSrc, pc);
			addPiece(sqDst, pcCaptured);
		}

		public function makeMove(mv:int):Boolean {
			var pc:int = movePiece(mv);
			if (Checked()) {
				undoMovePiece(mv, pc);
				return false;
			}
			changeSide();
			return true;
		}

		public function generateMoves(mvs:Array, vls:Array):int {
			var nMoves:int = 0;
			var pcSelfSide = SIDE_TAG(sdPlayer);
			var pcOppSide = OPP_SIDE_TAG(sdPlayer);
			var i:int, sqSrc:int, sqDst:int, pcSrc:int, pcDst:int, nDelta:int;
			for (sqSrc = 0; sqSrc < 256; sqSrc ++) {
				var pcSrc:int = pcSquares[sqSrc];
				if ((pcSrc & pcSelfSide) == 0) {
					continue;
				}
				switch (pcSrc - pcSelfSide) {
				case PIECE_KING:
					for (i = 0; i < 4; i ++) {
						sqDst = sqSrc + KING_DELTA[i];
						if (!IN_FORT(sqDst)) {
							continue;
						}
						pcDst = squares[sqDst];
						if (vls == null) {
							if ((pcDst & pcSelfSide) == 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
							}
						} else if ((pcDst & pcOppSide) != 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							vls[moves] = MVV_LVA(pcDst, 5);
							moves ++;
						}
					}
					break;
				case PIECE_ADVISOR:
				for (i = 0; i < 4; i ++) {
					sqDst = sqSrc + ADVISOR_DELTA[i];
					if (!IN_FORT(sqDst)) {
						continue;
					}
					pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 1);
						moves ++;
					}
				}
				break;
			case PIECE_BISHOP:
				for (i = 0; i < 4; i ++) {
					sqDst = sqSrc + ADVISOR_DELTA[i];
					if (!(IN_BOARD(sqDst) && HOME_HALF(sqDst, sdPlayer) && squares[sqDst] == 0)) {
						continue;
					}
					sqDst += ADVISOR_DELTA[i];
					pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 1);
						moves ++;
					}
				}
				break;
			case PIECE_KNIGHT:
				for (i = 0; i < 4; i ++) {
					sqDst = sqSrc + KING_DELTA[i];
					if (squares[sqDst] > 0) {
						continue;
					}
					for (j = 0; j < 2; j ++) {
						sqDst = sqSrc + KNIGHT_DELTA[i][j];
						if (!IN_BOARD(sqDst)) {
							continue;
						}
						pcDst = squares[sqDst];
						if (vls == null) {
							if ((pcDst & pcSelfSide) == 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else if ((pcDst & pcOppSide) != 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							vls[moves] = MVV_LVA(pcDst, 1);
							moves ++;
						}
					}
				}
				break;
			case PIECE_ROOK:
				for (i = 0; i < 4; i ++) {
					delta = KING_DELTA[i];
					sqDst = sqSrc + delta;
					while (IN_BOARD(sqDst)) {
						pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								if (vls != null) {
									vls[moves] = MVV_LVA(pcDst, 4);
								}
								moves ++;
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_CANNON:
				for (i = 0; i < 4; i ++) {
					delta = KING_DELTA[i];
					sqDst = sqSrc + delta;
					while (IN_BOARD(sqDst)) {
						pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								moves ++;
							}
						} else {
							break;
						}
						sqDst += delta;
					}
					sqDst += delta;
					while (IN_BOARD(sqDst)) {
						pcDst = squares[sqDst];
						if (pcDst > 0) {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								if (vls != null) {
									vls[moves] = MVV_LVA(pcDst, 4);
								}
								moves ++;
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_PAWN:
				sqDst = SQUARE_FORWARD(sqSrc, sdPlayer);
				if (IN_BOARD(sqDst)) {
					pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = MOVE(sqSrc, sqDst);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = MOVE(sqSrc, sqDst);
						vls[moves] = MVV_LVA(pcDst, 2);
						moves ++;
					}
				}
				if (AWAY_HALF(sqSrc, sdPlayer)) {
					for (delta = -1; delta <= 1; delta += 2) {
						sqDst = sqSrc + delta;
						if (IN_BOARD(sqDst)) {
							pcDst = squares[sqDst];
							if (vls == null) {
								if ((pcDst & pcSelfSide) == 0) {
									mvs[moves] = MOVE(sqSrc, sqDst);
									moves ++;
								}
							} else if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = MOVE(sqSrc, sqDst);
								vls[moves] = MVV_LVA(pcDst, 2);
								moves ++;
							}
						}
					}
				}
				break;
			}
		}
		return moves;
		}
	}
}