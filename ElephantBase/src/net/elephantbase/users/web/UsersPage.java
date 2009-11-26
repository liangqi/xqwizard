package net.elephantbase.users.web;

import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.admin.ChargeCodePanel;
import net.elephantbase.users.web.admin.ExportDataPanel;
import net.elephantbase.users.web.admin.QuestionnairePanel;
import net.elephantbase.users.web.admin.SearchExactPanel;
import net.elephantbase.users.web.admin.SearchLikePanel;
import net.elephantbase.users.web.admin.user.AddPointsPanel;
import net.elephantbase.users.web.admin.user.DelUserPanel;
import net.elephantbase.users.web.admin.user.DetailInfoPanel;
import net.elephantbase.users.web.admin.user.ResetPasswordPanel;
import net.elephantbase.users.web.user.ChargePanel;
import net.elephantbase.users.web.user.InfoPanel;
import net.elephantbase.users.web.user.UpdatePanel;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.WebPage;

public class UsersPage extends WebPage {
	public static final String SUFFIX = BasePanel.DEFAULT_SUFFIX;

	public static BasePanel[] getUserPanels() {
		return new BasePanel[] {
			new InfoPanel(), new ChargePanel(), new UpdatePanel(),
		};
	}

	public static BasePanel[] getAdminPanels() {
		return new BasePanel[] {
			new SearchExactPanel(), new SearchLikePanel(),
			new QuestionnairePanel(), new ChargeCodePanel(), new ExportDataPanel(),
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
			BasePanel.setResponsePanel(getUserPanels());
		} else if (act.equals("register")) {
			BasePanel.setResponsePanel(new RegisterPanel(getUserPanels()));
		} else if (act.equals("getpassword")) {
			BasePanel.setResponsePanel(new GetPasswordPanel());
		}
	}
}