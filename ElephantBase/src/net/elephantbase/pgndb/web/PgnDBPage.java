package net.elephantbase.pgndb.web;

import net.elephantbase.pgndb.biz.SearchCond;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.WebPage;

public class PgnDBPage extends WebPage {
	public static final String SUFFIX = "ÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â";

	{
		String ecco = WicketUtil.getServletRequest().getParameter("ecco");
		if (ecco == null) {
			BasePanel.setResponsePanel(new SearchPanel(new SearchCond()));
		} else {
			BasePanel.setResponsePanel(new ResultPanel(new SearchCond(ecco)));
		}
	}
}