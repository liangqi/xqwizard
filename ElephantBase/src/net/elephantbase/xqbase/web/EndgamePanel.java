package net.elephantbase.xqbase.web;

import net.elephantbase.users.web.BasePanel;

public class EndgamePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	/** @param fen */
	public EndgamePanel(String fen) {
		super("搜索残局", XQBasePage.SUFFIX, WANT_AUTH);
		setInfo("搜索残局功能尚在开发中，敬请谅解……");
	}
}