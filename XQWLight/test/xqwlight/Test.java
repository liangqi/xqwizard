package xqwlight;

import java.io.IOException;

import com.sun.midp.io.ResourceInputStream;

public class Test {
	public static void main(String[] args) throws IOException {
		ResourceInputStream in = new ResourceInputStream("/TESTPOS.DAT");
		Position pos = new Position();
		int[] mvs = new int[Position.MAX_GEN_MOVES];
		int genMoves = 0;
		int legalMoves = 0;
		int checkPos = 0;
		int sd = in.read();
		while (sd != 255) {
			pos.clearBoard();
			if (sd > 0) {
				pos.changeSide();
			}
			int sq = in.read();
			while (sq > 0) {
                pos.addPiece(sq, in.read());
                sq = in.read();
			}
			genMoves += pos.generateAllMoves(mvs);
			for (int sqSrc = 0; sqSrc < 256; sqSrc ++) {
				if (Position.IN_BOARD(sqSrc)) {
					for (int sqDst = 0; sqDst < 256; sqDst ++) {
						if (Position.IN_BOARD(sqDst)) {
							legalMoves += (pos.legalMove(Position.MOVE(sqSrc, sqDst)) ? 1 : 0);
						}
					}
				}
			}
			checkPos += (pos.checked(pos.sdPlayer) ? 1 : 0);
			sd = in.read();
		}
		System.out.println("GenerateMoves 识别的着法：" + genMoves);
		System.out.println("LegalMoves 识别的着法：" + legalMoves);
		System.out.println("Checked 识别的将军局面：" + checkPos);
		in.close();
	}
}