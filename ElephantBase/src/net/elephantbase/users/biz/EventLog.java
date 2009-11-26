package net.elephantbase.users.biz;

import net.elephantbase.db.DBUtil;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.wicket.WicketUtil;

public class EventLog {
	public static final int REGISTER = 101;
	public static final int LOGIN = 102;
	public static final int LOGIN_COOKIE = 103;
	public static final int LOGOUT = 104;
	public static final int CHARGE = 105;
	public static final int EMAIL = 106;
	public static final int PASSWORD = 107;
	public static final int GETPASSWORD = 109;
	public static final int SAVE = 111;
	public static final int RETRACT = 121;
	public static final int HINT = 122;
	public static final int CHARGECODE = 150;
	public static final int QN_DELETE = 158;
	public static final int QN_CLEAR = 159;
	public static final int ADMIN_CHARGE = 201;
	public static final int ADMIN_PASSWORD = 202;
	public static final int ADMIN_DELETE = 209;

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