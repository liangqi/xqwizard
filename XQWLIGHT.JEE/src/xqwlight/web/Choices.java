package xqwlight.web;

import java.util.Arrays;
import java.util.List;

public class Choices {
	public static final String FLIPPED_FALSE = "我先走";
	public static final String FLIPPED_TRUE = "电脑先走";

	private static List<String> lstFlipped = Arrays.asList(new String[] {
		FLIPPED_FALSE, FLIPPED_TRUE
	});

	public static List<String> getFlippedTypes() {
		return lstFlipped;
	}

	private static List<String> lstHandicap = Arrays.asList(new String[] {
		"不让子", "让左马", "让双马", "让九子"
	});

	public static List<String> getHandicapTypes() {
		return lstHandicap;
	}

	private static List<String> lstBoard = Arrays.asList(new String[] {
		"栎木", "绿色大理石", "白色大理石", "再生纸", "画布", "水滴", "浅红象棋"
	});

	public static List<String> getBoardTypes() {
		return lstBoard;
	}

	private static List<String> lstPieces = Arrays.asList(new String[] {
		"木刻", "精致", "光泽"
	});

	public static List<String> getPiecesTypes() {
		return lstPieces;
	}

	private static List<String> lstMusic = Arrays.asList(new String[] {
		"古典", "紧张", "风趣", "圆舞曲", "莫扎特一", "莫扎特四", "爱之梦",
		"月光", "皮尔·金特", "幽默曲", "铃儿响叮当", "仙剑奇侠传", "天策府",
	});

	public static List<String> getMusicTypes() {
		return lstMusic;
	}
}