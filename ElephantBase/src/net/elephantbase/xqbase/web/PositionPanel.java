package net.elephantbase.xqbase.web;

import net.elephantbase.users.web.BasePanel;

public class PositionPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	/** @param fen */
	public PositionPanel(String fen) {
		super("搜索局面", XQBasePage.SUFFIX, WANT_AUTH);
		setInfo("搜索局面功能尚在开发中，敬请谅解……");
	}
}