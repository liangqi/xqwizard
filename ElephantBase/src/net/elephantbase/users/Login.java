package net.elephantbase.users;

import java.security.MessageDigest;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;
import net.elephantbase.util.wicket.WicketUtil;

public class Login {
	private static final String MYSQL_TABLEPRE = ConnectionPool.MYSQL_TABLEPRE;
	private static final String UC_DBTABLEPRE = ConnectionPool.UC_DBTABLEPRE;

	private static String md5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			return Bytes.toHexLower(md.digest(input.getBytes()));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}
	}

	private static String getKey(String password, String salt) {
		return md5(md5(password) + salt);
	}

	public static String getSalt() {
		return Bytes.toHexLower(Bytes.random(3));
	}

	public static int login(String username, String password) {
		String sql = "SELECT uid, password, salt FROM " +
				UC_DBTABLEPRE + "members WHERE username = ?";
		Object[] out = DBUtil.executeQuery(3, sql, username);
		if (out == null) {
			return -1;
		}
		if (out[0] == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		int uid = ((Integer) out[0]).intValue();
		String key = (String) out[1];
		String salt = (String) out[2];
		return getKey(password, salt).equals(key) ? uid : 0;
	}

	public static boolean register(String username, String password, String email) {
		String sql = "INSERT INTO " + UC_DBTABLEPRE + "members " +
				"(username, password, email, regip, regdate, salt) VALUES (?, ?, ?, ?, ?, ?)";
		String salt = getSalt();
		String key = getKey(password, salt);
		String regIp = WicketUtil.getServletRequest().getRemoteHost();
		Integer regDate = Integer.valueOf(EasyDate.currTimeSec());
		int[] insertId = new int[1];
		if (DBUtil.executeUpdate(insertId, sql, username,
				key, email, regIp, regDate, salt) < 0) {
			return false;
		}
		sql = "INSERT INTO " + UC_DBTABLEPRE + "memberfields (uid, blacklist) VALUES (?, ?)";
		DBUtil.executeUpdate(sql, Integer.valueOf(insertId[0]), "");
		return true;
	}

	public void delUser(int uid) {
		String sql = "DELETE FROM " + UC_DBTABLEPRE + "memberfields WHERE uid = ?";
		DBUtil.executeQuery(sql, Integer.valueOf(uid));
		sql = "DELETE FROM " + UC_DBTABLEPRE + "members WHERE uid = ?";
		DBUtil.executeQuery(sql, Integer.valueOf(uid));
	}

	public static String getUsername(int uid) {
		String sql = "SELECT username FROM " + UC_DBTABLEPRE + "members WHERE uid = ?";
		Object username = DBUtil.executeQuery(sql, Integer.valueOf(uid));
		return username == DBUtil.EMPTY_OBJECT ? null : (String) username;
	}

	public static String getEmail(String username) {
		String sql = "SELECT email FROM " + UC_DBTABLEPRE + "members WHERE username = ?";
		Object email = DBUtil.executeQuery(sql, username);
		return email == DBUtil.EMPTY_OBJECT ? null : (String) email;
	}

	public static void updateInfo(String username, String email, String password) {
		if (password == null) {
			String sql = "UPDATE " + UC_DBTABLEPRE + "members SET email = ? WHERE username = ?";
			DBUtil.executeUpdate(sql, email, username);
			return;
		}
		String salt = getSalt();
		String key = getKey(password, salt);
		String sql = "UPDATE " + UC_DBTABLEPRE + "members SET email = ?, " +
				"password = ?, salt = ? WHERE username = ?";
		DBUtil.executeUpdate(sql, email, key, salt, username);
	}

	public static String addCookie(int uid) {
		String sql = "INSERT INTO " + MYSQL_TABLEPRE +
				"login (cookie, uid, expire) VALUES (?, ?, ?)";
		String cookie = Bytes.toHexLower(Bytes.random(16));
		int expire = new EasyDate().add(EasyDate.DAY * 15).getTimeSec();
		DBUtil.executeUpdate(sql, cookie,
				Integer.valueOf(uid), Integer.valueOf(expire));
		return cookie;
	}

	public static void delCookie(String cookie) {
		String sql = "DELETE FROM " + MYSQL_TABLEPRE + "login WHERE cookie = ?";
		DBUtil.executeUpdate(sql, cookie);
	}

	public static int loginCookie(String cookie, String[] username) {
		String sql = "SELECT uid FROM " + MYSQL_TABLEPRE + "login WHERE cookie = ?";
		Object out = DBUtil.executeQuery(sql, cookie);
		if (out == null) {
			return -1;
		}
		if (out == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		int uid = ((Integer) out).intValue();
		sql = "UPDATE " + MYSQL_TABLEPRE + "login SET expire = ? WHERE cookie = ?";
		int expire = new EasyDate().add(EasyDate.DAY * 15).getTimeSec();
		DBUtil.executeUpdate(sql, Integer.valueOf(expire), cookie);
		if (username != null && username.length > 0) {
			username[0] = getUsername(uid);
		}
		return uid;
	}
}