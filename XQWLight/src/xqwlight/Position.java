package xqwlight;

public class Position {
	private static final int MAX_MOVE_NUM = 256;

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

	private static final byte[] LEGAL_SPAN = new byte[] {
							 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0,
	};

	private static final byte[] KNIGHT_PIN = new byte[] {
									0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,-16,  0,-16,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0, -1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0, -1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0, 16,  0, 16,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		0,  0,  0,  0,  0,  0,  0
	};

	private static final int[] KING_DELTA = {-16, -1, 1, 16}; 
	private static final int[] ADVISOR_DELTA = {-17, -15, 15, 17}; 
	private static final int[][] KNIGHT_DELTA = {{-33, -31}, {-18, 14}, {-14, 18}, {31, 33}}; 
	private static final int[][] KNIGHT_CHECK_DELTA = {{-33, -18}, {-31, -14}, {14, 31}, {18, 33}};
	private static final int[] MVV_VALUE = {0, 50, 10, 10, 30, 40, 30, 20};

	private static final short PIECE_VALUE[][] = {
		{
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  9,  9,  9, 11, 13, 11,  9,  9,  9,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 34, 42, 44, 42, 34, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 32, 37, 37, 37, 32, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 23, 27, 29, 30, 29, 27, 23, 19,  0,  0,  0,  0,
			0,  0,  0, 14, 18, 20, 27, 29, 27, 20, 18, 14,  0,  0,  0,  0,
			0,  0,  0,  7,  0, 13,  0, 16,  0, 13,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  7,  0,  7,  0, 15,  0,  7,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0, 11, 15, 11,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20,  0,  0,  0, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 18,  0,  0, 20, 23, 20,  0,  0, 18,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0, 23,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20, 20,  0, 20, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20,  0,  0,  0, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 18,  0,  0, 20, 23, 20,  0,  0, 18,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0, 23,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0, 20, 20,  0, 20, 20,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0, 90, 90, 90, 96, 90, 96, 90, 90, 90,  0,  0,  0,  0,
			0,  0,  0, 90, 96,103, 97, 94, 97,103, 96, 90,  0,  0,  0,  0,
			0,  0,  0, 92, 98, 99,103, 99,103, 99, 98, 92,  0,  0,  0,  0,
			0,  0,  0, 93,108,100,107,100,107,100,108, 93,  0,  0,  0,  0,
			0,  0,  0, 90,100, 99,103,104,103, 99,100, 90,  0,  0,  0,  0,
			0,  0,  0, 90, 98,101,102,103,102,101, 98, 90,  0,  0,  0,  0,
			0,  0,  0, 92, 94, 98, 95, 98, 95, 98, 94, 92,  0,  0,  0,  0,
			0,  0,  0, 93, 92, 94, 95, 92, 95, 94, 92, 93,  0,  0,  0,  0,
			0,  0,  0, 85, 90, 92, 93, 78, 93, 92, 90, 85,  0,  0,  0,  0,
			0,  0,  0, 88, 85, 90, 88, 90, 88, 90, 85, 88,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,206,208,207,213,214,213,207,208,206,  0,  0,  0,  0,
			0,  0,  0,206,212,209,216,233,216,209,212,206,  0,  0,  0,  0,
			0,  0,  0,206,208,207,214,216,214,207,208,206,  0,  0,  0,  0,
			0,  0,  0,206,213,213,216,216,216,213,213,206,  0,  0,  0,  0,
			0,  0,  0,208,211,211,214,215,214,211,211,208,  0,  0,  0,  0,
			0,  0,  0,208,212,212,214,215,214,212,212,208,  0,  0,  0,  0,
			0,  0,  0,204,209,204,212,214,212,204,209,204,  0,  0,  0,  0,
			0,  0,  0,198,208,204,212,212,212,204,208,198,  0,  0,  0,  0,
			0,  0,  0,200,208,206,212,200,212,206,208,200,  0,  0,  0,  0,
			0,  0,  0,194,206,204,212,200,212,204,206,194,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,100,100, 96, 91, 90, 91, 96,100,100,  0,  0,  0,  0,
			0,  0,  0, 98, 98, 96, 92, 89, 92, 96, 98, 98,  0,  0,  0,  0,
			0,  0,  0, 97, 97, 96, 91, 92, 91, 96, 97, 97,  0,  0,  0,  0,
			0,  0,  0, 96, 99, 99, 98,100, 98, 99, 99, 96,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 96, 96,100, 96, 96, 96, 96,  0,  0,  0,  0,
			0,  0,  0, 95, 96, 99, 96,100, 96, 99, 96, 95,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 96, 96, 96, 96, 96, 96, 96,  0,  0,  0,  0,
			0,  0,  0, 97, 96,100, 99,101, 99,100, 96, 97,  0,  0,  0,  0,
			0,  0,  0, 96, 97, 98, 98, 98, 98, 98, 97, 96,  0,  0,  0,  0,
			0,  0,  0, 96, 96, 97, 99, 99, 99, 97, 96, 96,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		}, {
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  9,  9,  9, 11, 13, 11,  9,  9,  9,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 34, 42, 44, 42, 34, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 24, 32, 37, 37, 37, 32, 24, 19,  0,  0,  0,  0,
			0,  0,  0, 19, 23, 27, 29, 30, 29, 27, 23, 19,  0,  0,  0,  0,
			0,  0,  0, 14, 18, 20, 27, 29, 27, 20, 18, 14,  0,  0,  0,  0,
			0,  0,  0,  7,  0, 13,  0, 16,  0, 13,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  7,  0,  7,  0, 15,  0,  7,  0,  7,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  1,  1,  1,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0, 11, 15, 11,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
			0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
		},
	};

