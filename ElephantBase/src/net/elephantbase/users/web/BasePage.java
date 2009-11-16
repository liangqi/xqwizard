package net.elephantbase.users.web;

import net.elephantbase.users.BaseSession;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

public class BasePage extends WebPage {
	private Label lblHello = new Label("lblHello", "");
	private Label lblLogin = new Label("lblLogin", "");

	public BasePage(final BasePanel panel) {
		String title = panel.getTitle();
		add(new Label("lblTitle", title));
		int index = title.indexOf(" - ");
		if (index < 0) {
			add(new Label("lblSubtitle", title));
		} else {
			add(new Label("lblSubtitle", title.substring(0, index)));
		}
		add(lblHello);
		Link<Void> lnkLogin = new Link<Void>("lnkLogin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				BaseSession session = (BaseSession) getSession();
				if (session.getUid() == 0) {
					setResponsePage(new BasePage(new LoginPanel(panel)));
				} else {
					session.logout();
					BasePanel.setResponsePanel(panel);
				}
			}
		};
		lnkLogin.add(lblLogin);
		if (panel.getAuthType() == BasePanel.NO_AUTH) {
			lblHello.setVisible(false);
			lnkLogin.setVisible(false);
		}
		add(lnkLogin);
		add(panel);
	}

	@Override
	protected void onBeforeRender() {
		String username = ((BaseSession) getSession()).getUsername();
		lblHello.setDefaultModelObject((username == null ? "游客" : username) + "，您好！");
		lblLogin.setDefaultModelObject(username == null ? "【登录】" : "【注销】");
		super.onBeforeRender();
	}
}