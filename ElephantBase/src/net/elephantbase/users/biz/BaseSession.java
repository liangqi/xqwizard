package net.elephantbase.users.biz;

import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.Request;
import org.apache.wicket.protocol.http.WebSession;

public class BaseSession extends WebSession {
	private static final long serialVersionUID = 1L;

	private int uid = 0;
	private String username = null;
	private String email = null;
	private String loginCookie = null;
	private UserData data = null;

	public BaseSession(Request request) {
		super(request);
	}

	public int getUid() {
		return uid;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLoginCookie() {
		return loginCookie;
	}

	public UserData getData() {
		return data;
	}

	public boolean loginCookie() {
		String cookie = WicketUtil.getCookie("login");
		if (cookie == null) {
			return false;
		}
		String[] username_ = new String[1];
		String[] cookie_ = {cookie};
		String[] email_ = new String[1];
		uid = Users.loginCookie(cookie_, username_, email_);
		if (uid <= 0) {
			return false;
		}
		EventLog.log(uid, EventLog.LOGIN_COOKIE, 0);
		username = username_[0];
		email = email_[0];
		loginCookie = cookie_[0];
		data = new UserData(uid, WicketUtil.getRemoteHost());
		WicketUtil.setCookie("login", loginCookie, 86400 * Users.COOKIE_EXPIRY);
		return true;
	}

	public int login(String username_, String password, boolean addCookie) {
		String[] email_ = new String[1];
		uid = Users.login(username_, password, email_);
		if (uid <= 0) {
			return uid;
		}
		EventLog.log(uid, EventLog.LOGIN, 0);
		username = username_;
		email = email_[0];
		data = new UserData(uid, WicketUtil.getRemoteHost());
		if (!addCookie) {
			loginCookie = null;
			return uid;
		}
		loginCookie = Users.addCookie(uid);
		WicketUtil.setCookie("login", loginCookie, 86400 * Users.COOKIE_EXPIRY);
		return uid;
	}

	public void logout() {
		EventLog.log(uid, EventLog.LOGOUT, 0);
		uid = 0;
		username = null;
		email = null;
		data = null;
		if (loginCookie == null) {
			return;
		}
		Users.delCookie(loginCookie);
		loginCookie = null;
		WicketUtil.setCookie("login", null, 0);
	}
}