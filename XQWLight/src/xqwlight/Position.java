package xqwlight;

import com.sun.midp.io.ResourceInputStream;

public class Position {
	private static final int PIECE_KING = 1;
	private static final int PIECE_ADVISOR = 2;
	private static final int PIECE_BISHOP = 3;
	private static final int PIECE_KNIGHT = 4;
	private static final int PIECE_ROOK = 5;
	private static final int PIECE_CANNON = 6;
	private static final int PIECE_PAWN = 7;

	private static final byte[] IN_BOARD = new byte[] {
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
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	};

	private static final byte[] IN_FORT = new byte[] {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	};

	public static boolean IN_BOARD(int sq) {
		return IN_BOARD[sq] != 0;
	}

	public static boolean IN_FORT(int sq) {
		return IN_FORT[sq] != 0;
	}

	public static boolean HOME_HALF(int sq, int sd) {
		return (sq & 0x80) != (sd << 7);
	}

	public static boolean AWAY_HALF(int sq, int sd) {
		return (sq & 0x80) == (sd << 7);
	}

	public static int SELF_SIDE(int sd) {
		return 8 + (sd << 3);
	}

	public static int OPP_SIDE(int sd) {
		return 16 - (sd << 3);
	}

	private byte squares[] = new byte[256];
	private int sdPlayer = 0;

	public int getPiece(int sq) {
		return squares[sq];
	}

	public void setPiece(int sq, int pc) {
		squares[sq] = (byte) pc;
	}

	public int getPlayer() {
		return sdPlayer;
	}

	public void setPlayer(int sd) {
		sdPlayer = sd;
	}

	public boolean homeHalf(int sq) {
		return HOME_HALF(sq, sdPlayer);
	}

	public boolean awayHalf(int sq) {
		return AWAY_HALF(sq, sdPlayer);
	}

	public void clearBoard() {
		for (int sq = 0; sq < 256; sq ++) {
			squares[sq] = 0;
		}
		sdPlayer = 0;
	}

	private static final int[] KING_DELTA = {-16, -1, 1, 16}; 
	private static final int[] ADVISOR_DELTA = {-17, -15, 15, 17}; 
	private static final int[][] KNIGHT_DELTA = {{-33, -31}, {-18, 14}, {-14, 18}, {31, 33}}; 
	private static final int[][] KNIGHT_CHECK_DELTA = {{-33, -18}, {-31, -14}, {14, 31}, {18, 33}};
	private static final int[] MVV_VALUE = {0, 50, 10, 10, 30, 40, 30, 20};

