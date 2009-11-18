package net.elephantbase.pgndb.biz;

import java.io.Serializable;

public class PgnInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	public static String toEventString(String event, String round) {
		if (round.isEmpty()) {
			return event;
		}
		String strEvent = (event.isEmpty() ? "" : event + " ");
		try {
			return strEvent + "第" + Integer.parseInt(round) + "轮";
		} catch (Exception e) {
			return strEvent + round;
		}
	}

	private static final String[][] START_RESULT_1 = {
		{"红先", "红先胜", "红先和", "红先负"},
		{"黑先", "黑先负", "黑先和", "黑先胜"},
	};

	private static final String[][] START_RESULT_2 = {
		{"对", "先胜", "先和", "先负"},
		{"对", "后胜", "后和", "后负"},
	};

	public static String toResultString(String redTeam, String red,
			String blackTeam, String black, int start, int result) {
		if (red.isEmpty() || black.isEmpty()) {
			return "着法：" + START_RESULT_1[start][result];
		}
		String strRed = redTeam + (redTeam.isEmpty() ? "" : " ") + red;
		String strBlack = blackTeam + (blackTeam.isEmpty() ? "" : " ") + black;
		return strRed + " " + START_RESULT_2[start][result] + " " + strBlack;
	}

	public static String toDateSiteString(String date, String site) {
		if (date.isEmpty()) {
			return site.isEmpty() ? "" : "弈于 " + site;
		}
		return date + (site.isEmpty() ? "" : " 弈于 " + site);
	}

	private int sid;
	private String event, result, dateSite, opening;

	public PgnInfo(int sid, String event, String result,
			String dateSite, String opening) {
		this.sid = sid;
		this.event = event;
		this.result = result;
		this.dateSite = dateSite;
		this.opening = opening;
	}

	public int getSid() {
		return sid;
	}

	public String getEvent() {
		return event;
	}

	public String getResult() {
		return result;
	}

	public String getDateSite() {
		return dateSite;
	}

	public String getOpening() {
		return opening;
	}
}