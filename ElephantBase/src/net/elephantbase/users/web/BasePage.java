package net.elephantbase.users.web;

import net.elephantbase.users.biz.BaseSession;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.list.Loop;
import org.apache.wicket.markup.html.panel.FeedbackPanel;

public class BasePage extends WebPage {
	public static final String SUBTITLE_ID = "lblSubtitle";

	private Label lblHello = new Label("lblHello", "");
	private Label lblLogin = new Label("lblLogin", "");

	private boolean auth = true;

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
					panels[0].onLogout();
				}
			}
		};
		lnkLogin.add(lblLogin);
		if (panels[0].getAuthType() == BasePanel.NO_AUTH) {
			auth = false;
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
		add(new FeedbackPanel("feedback"));
		for (int i = 0; i < panels.length; i ++) {
			panels[i].onLoad();
		}
	}

	@Override
	protected void onBeforeRender() {
		if (auth) {
			String username = ((BaseSession) getSession()).getUsername();
			lblHello.setDefaultModelObject((username == null ? "游客" : username) + "，您好！");
			lblLogin.setDefaultModelObject(username == null ? "【登录】" : "【注销】");
		}
		super.onBeforeRender();
	}
}