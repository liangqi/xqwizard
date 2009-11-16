package net.elephantbase.pgndb.web;

import net.elephantbase.pgndb.PgnDBApp;
import net.elephantbase.users.web.BasePanel;

public class ResultPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ResultPanel() {
		super("ËÑË÷½á¹û - " + PgnDBApp.SUFFIX, WANT_AUTH);
	}
}