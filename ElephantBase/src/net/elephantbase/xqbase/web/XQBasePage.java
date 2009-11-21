package net.elephantbase.xqbase.web;

import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.wicket.WicketUtil;
import net.elephantbase.xqbase.biz.SearchCond;

import org.apache.wicket.markup.html.WebPage;

public class XQBasePage extends WebPage {
	public static final String SUFFIX = "ÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â";

	public XQBasePage() {
		String ecco = WicketUtil.getServletRequest().getParameter("ecco");
		if (ecco != null) {
			BasePanel.setResponsePanel(new ResultPanel(ecco));
			return;
		}
		String fen = WicketUtil.getServletRequest().getParameter("position");
		if (fen != null) {
			BasePanel.setResponsePanel(new PositionPanel(fen));
			return;
		}
		fen = WicketUtil.getServletRequest().getParameter("endgame");
		if (fen != null) {
			BasePanel.setResponsePanel(new EndgamePanel(fen));
			return;
		}
		BasePanel.setResponsePanel(new SearchPanel(new SearchCond()));
	}
}