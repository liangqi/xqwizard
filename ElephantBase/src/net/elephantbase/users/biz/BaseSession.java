package net.elephantbase.users.biz;

import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.Request;
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
		String cookie = WicketUtil.getCookie("login");
		if (cookie == null) {
			return false;
		}
		String[] username_ = new String[1];
		String[] cookie_ = new String[] {cookie};
		uid = Login.loginCookie(cookie_, username_);
		if (uid <= 0) {
			return false;
		}
		EventLog.log(uid, EventLog.EVENT_LOGIN_COOKIE, 0);
		username = username_[0];
		loginCookie = cookie_[0];
		WicketUtil.setCookie("login", loginCookie, 86400 * Login.COOKIE_EXPIRY);
		return true;
	}

	public int login(String username_, String password, boolean addCookie) {
		uid = Login.login(username_, password);
		if (uid <= 0) {
			return uid;
		}
		EventLog.log(uid, EventLog.EVENT_LOGIN, 0);
		username = username_;
		if (!addCookie) {
			return uid;
		}
		loginCookie = Login.addCookie(uid);
		WicketUtil.setCookie("login", loginCookie, 86400 * Login.COOKIE_EXPIRY);
		return uid;
	}

	public void logout() {
		EventLog.log(uid, EventLog.EVENT_LOGOUT, 0);
		uid = 0;
		username = null;
		if (loginCookie == null) {
			return;
		}
		Login.delCookie(loginCookie);
		loginCookie = null;
		WicketUtil.setCookie("login", null, 0);
	}
}