	private static final int BOARD_HANDICAP[][] = {
		{
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0,
			0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 5, 4, 3, 2, 1, 2, 3, 4, 5, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		}, {
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0,
			0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 5, 4, 3, 2, 1, 2, 3, 0, 5, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		}, {
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0,
			0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 5, 0, 3, 2, 1, 2, 3, 0, 5, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		}, {
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 5, 4, 0, 0, 1, 0, 0, 4, 5, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		}
	};

	public static boolean IN_BOARD(int sq) {
		return IN_BOARD[sq] != 0;
	}

	private static boolean IN_FORT(int sq) {
		return IN_FORT[sq] != 0;
	}

//	private static int RANK_Y(int sq) {
//		return sq >> 4;
//	}

//	private static int FILE_X(int sq) {
//		return sq & 15;
//	}

//	private static int COORD_XY(int x, int y) {
//		return x + (y << 4);
//	}

	private static int SQUARE_FLIP(int sq) {
		return 254 - sq;
	}

//	private static int FILE_FLIP(int x) {
//		return 15 - x;
//	}

//	private static int RANK_FLIP(int y) {
//		return 15 - y;
//	}

	private static int SQUARE_FORWARD(int sq, int sd) {
		return sq - 16 + (sd << 5);
	}

//	private static int SQUARE_BACKWARD(int sq, int sd) {
//		return sq + 16 - (sd << 5);
//	}

	private static boolean KING_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 1;
	}

	private static boolean ADVISOR_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 2;
	}

	private static boolean BISHOP_SPAN(int sqSrc, int sqDst) {
		return LEGAL_SPAN[sqDst - sqSrc + 256] == 3;
	}

	private static int BISHOP_PIN(int sqSrc, int sqDst) {
		return (sqSrc + sqDst) >> 1;
	}

	private static int KNIGHT_PIN(int sqSrc, int sqDst) {
		return sqSrc + KNIGHT_PIN[sqDst - sqSrc + 256];
	}

	private static boolean HOME_HALF(int sq, int sd) {
		return (sq & 0x80) != (sd << 7);
	}

	private static boolean AWAY_HALF(int sq, int sd) {
		return (sq & 0x80) == (sd << 7);
	}

	private static boolean SAME_HALF(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0x80) == 0;
	}

