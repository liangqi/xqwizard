package net.elephantbase.users.web;

import net.elephantbase.users.web.admin.ChargeCodePanel;
import net.elephantbase.users.web.admin.ExportDataPanel;
import net.elephantbase.users.web.admin.QnReportPanel;
import net.elephantbase.users.web.admin.SearchExactPanel;
import net.elephantbase.users.web.admin.SearchLikePanel;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.WebPage;

public class UsersPage extends WebPage {
	public static final String SUFFIX = "象棋巫师用户中心";

	public static BasePanel[] getPanels() {
		return new BasePanel[] {
			new InfoPanel(), new ChargePanel(), new UpdatePanel(),
		};
	}

	public static BasePanel[] getAdminPanels() {
		return new BasePanel[] {
			new SearchExactPanel(), new SearchLikePanel(),
			new QnReportPanel(), new ChargeCodePanel(), new ExportDataPanel(),
		};
	}

	{
		String act = WicketUtil.getServletRequest().getParameter("act");
		if (act == null) {
			BasePanel.setResponsePanel(getPanels());
		} else if (act.equals("register")) {
			BasePanel.setResponsePanel(new RegisterPanel(getPanels()));
		} else if (act.equals("getpassword")) {
			BasePanel.setResponsePanel(new GetPasswordPanel());
		}
	}
}