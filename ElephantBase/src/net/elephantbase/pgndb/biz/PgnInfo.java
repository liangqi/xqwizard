package net.elephantbase.pgndb.biz;

import java.io.Serializable;

public class PgnInfo implements Serializable {
	private static final long serialVersionUID = 1L;

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