//	private static boolean DIFF_HALF(int sqSrc, int sqDst) {
//		return ((sqSrc ^ sqDst) & 0x80) != 0;
//	}

	private static boolean SAME_RANK(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0xf0) == 0;
	}

	private static boolean SAME_FILE(int sqSrc, int sqDst) {
		return ((sqSrc ^ sqDst) & 0x0f) == 0;
	}

	private static int SIDE_TAG(int sd) {
		return 8 + (sd << 3);
	}

	private static int OPP_SIDE_TAG(int sd) {
		return 16 - (sd << 3);
	}

	private static int SRC(int mv) {
		return mv & 255;
	}

	private static int DST(int mv) {
		return mv >> 8;
	}

	private static int PreGen_zobristKeyPlayer;
	private static int PreGen_zobristLockPlayer0;
	private static int PreGen_zobristLockPlayer1;
	private static int[][] PreGen_zobristKeyTable = new int[14][256];
	private static int[][] PreGen_zobristLockTable0 = new int[14][256];
	private static int[][] PreGen_zobristLockTable1 = new int[14][256];

	private static int longRand(int[] seed) {
		long longSeed = seed[0];
		longSeed *= 16807;
		seed[0] = (int) (longSeed % 0x7fffffff);
		return seed[0];
	}

	static {
		int[] seed = new int[1];
		seed[0] = 1;
		PreGen_zobristKeyPlayer = longRand(seed);
		for (int i = 0; i < 14; i ++) {
			for (int j = 0; j < 256; j ++) {
				PreGen_zobristKeyTable[i][j] = longRand(seed);
			}
		}
		PreGen_zobristLockPlayer0 = longRand(seed);
		PreGen_zobristLockPlayer1 = longRand(seed);
		for (int i = 0; i < 14; i ++) {
			for (int j = 0; j < 256; j ++) {
				PreGen_zobristLockTable0[i][j] = longRand(seed);
				PreGen_zobristLockTable1[i][j] = longRand(seed);
			}
		}
	}

	private int sdPlayer;
	private byte[] squares = new byte[256];

	private int zobristKey, zobristLock0, zobristLock1;
	private int vlWhite, vlBlack;
	private int moveNum, distance;

	private int[] mvList = new int[MAX_MOVE_NUM];
	private int[] pcList = new int[MAX_MOVE_NUM];
	private int[] keyList = new int[MAX_MOVE_NUM];
	private boolean[] chkList = new boolean[MAX_MOVE_NUM];

