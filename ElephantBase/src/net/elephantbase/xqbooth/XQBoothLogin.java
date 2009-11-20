package net.elephantbase.xqbooth;

import net.elephantbase.users.biz.Login;

public class XQBoothLogin {
	public static int login(String username, String password, String[] cookie) {
		String[] username_ = new String[1];
		int uid = Login.loginCookie(password, username_);
		// TODO
		username.getClass();
		Integer.valueOf(uid);
		cookie.getClass();
		return 0;
	}
}