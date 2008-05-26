package xqphd;

import xqwlight.Position;

public class MoveParser {
	private static final int DIRECT_TO_POS = 5;

	private static final String PIECE_TO_CHAR = "KABNRCP";

	private static final String[] DIGIT_TO_WORD = {
		"一二三四五六七八九", "１２３４５６７８９", "きせ", "⒈⒉⒊⒋⒌⒍⒎⒏"
	};

	private static final String[] PIECE_TO_WORD = {
		"帅仕相马车炮兵", "将士象马车炮卒", "皑ó", "盢禜皑ó"
	};

	private static final String[] DIRECT_TO_WORD = {
		"进平退", "秈キ癶"
	};

	private static final String[] POS_TO_WORD = {
		"一二三四五前中后", "⒈⒉⒊⒋玡い"
	};

	private static int char2Digit(int c) {
		return c >= '1' && c <= '9' ? c - '1' : -1;
	}

	private static int char2Piece(int c) {
		if (c >= 'a' && c <= 'z') {
			return c == 'e' ? 2 : c == 'h' ? 3 : PIECE_TO_CHAR.indexOf(c  - 'a' + 'A');
		}
		return c == 'E' ? 2 : c == 'H' ? 3 : PIECE_TO_CHAR.indexOf(c);
	}

	private static int char2Direct(int c) {
		return c == '+' ? 0 : c == '.' || c == '=' ? 1 : c == '-' ? 2 : -1;
	}

	private static int char2Pos(int c) {
		if (c >= 'a' && c <= 'e') {
			return c - 'a';
		}
		int dir = char2Direct(c);
		return dir == -1 ? -1 : dir + DIRECT_TO_POS;
	}

	private static int word2Digit(int w) {
		for (int i = 0; i < DIGIT_TO_WORD.length; i ++) {
			int index = DIGIT_TO_WORD[i].charAt(w);
			if (index >= 0) {
				return index;
			}
		}
		return -1;
	}

	private static int word2Piece(int w) {
		if (false) {
			// Code Style
		} else if (w == '帥' || w == '將') {
			return 0;
		} else if (w == '馬' || w == '傌' || w == '豖') { // 豖[傌]
			return 3;
		} else if (w == '車' || w == '硨' || w == '谙' || w == '俥') { // 谙[硨]
			return 4;
		} else if (w == '包' || w == '' || w == '砲' || w == '') { // [包], [砲]
			return 5;
		}
		for (int i = 0; i < PIECE_TO_WORD.length; i ++) {
			int index = PIECE_TO_WORD[i].charAt(w);
			if (index >= 0) {
				return index;
			}
		}
		return -1;
	}

	private static int word2Direct(int w) {
		if (w == '進') {
			return 0;
		}
		for (int i = 0; i < POS_TO_WORD.length; i ++) {
			int index = POS_TO_WORD[i].charAt(w);
			if (index >= 0) {
				return index;
			}
		}
		return -1;
	}

	private static int word2Pos(int w) {
		if (w == '後' || w == '') { // [后]
			return DIRECT_TO_POS + 2;
		}
		for (int i = 0; i < DIRECT_TO_WORD.length; i ++) {
			int index = DIRECT_TO_WORD[i].charAt(w);
			if (index >= 0) {
				return index;
			}
		}
		return -1;
	}

	public static int file2Move(String strFile, Position pos) {
		return 0;
	}

	public static int iccs2Move(String strIccs) {
		return 0;
	}

	public static String chin2File(String strChin) {
		char[] c = new char[4];
		
		return new String(c);
	}
}