	public int generateMoves(int[] mvs, int[] vls) {
		int moves = 0;
		int pcSelfSide = SELF_SIDE(sdPlayer);
		int pcOppSide = OPP_SIDE(sdPlayer);
		for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
			int pcSrc = squares[sqSrc];
			if ((pcSrc & pcSelfSide) != 0) {
				continue;
			}
			switch (pcSrc - pcSelfSide) {
			case PIECE_KING:
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int sqDst = sqSrc + KING_DELTA[i];
					if (!IN_FORT(sqDst)) {
						continue;
					}
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = sqSrc + (sqDst << 8);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = sqSrc + (sqDst << 8);
						vls[moves] = MVV_VALUE[pcDst & 7] - 5;
						moves ++;
					}
				}
				break;
			case PIECE_ADVISOR:
				for (int i = 0; i < ADVISOR_DELTA.length; i ++) {
					int sqDst = sqSrc + ADVISOR_DELTA[i];
					if (IN_FORT(sqDst)) {
						continue;
					}
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = sqSrc + (sqDst << 8);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = sqSrc + (sqDst << 8);
						vls[moves] = MVV_VALUE[pcDst & 7] - 1;
						moves ++;
					}
				}
				break;
			case PIECE_BISHOP:
				for (int i = 0; i < ADVISOR_DELTA.length; i ++) {
					int sqDst = sqSrc + ADVISOR_DELTA[i];
					if (!(IN_BOARD(sqDst) && homeHalf(sqDst) && squares[sqDst] == 0)) {
						continue;
					}
					sqDst += ADVISOR_DELTA[i];
					int pcDst = squares[sqDst];
					if (vls == null) {
						if ((pcDst & pcSelfSide) == 0) {
							mvs[moves] = sqSrc + (sqDst << 8);
							moves ++;
						}
					} else if ((pcDst & pcOppSide) != 0) {
						mvs[moves] = sqSrc + (sqDst << 8);
						vls[moves] = MVV_VALUE[pcDst & 7] - 1;
						moves ++;
					}
				}
				break;
			case PIECE_KNIGHT:
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int sqDst = sqSrc + KING_DELTA[i];
					if (squares[sqDst] != 0) {
						continue;
					}
					for (int j = 0; j < 2; j ++) {
						sqDst = sqSrc + KNIGHT_DELTA[i][j];
						if (!IN_BOARD(sqDst)) {
							continue;
						}
						int pcDst = squares[sqDst];
						if (vls == null) {
							if ((pcDst & pcSelfSide) == 0) {
								mvs[moves] = sqSrc + (sqDst << 8);
								moves ++;
							}
						} else if ((pcDst & pcOppSide) != 0) {
							mvs[moves] = sqSrc + (sqDst << 8);
							vls[moves] = MVV_VALUE[pcDst & 7] - 1;
							moves ++;
						}
					}
				}
				break;
			case PIECE_ROOK:
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (inBoard(sqDst)) {
						Piece pcDst = getPiece(sqDst);
						if (pcDst == null) {
							result.add(new Move(sqSrc, sqDst, pcDst));
						} else {
							if (pcDst.getColor() != toMove) {
								result.add(new Move(sqSrc, sqDst, pcDst));
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_CANNON:
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (inBoard(sqDst)) {
						Piece pcDst = getPiece(sqDst);
						if (pcDst == null) {
							result.add(new Move(sqSrc, sqDst, pcDst));
						} else {
							break;
						}
						sqDst += delta;
					}
					sqDst += delta;
					while (inBoard(sqDst)) {
						Piece pcDst = getPiece(sqDst);
						if (pcDst != null) {
							if (pcDst.getColor() != toMove) {
								result.add(new Move(sqSrc, sqDst, pcDst));
							}
							break;
						}
						sqDst += delta;
					}
				}
				break;
			case PIECE_PAWN:
				int sqDst = sqSrc + (toMove == ColorType.WHITE ? -RANK_SIZE : RANK_SIZE);
				if (inBoard(sqDst)) {
					addMove(result, sqSrc, sqDst);
				}
				if (awaySide(sqSrc)) {
					for (int delta = -1; delta <= 1; delta += 2) {
						sqDst = sqSrc + delta;
						if (inBoard(sqDst)) {
							addMove(result, sqSrc, sqDst);
						}
					}
				}
				break;
			}
		}
		return result;
	}

	public boolean inCheck() {
		for (int sqSrc = 0; sqSrc < BOARD_SIZE; sqSrc ++) {
			Piece pcSrc = getPiece(sqSrc);
			if (pcSrc != null && pcSrc.getPiece() == PieceType.KING && pcSrc.getColor() == toMove) {
				Piece pcDst = getPiece(sqSrc + (toMove == ColorType.WHITE ? -RANK_SIZE : RANK_SIZE));
				if (pcDst != null && pcDst.getPiece() == PieceType.PAWN && pcDst.getColor() != toMove) {
					return true;
				}
				for (int delta = -1; delta <= 1; delta += 2) {
					pcDst = getPiece(sqSrc + (delta == 0 ? (toMove == ColorType.WHITE ? -RANK_SIZE : RANK_SIZE) : delta));
					if (pcDst != null && pcDst.getPiece() == PieceType.PAWN && pcDst.getColor() != toMove) {
						return true;
					}
				}
				for (int i = 0; i < ADVISOR_DELTA.length; i ++) {
					if (getPiece(sqSrc + ADVISOR_DELTA[i]) == null) {
						for (int j = 0; j < 2; j ++) {
							pcDst = getPiece(sqSrc + KNIGHT_CHECK_DELTA[i][j]);
							if (pcDst != null && pcDst.getPiece() == PieceType.KNIGHT && pcDst.getColor() != toMove) {
								return true;
							}
						}
					}
				}
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (inBoard(sqDst)) {
						pcDst = getPiece(sqDst);
						if (pcDst != null) {
							if (pcDst.getColor() != toMove && (pcDst.getPiece() == PieceType.KING || pcDst.getPiece() == PieceType.ROOK)) {
								return true;
							}
							break;
						}
						sqDst += delta;
					}
					sqDst += delta;
					while (inBoard(sqDst)) {
						pcDst = getPiece(sqDst);
						if (pcDst != null) {
							if (pcDst.getPiece() == PieceType.CANNON && pcDst.getColor() != toMove) {
								return true;
							}
							break;
						}
						sqDst += delta;
					}
				}
				return false;
			}
		}
		return false;
	}
}