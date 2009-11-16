package net.elephantbase.users.web;

import net.elephantbase.users.BaseSession;

import org.apache.wicket.RequestCycle;
import org.apache.wicket.markup.html.panel.Panel;

public abstract class BasePanel extends Panel {
	public static final String BASE_PANEL_ID = "pnlBase";

	public static final int NO_AUTH = 0;
	public static final int WANT_AUTH = 1;
	public static final int NEED_AUTH = 2;

	public static void setResponsePanel(BasePanel page) {
		RequestCycle rc = RequestCycle.get();
		BaseSession session = (BaseSession) rc.getSession();
		if (page.getAuthType() != BasePanel.NEED_AUTH ||
				session.getUid() > 0 || session.loginCookie()) {
			rc.setResponsePage(new BasePage(page));
			return;
		}
		rc.setResponsePage(new BasePage(new LoginPanel(page)));
	}

	private String title;
	private int authType;

	protected BasePanel(String title, int authType) {
		super(BASE_PANEL_ID);
		this.title = title;
		this.authType = authType;
	}

	public String getTitle() {
		return title;
	}

	public int getAuthType() {
		return authType;
	}
}