/*
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
*/
	public void clearBoard() {
		sdPlayer = 0;
		for (int sq = 0; sq < 256; sq ++) {
			squares[sq] = 0;
		}
		zobristKey = zobristLock0 = zobristLock1 = 0;
		vlWhite = vlBlack = 0;
	}

	public void setIrrev() {
		mvList[0] = pcList[0] = 0;
		chkList[0] = checked(sdPlayer);
		moveNum = 1;
		distance = 0;
	}

	public void loadBoard(int handicap) {
		clearBoard();
		for (int sq = 0; sq < 128; sq ++) {
			int pc = BOARD_HANDICAP[handicap][sq];
			if (pc > 0) {
				addPiece(128 + sq, pc + 8);
			}
		}
		for (int sq = 0; sq < 128; sq ++) {
			int pc = BOARD_HANDICAP[0][sq];
			if (pc > 0) {
				addPiece(126 - sq, pc + 16);
			}
		}
		setIrrev();
	}

	public void addPiece(int sq, int pc, boolean del) {
		int pcAdjust;
		squares[sq] = (byte) (del ? 0 : pc);
		if (pc < 16) {
			pcAdjust = pc - 9;
			vlWhite += del ? -PIECE_VALUE[pcAdjust][sq] : PIECE_VALUE[pcAdjust][sq];
		} else {
			pcAdjust = pc - 17;
			vlBlack += del ? -PIECE_VALUE[pcAdjust][SQUARE_FLIP(sq)] : PIECE_VALUE[pcAdjust][SQUARE_FLIP(sq)];
			pcAdjust += 7;
		}
		zobristKey ^= PreGen_zobristKeyTable[pcAdjust][sq];
		zobristLock0 ^= PreGen_zobristLockTable0[pcAdjust][sq];
		zobristLock1 ^= PreGen_zobristLockTable1[pcAdjust][sq];
	}

	public void addPiece(int sq, int pc) {
		addPiece(sq, pc, false);
	}

	public void delPiece(int sq, int pc) {
		addPiece(sq, pc, true);
	}

	public int movePiece(int mv) {
		int sqSrc = SRC(mv);
		int sqDst = DST(mv);
		int pcCaptured = squares[sqDst];
		if (pcCaptured > 0) {
			delPiece(sqDst, pcCaptured);
		}
		int pc = squares[sqSrc];
		delPiece(sqSrc, pc);
		addPiece(sqDst, pc);
		return pcCaptured;
	}

	public void undoMovePiece(int mv, int pcCaptured) {
		int sqSrc = SRC(mv);
		int sqDst = DST(mv);
		int pc = squares[sqDst];
		delPiece(sqDst, pc);
		addPiece(sqSrc, pc);
		if (pcCaptured > 0) {
			addPiece(sqDst, pcCaptured);
		}
	}

	public void changeSide() {
		sdPlayer = 1 - sdPlayer;
		zobristKey ^= PreGen_zobristKeyPlayer;
		zobristLock0 ^= PreGen_zobristLockPlayer0;
		zobristLock1 ^= PreGen_zobristLockPlayer1;
	}

	public boolean makeMove(int mv) {
		keyList[moveNum] = zobristKey;
		int pcCaptured = movePiece(mv);
		if (checked(sdPlayer)) {
			undoMovePiece(mv, pcCaptured);
			return false;
		}
		changeSide();
		mvList[moveNum] = mv;
		pcList[moveNum] = pcCaptured;
		chkList[moveNum] = checked(sdPlayer);
		moveNum ++;
		distance ++;
		return true;
	}

	public void undoMakeMove() {
		moveNum --;
		distance --;
		changeSide();
		undoMovePiece(mvList[moveNum], pcList[moveNum]);
	}

	public void nullMove() {
		keyList[moveNum] = zobristKey;
		changeSide();
		mvList[moveNum] = pcList[moveNum] = 0;
		chkList[moveNum] = false;
		moveNum ++;
		distance ++;
	}

	public void undoNullMove() {
		moveNum --;
		distance --;
		changeSide();
	}

	public int generateAllMoves(int[] mvs) {
		return generateMoves(mvs, null);
	}

	public int generateMoves(int[] mvs, int[] vls) {
		int moves = 0;
		int pcSelfSide = SIDE_TAG(sdPlayer);
		int pcOppSide = OPP_SIDE_TAG(sdPlayer);
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
					if (!(IN_BOARD(sqDst) && HOME_HALF(sqDst, sdPlayer) && squares[sqDst] == 0)) {
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
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = sqSrc + (sqDst << 8);
								moves ++;
							}
						} else {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = sqSrc + (sqDst << 8);
								if (vls != null) {
									vls[moves] = MVV_VALUE[pcDst & 7] - 4;
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
				for (int i = 0; i < KING_DELTA.length; i ++) {
					int delta = KING_DELTA[i];
					int sqDst = sqSrc + delta;
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst == 0) {
							if (vls == null) {
								mvs[moves] = sqSrc + (sqDst << 8);
								moves ++;
							}
						} else {
							break;
						}
						sqDst += delta;
					}
					sqDst += delta;
					while (IN_BOARD(sqDst)) {
						int pcDst = squares[sqDst];
						if (pcDst > 0) {
							if ((pcDst & pcOppSide) != 0) {
								mvs[moves] = sqSrc + (sqDst << 8);
								if (vls != null) {
									vls[moves] = MVV_VALUE[pcDst & 7] - 4;
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
				int sqDst = SQUARE_FORWARD(sqSrc, sdPlayer);
				if (IN_BOARD(sqDst)) {
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
				if (AWAY_HALF(sqSrc, sdPlayer)) {
					for (int delta = -1; delta <= 1; delta += 2) {
						sqDst = sqSrc + delta;
						if (IN_BOARD(sqDst)) {
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
				}
				break;
			}
		}
		return moves;
	}

	public boolean legalMove(int mv) {
		int sqSrc = mv & 0xff;
		int pcSrc = squares[sqSrc];
		int pcSelfSide = SIDE_TAG(sdPlayer);
		if ((pcSrc & pcSelfSide) == 0) {
			return false;
		}

		int sqDst = mv >> 8;
		int pcDst = squares[sqDst];
		if ((pcDst & pcSelfSide) != 0) {
			return false;
		}

		switch (pcSrc - pcSelfSide) {
		case PIECE_KING:
			return IN_FORT(sqDst) && KING_SPAN(sqSrc, sqDst);
		case PIECE_ADVISOR:
			return IN_FORT(sqDst) && ADVISOR_SPAN(sqSrc, sqDst);
		case PIECE_BISHOP:
			return SAME_HALF(sqSrc, sqDst) && BISHOP_SPAN(sqSrc, sqDst) && squares[BISHOP_PIN(sqSrc, sqDst)] == 0;
		case PIECE_KNIGHT:
			int sqPin = KNIGHT_PIN(sqSrc, sqDst);
			return sqPin != sqSrc && squares[sqPin] == 0;
		case PIECE_ROOK:
		case PIECE_CANNON:
			int delta;
			if (SAME_RANK(sqSrc, sqDst)) {
				delta = (sqDst < sqSrc ? -1 : 1);				
			} else if (SAME_FILE(sqSrc, sqDst)) {
				delta = (sqDst < sqSrc ? -16 : 16);				
			} else {
				return false;
			}
			sqPin = sqSrc + delta;
			while (sqPin != sqDst) {
				if (squares[sqPin] > 0) {
					break;
				}
				sqPin += delta;
			}
			if (sqPin == sqDst) {
				return sqDst == 0 || pcSrc - pcSelfSide == PIECE_ROOK;
			} else if (pcDst > 0 && pcSrc - pcSelfSide == PIECE_CANNON) {
				sqPin += delta;
				while (sqPin != sqDst) {
					if (squares[sqPin] > 0) {
						break;
					}
					sqPin += delta;
				}
				return sqPin == sqDst;
			} else {
				return false;
			}
		case PIECE_PAWN:
			if (AWAY_HALF(sqDst, sdPlayer) && (sqDst == sqSrc - 1 || sqDst == sqSrc + 1)) {
				return true;
			} else {
				return sqDst == SQUARE_FORWARD(sqSrc, sdPlayer);
			}
		default:
			return false;
		}
	}

	public boolean checked(int sd) {
		int pcSelfSide = SIDE_TAG(sd);
		int pcOppSide = OPP_SIDE_TAG(sd);
		for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
			if (squares[sqSrc] != pcSelfSide + PIECE_KING) {
				continue;
			}
			if (squares[SQUARE_FORWARD(sqSrc, sd)] == pcOppSide + PIECE_PAWN) {
				return true;
			}
			for (int delta = -1; delta <= 1; delta += 2) {
				if (squares[sqSrc + delta] == pcOppSide + PIECE_PAWN) {
					return true;
				}
			}
			for (int i = 0; i < ADVISOR_DELTA.length; i ++) {
				if (squares[sqSrc + ADVISOR_DELTA[i]] != 0) {
					continue;
				}
				for (int j = 0; j < 2; j ++) {
					int pcDst = squares[sqSrc + KNIGHT_CHECK_DELTA[i][j]];
					if (pcDst == pcOppSide + PIECE_KNIGHT) {
						return true;
					}
				}
			}
			for (int i = 0; i < KING_DELTA.length; i ++) {
				int delta = KING_DELTA[i];
				int sqDst = sqSrc + delta;
				while (IN_BOARD(sqDst)) {
					int pcDst = squares[sqDst];
					if (pcDst > 0) {
						if (pcDst == pcOppSide + PIECE_ROOK || pcDst == pcOppSide + PIECE_KING) {
							return true;
						}
						break;
					}
					sqDst += delta;
				}
				sqDst += delta;
				while (IN_BOARD(sqDst)) {
					int pcDst = squares[sqDst];
					if (pcDst > 0) {
						if (pcDst == pcOppSide + PIECE_CANNON) {
							return true;
						}
						break;
					}
					sqDst += delta;
				}
			}
		}
		return false;
	}
}