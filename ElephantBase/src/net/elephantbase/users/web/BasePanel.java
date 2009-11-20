package net.elephantbase.users.web;

import net.elephantbase.users.BaseSession;

import org.apache.wicket.RequestCycle;
import org.apache.wicket.markup.html.panel.Panel;

public abstract class BasePanel extends Panel {
	public static final String DEFAULT_SUFFIX = "象棋巫师用户中心";
	public static final String BASE_PANEL_ID = "pnlBase";

	public static final int NO_AUTH = 0;
	public static final int WANT_AUTH = 1;
	public static final int NEED_AUTH = 2;

	public static void setResponsePanel(BasePanel... panels) {
		RequestCycle rc = RequestCycle.get();
		BaseSession session = (BaseSession) rc.getSession();
		if (panels[0].getAuthType() != BasePanel.NEED_AUTH ||
				session.getUid() > 0 || session.loginCookie()) {
			rc.setResponsePage(new BasePage(panels));
			return;
		}
		rc.setResponsePage(new BasePage(new LoginPanel(panels)));
	}

	private String title, suffix;
	private int authType;

	protected BasePanel(String title, String suffix, int authType) {
		super(BASE_PANEL_ID);
		this.title = title;
		this.suffix = suffix;
		this.authType = authType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
		getParent().get(BasePage.SUBTITLE_ID).setDefaultModelObject(title);
	}

	public String getSuffix() {
		return suffix;
	}

	public int getAuthType() {
		return authType;
	}
}