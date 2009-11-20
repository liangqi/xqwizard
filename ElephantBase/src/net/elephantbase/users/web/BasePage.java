package net.elephantbase.users.web;

import net.elephantbase.users.BaseSession;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.list.Loop;

public class BasePage extends WebPage {
	public static final String SUBTITLE_ID = "lblSubtitle";

	private Label lblHello = new Label("lblHello", "");
	private Label lblLogin = new Label("lblLogin", "");

	public BasePage(final BasePanel... panels) {
		String title = panels[0].getTitle();
		String suffix = panels[0].getSuffix();
		add(new Label("lblTitle", title + " - " + suffix));
		add(new Label("lblHeader", suffix));
		add(new Label(SUBTITLE_ID, title));
		add(lblHello);
		Link<Void> lnkLogin = new Link<Void>("lnkLogin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				BaseSession session = (BaseSession) getSession();
				if (session.getUid() == 0) {
					setResponsePage(new BasePage(new LoginPanel(panels)));
				} else {
					session.logout();
					BasePanel.setResponsePanel(panels);
				}
			}
		};
		lnkLogin.add(lblLogin);
		if (panels[0].getAuthType() == BasePanel.NO_AUTH) {
			lblHello.setVisible(false);
			lnkLogin.setVisible(false);
		}
		add(lnkLogin);
		add(panels[0]);
		add(new Loop("loop", panels.length - 1) {
			private static final long serialVersionUID = 1L;

			@Override
			protected void populateItem(LoopItem item) {
				int i = item.getIteration() + 1;
				item.add(new Label("lblSubtitle", panels[i].getTitle()));
				item.add(panels[i]);
			}
		});
	}

	@Override
	protected void onBeforeRender() {
		String username = ((BaseSession) getSession()).getUsername();
		lblHello.setDefaultModelObject((username == null ? "游客" : username) + "，您好！");
		lblLogin.setDefaultModelObject(username == null ? "【登录】" : "【注销】");
		super.onBeforeRender();
	}
}