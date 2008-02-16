package xqwajax.web;

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
}