package net.elephantbase.ucenter.web;

import javax.servlet.http.Cookie;

import net.elephantbase.ucenter.Login;

import org.apache.wicket.RequestCycle;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.protocol.http.WebRequest;
import org.apache.wicket.protocol.http.WebResponse;

public class BasePage extends WebPage {
	public static final String MAIN_PANEL_ID = "pnlMain";

	public static final int NO_AUTH = 0;
	public static final int WANT_AUTH = 1;
	public static final int NEED_AUTH = 2;

	public static void setResponsePage(BasePage page) {
		RequestCycle rc = RequestCycle.get();
		BaseSession session = (BaseSession) rc.getSession();
		if (session.getUid() == 0) {
			if (page.authType == NEED_AUTH) {
				Cookie cookie = ((WebRequest) rc.getRequest()).getCookie("login");
				if (cookie != null) {
					int uid = Login.cookieLogin(cookie.getValue(), null);
					if (uid > 0) {
						session.setUid(uid);
						page.lblLogin.setDefaultModelObject("¡¾×¢Ïú¡¿");
						rc.setResponsePage(page);
						return;
					}
				}
				rc.setResponsePage(new LoginPage(page));
				return;
			}
			page.lblLogin.setDefaultModelObject("¡¾µÇÂ¼¡¿");
		} else {
			page.lblLogin.setDefaultModelObject("¡¾×¢Ïú¡¿");
		}
		rc.setResponsePage(page);
	}

	private int authType;

	private Label lblLogin = new Label("lblLogin", "");

	public BasePage(String title, int authType) {
		this.authType = authType;
		add(new Label("lblTitle", title + " - ÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â"));
		add(new Label("lblSubtitle", title));
		Link<Void> lnkLogin = new Link<Void>("lnkLogin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				BaseSession session = (BaseSession) getSession();
				if (session.getUid() == 0) {
					setResponsePage(new LoginPage(BasePage.this));
				} else {
					Cookie cookie = new Cookie("login", null);
					cookie.setMaxAge(0);
					((WebResponse) getResponse()).addCookie(cookie);
					session.setUid(0);
					BasePage.setResponsePage(BasePage.this);
				}
			}
		};
		if (authType == NO_AUTH) {
			lnkLogin.setVisible(false);
		}
		lnkLogin.add(lblLogin);
		add(lnkLogin);
	}
}