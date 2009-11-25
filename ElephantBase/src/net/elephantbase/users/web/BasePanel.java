package net.elephantbase.users.web;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.util.wicket.FeedbackPanel;

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
		int authType = panels[0].getAuthType();
		if (authType == BasePanel.NO_AUTH || session.getUid() > 0 ||
				session.loginCookie() || authType == BasePanel.WANT_AUTH) {
			rc.setResponsePage(new BasePage(panels));
		} else {
			rc.setResponsePage(new BasePage(new LoginPanel(panels)));
		}
	}

	private boolean loaded = false;
	private String title, suffix;
	private int authType;

	private FeedbackPanel pnlFeedback = new FeedbackPanel("pnlFeedback");

	/** @param session */
	protected void onLoad(BaseSession session) {
		// Do Nothing
	}

	protected BasePanel(String title) {
		this(title, null, NO_AUTH);
	}

	protected BasePanel(String title, String suffix, int authType) {
		super(BASE_PANEL_ID);
		this.title = title;
		this.suffix = suffix;
		this.authType = authType;
		add(pnlFeedback);
	}

	public void load() {
		if (!loaded) {
			loaded = true;
			onLoad((BaseSession) getSession());
		}
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

	public void setInfo(String msg) {
		pnlFeedback.setInfo(msg);
	}

	public void setWarn(String msg) {
		pnlFeedback.setWarn(msg);
	}
}