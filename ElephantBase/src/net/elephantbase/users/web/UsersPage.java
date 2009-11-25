package net.elephantbase.users.web;

import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.admin.AddPointsPanel;
import net.elephantbase.users.web.admin.ChargeCodePanel;
import net.elephantbase.users.web.admin.DelUserPanel;
import net.elephantbase.users.web.admin.DetailInfoPanel;
import net.elephantbase.users.web.admin.ExportDataPanel;
import net.elephantbase.users.web.admin.QnReportPanel;
import net.elephantbase.users.web.admin.ResetPasswordPanel;
import net.elephantbase.users.web.admin.SearchExactPanel;
import net.elephantbase.users.web.admin.SearchLikePanel;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.WebPage;

public class UsersPage extends WebPage {
	public static final String SUFFIX = BasePanel.DEFAULT_SUFFIX;

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

	public static BasePanel[] getEditUserPanels(UserDetail user) {
		return new BasePanel[] {
			new DetailInfoPanel(user), new AddPointsPanel(user),
			new ResetPasswordPanel(user), new DelUserPanel(user),
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