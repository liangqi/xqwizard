package net.elephantbase.pgndb.biz;

public class SearchCond {
	public static final int YEAR_FROM = 1990;
	public static final int YEAR_TO = 2010;
	public static final int MONTH_FROM = 1;
	public static final int MONTH_TO = 12;

	public static final int SIDE_BOTH = 0;
	public static final int SIDE_RED = 1;
	public static final int SIDE_BLACK = 2;

	public static String[] SIDE_CHOICES = {
		"不限先后", "先手对", "后手对"
	};

	public String event = null;
	public int yearFrom = YEAR_FROM, yearTo = YEAR_TO;
	public int monthFrom = MONTH_FROM, monthTo = MONTH_TO;
	public int side = 0;
	public String player1 = null, player2 = null;
	public int level1 = 0, level2 = 0, level3 = 0;
	public boolean win = true, draw = true, loss = true;

	public SearchCond() {
		// Do Nothing
	}

	public SearchCond(String ecco) {
		// TODO
	}
}