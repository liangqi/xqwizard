package net.elephantbase.users.biz;

import net.elephantbase.db.DBUtil;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.wicket.WicketUtil;

public class EventLog {
	public static final int EVENT_REGISTER = 101;
	public static final int EVENT_LOGIN = 102;
	public static final int EVENT_LOGIN_COOKIE = 103;
	public static final int EVENT_LOGOUT = 104;
	public static final int EVENT_CHARGE = 105;
	public static final int EVENT_EMAIL = 106;
	public static final int EVENT_PASSWORD = 107;
	public static final int EVENT_GETPASSWORD = 109;
	public static final int EVENT_SAVE = 111;
	public static final int EVENT_RETRACT = 121;
	public static final int EVENT_HINT = 122;
	public static final int EVENT_CHARGECODE = 150;
	public static final int EVENT_ADMIN_CHARGE = 201;
	public static final int EVENT_ADMIN_PASSWORD = 202;
	public static final int EVENT_ADMIN_DELETE = 299;

	public static void log(int uid, String ip, int type, int detail) {
		String sql = "INSERT INTO xq_log (uid, eventip, " +
				"eventtime, eventtype, detail) VALUES (?, ?, ?, ?, ?)";
		DBUtil.update(sql, Integer.valueOf(uid), ip,
				Integer.valueOf(EasyDate.currTimeSec()),
				Integer.valueOf(type), Integer.valueOf(detail));
	}

	public static void log(int uid, int type, int detail) {
		log(uid, WicketUtil.getServletRequest().getRemoteAddr(), type, detail);
	}
}