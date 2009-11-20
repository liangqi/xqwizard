package net.elephantbase.users.web;

import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.WebPage;

public class UsersPage extends WebPage {
	public static final String SUFFIX = "象棋巫师用户中心";

	{
		String act = WicketUtil.getServletRequest().getParameter("act");
		if (act == null) {
			BasePanel.setResponsePanel(new InfoPanel());
		} else if (act.equals("register")) {
			BasePanel.setResponsePanel(new RegisterPanel(new InfoPanel()));
		} else if (act.equals("getpassword")) {
			BasePanel.setResponsePanel(new GetPasswordPanel());
		}
	}
}