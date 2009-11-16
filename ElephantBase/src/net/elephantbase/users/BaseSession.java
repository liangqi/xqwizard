package net.elephantbase.users;

import javax.servlet.http.Cookie;


import org.apache.wicket.Request;
import org.apache.wicket.RequestCycle;
import org.apache.wicket.protocol.http.WebRequest;
import org.apache.wicket.protocol.http.WebResponse;
import org.apache.wicket.protocol.http.WebSession;

public class BaseSession extends WebSession {
	private static final long serialVersionUID = 1L;

	private int uid = 0;
	private String username = null;
	private String loginCookie = null;

	public BaseSession(Request request) {
		super(request);
	}

	public int getUid() {
		return uid;
	}

	public String getUsername() {
		return username;
	}

	public String getLoginCookie() {
		return loginCookie;
	}

	public boolean loginCookie() {
		RequestCycle rc = RequestCycle.get();
		Cookie cookie = ((WebRequest) rc.getRequest()).getCookie("login");
		if (cookie == null) {
			return false;
		}
		String loginCookie_ = cookie.getValue();
		String[] username_ = new String[1];
		uid = Login.loginCookie(loginCookie_, username_);
		if (uid <= 0) {
			return false;
		}
		username = username_[0];
		loginCookie = loginCookie_;
		cookie.setMaxAge(86400 * 30);
		((WebResponse) rc.getResponse()).addCookie(cookie);
		return true;
	}

	public int login(String username_, String password, boolean addCookie) {
		uid = Login.login(username_, password);
		if (uid <= 0) {
			return uid;
		}
		username = username_;
		if (!addCookie) {
			return uid;
		}
		loginCookie = Login.addCookie(uid);
		Cookie cookie = new Cookie("login", loginCookie);
		cookie.setMaxAge(86400 * 30);
		((WebResponse) RequestCycle.get().getResponse()).addCookie(cookie);
		return uid;
	}

	public void logout() {
		RequestCycle rc = RequestCycle.get();
		uid = 0;
		username = null;
		if (loginCookie == null) {
			return;
		}
		Login.delCookie(loginCookie);
		loginCookie = null;
		Cookie cookie = new Cookie("login", null);
		cookie.setMaxAge(0);
		((WebResponse) rc.getResponse()).addCookie(cookie);
	}
}