package net.elephantbase.xqbase.biz;

import java.io.Serializable;
import java.util.ArrayList;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
import net.elephantbase.db.RowCallback;

public class SearchCond implements Serializable {
	private static final long serialVersionUID = 1L;

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
	public int level1 = -1, level2 = -1, level3 = -1;
	public boolean win = true, draw = true, loss = true;

	public SearchCond() {
		// Do Nothing
	}

	public SearchCond(String ecco) {
		if (ecco.length() < 3) {
			return;
		}
		level1 = ecco.charAt(0) - 'A';
		level2 = ecco.charAt(1) - '0';
		level3 = ecco.charAt(2) - '0';
		validate();
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(event == null ? "" : " - " + event);
		sb.append(player1 == null ? "" : " - " + player1);
		sb.append(player2 == null ? "" : " - " + player2);
		String opening = EccoUtil.toOpeningString(level1, level2, level3);
		sb.append(opening == null ? "" : " - " + opening);
		return sb.length() == 0 ? "搜索结果" : sb.substring(3);
	}

	public void validate() {
		if (level1 < 0 || level1 >= EccoUtil.LEVEL_1.length) {
			level1 = -1;
			level2 = -1;
			level3 = -1;
		} else if (level2 < 0 || level2 >= EccoUtil.LEVEL_2[level1].length) {
			level2 = -1;
			level3 = -1;
		} else if (level3 < 0 || level3 >= EccoUtil.LEVEL_3[level1][level2].length) {
			level3 = -1;
		}

		int from = yearFrom * 100 + monthFrom;
		int to = yearTo * 100 + monthTo;
		if (from > to) {
			int t = yearFrom;
			yearFrom = yearTo;
			yearTo = t;
			t = monthFrom;
			monthFrom = monthTo;
			monthTo = t;
		}
	}

	public ArrayList<PgnInfo> search() {
		ArrayList<Object> in = new ArrayList<Object>();
		ArrayList<String> condList = new ArrayList<String>();
		// "Date" Condition
		in.add(Integer.valueOf(yearFrom));
		in.add(Integer.valueOf(yearTo));
		in.add(Integer.valueOf(yearFrom * 100 + monthFrom));
		in.add(Integer.valueOf(yearTo * 100 + monthTo));
		condList.add("(month = -1 AND year >= ? AND year <= ?) OR " +
				"(year * 100 + month >= ? AND year * 100 + month <= ?)");

		// "Event" Condition
		if (event != null) {
			in.add("%" + event + "%");
			condList.add("event LIKE ?");
		}
		// "Player" Condition
		if (player1 != null) {
			in.add(player1);
			if (player2 == null) {
				if (side == SIDE_RED) {
					condList.add("red = ?");
				} else if (side == SIDE_BLACK) {
					condList.add("black = ?");
				} else {
					in.add(player1);
					condList.add("red = ? OR black = ?");
				}
			} else {
				in.add(player2);
				if (side == SIDE_RED) {
					condList.add("red = ? AND black = ?");
				} else if (side == SIDE_BLACK) {
					condList.add("black = ? AND red = ?");
				} else {
					in.add(player1);
					in.add(player2);
					condList.add("(red = ? AND black = ?) OR " +
							"(black = ? AND red = ?)");
				}
			}
		}
		// "ECCO" Condition
		if (level1 >= 0) {
			int from = level1 * 100;
			int to;
			if (level2 < 0) {
				to = from + 99;
			} else {
				from += level2 * 10;
				if (level3 < 0) {
					to = from + 9;
				} else {
					from += level3;
					to = from;
				}
			}
			in.add(Integer.valueOf(from));
			in.add(Integer.valueOf(to));
			condList.add("ecco >= ? AND ecco <= ?");
		}
		// "Result" Condition
		if (!(win && draw && loss)) {
			ArrayList<String> condList2 = new ArrayList<String>();
			if (win) {
				condList2.add("result = 1");
			}
			if (draw) {
				condList2.add("result = 2");
			}
			if (loss) {
				condList2.add("result = 3");
			}
			if (!condList2.isEmpty()) {
				condList.add(DBUtil.or(condList2));
			}
		}
		String sql = "SELECT sid, event, round, date, site, redteam, red, " +
				"blackteam, black, ecco, result FROM xq_pgn WHERE " +
				DBUtil.and(condList) + " LIMIT 100";

		final ArrayList<PgnInfo> resultList = new ArrayList<PgnInfo>();
		DBUtil.query(11, new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				int sid = row.getInt(1);
				String event_ = row.getString(2);
				String round = row.getString(3);
				String date = row.getString(4);
				String site = row.getString(5);
				String redTeam = row.getString(6);
				String red = row.getString(7);
				String blackTeam = row.getString(8);
				String black = row.getString(9);
				int eccoId = row.getInt(10);
				int result_ = row.getInt(11);
				event_ = PgnInfo.toEventString(event_, round);
				String result = PgnInfo.toResultString(redTeam, red,
						blackTeam, black, 0, result_);
				String dateSite = PgnInfo.toDateSiteString(date, site);
				String ecco = EccoUtil.id2ecco(eccoId);
				String opening = EccoUtil.toOpeningString(ecco);
				resultList.add(new PgnInfo(sid, event_, result, dateSite, opening));
				return true;
			}
		}, sql, in.toArray(new Object[0]));
		return resultList;
	}
}