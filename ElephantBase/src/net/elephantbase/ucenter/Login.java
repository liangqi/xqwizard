package net.elephantbase.ucenter;

import java.security.MessageDigest;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class Login {
	private static String md5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			return Bytes.toHexLower(md.digest(input.getBytes()));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}
	}

	public static int login(String username, String password) {
		String sql = "SELECT uid, password, salt FROM " +
				ConnectionPool.UC_DBTABLEPRE + "members WHERE username = ?";
		Object[] out = (Object[]) DBUtil.executeQuery(3, sql, username);
		if (out[0] == null) {
			return -1;
		}
		int uid = ((Integer) out[0]).intValue();
		String key = (String) out[1];
		String salt = (String) out[2];
		return md5(md5(password) + salt).equals(key) ? uid : 0;
	}

	public static String getUsername(int uid) {
		String sql = "SELECT username FROM " +
				ConnectionPool.UC_DBTABLEPRE + "members WHERE uid = ?";
		return (String) DBUtil.executeQuery(sql, Integer.valueOf(uid));
	}

	public static String addCookie(int uid) {
		String sql = "INSERT INTO " + ConnectionPool.MYSQL_TABLEPRE +
				"login (cookie, uid, expire) VALUES (?, ?, ?)";
		String cookie = Bytes.toHexLower(Bytes.random(16));
		int expire = new EasyDate().add(EasyDate.DAY * 30).getTimeSec();
		DBUtil.executeUpdate(sql, cookie, Integer.valueOf(uid), Integer.valueOf(expire));
		return cookie;
	}

	public static void delCookie(String cookie) {
		String sql = "DELETE FROM " + ConnectionPool.MYSQL_TABLEPRE +
				"login WHERE cookie = ?";
		DBUtil.executeUpdate(sql, cookie);
	}

	public static int loginCookie(String cookie, String[] username) {
		String sql = "SELECT uid FROM " +
				ConnectionPool.MYSQL_TABLEPRE + "login WHERE cookie = ?";
		Object out = DBUtil.executeQuery(sql, cookie);
		if (out == null) {
			return -1;
		}
		if (out == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		int uid = ((Integer) out).intValue();
		sql = "UPDATE " + ConnectionPool.MYSQL_TABLEPRE + "login SET " +
				"expire = ? WHERE cookie = ?";
		int expire = new EasyDate().add(EasyDate.DAY * 30).getTimeSec();
		DBUtil.executeUpdate(sql, Integer.valueOf(expire), cookie);
		if (username != null && username.length > 0) {
			username[0] = getUsername(uid);
		}
		return uid;
	}
}