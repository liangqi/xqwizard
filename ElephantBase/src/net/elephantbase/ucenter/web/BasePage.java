package net.elephantbase.ucenter.web;

import net.elephantbase.ucenter.BaseSession;

import org.apache.wicket.RequestCycle;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

public class BasePage extends WebPage {
	public static final String MAIN_PANEL_ID = "pnlMain";

	public static final int NO_AUTH = 0;
	public static final int WANT_AUTH = 1;
	public static final int NEED_AUTH = 2;

	public static void setResponsePage(BasePage page) {
		RequestCycle rc = RequestCycle.get();
		BaseSession session = (BaseSession) rc.getSession();
		if (page.authType != NEED_AUTH || session.getUid() > 0 || session.loginCookie()) {
			rc.setResponsePage(page);
			return;
		}
		rc.setResponsePage(new LoginPage(page));
	}

	private int authType;

	private Label lblHello = new Label("lblHello", "");
	private Label lblLogin = new Label("lblLogin", "");

	public BasePage(String title, int authType) {
		this.authType = authType;
		add(new Label("lblTitle", title + " - 象棋巫师棋谱仓库"));
		add(new Label("lblSubtitle", title));
		add(lblHello);
		Link<Void> lnkLogin = new Link<Void>("lnkLogin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				BaseSession session = (BaseSession) getSession();
				if (session.getUid() == 0) {
					setResponsePage(new LoginPage(BasePage.this));
				} else {
					session.logout();
					BasePage.setResponsePage(BasePage.this);
				}
			}
		};
		lnkLogin.add(lblLogin);
		if (authType == NO_AUTH) {
			lblHello.setVisible(false);
			lnkLogin.setVisible(false);
		}
		add(lnkLogin);
	}

	@Override
	protected void onBeforeRender() {
		String username = ((BaseSession) getSession()).getUsername();
		lblHello.setDefaultModelObject((username == null ? "游客" : username) + "，您好！");
		lblLogin.setDefaultModelObject(username == null ? "【登录】" : "【注销】");
		super.onBeforeRender();
	}
}