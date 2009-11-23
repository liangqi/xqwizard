package net.elephantbase.users.biz;

import java.security.MessageDigest;

import net.elephantbase.db.DBUtil;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;
import net.elephantbase.util.wicket.WicketUtil;

public class Login {
	public static final int COOKIE_EXPIRY = 15;

	private static String md5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			return Bytes.toHexLower(md.digest(input.getBytes()));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}
	}

	public static String getKey(String password, String salt) {
		return md5(md5(password) + salt);
	}

	public static String getSalt() {
		return Bytes.toHexLower(Bytes.random(3));
	}

	public static int login(String username, String password) {
		String sql = "SELECT uid, password, salt FROM uc_members WHERE username = ?";
		Object[] row = DBUtil.query(3, sql, username);
		if (row == null) {
			return -1;
		}
		if (row[0] == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		int uid = ((Integer) row[0]).intValue();
		String key = (String) row[1];
		String salt = (String) row[2];
		return getKey(password, salt).equals(key) ? uid : 0;
	}

	public static boolean register(String username, String password, String email) {
		String sql = "INSERT INTO uc_members (username, password, email, " +
				"regip, regdate, salt) VALUES (?, ?, ?, ?, ?, ?)";
		String salt = getSalt();
		String key = getKey(password, salt);
		String regIp = WicketUtil.getServletRequest().getRemoteHost();
		Integer regDate = Integer.valueOf(EasyDate.currTimeSec());
		int[] insertId = new int[1];
		if (DBUtil.update(insertId, sql, username,
				key, email, regIp, regDate, salt) < 0) {
			return false;
		}
		sql = "INSERT INTO uc_memberfields (uid, blacklist) VALUES (?, ?)";
		DBUtil.update(sql, Integer.valueOf(insertId[0]), "");
		return true;
	}

	public void delUser(int uid) {
		String sql = "DELETE FROM uc_memberfields WHERE uid = ?";
		DBUtil.query(sql, Integer.valueOf(uid));
		sql = "DELETE FROM uc_members WHERE uid = ?";
		DBUtil.query(sql, Integer.valueOf(uid));
	}

	public static String getUsername(int uid) {
		String sql = "SELECT username FROM uc_members WHERE uid = ?";
		Object username = DBUtil.query(sql, Integer.valueOf(uid));
		return username == DBUtil.EMPTY_OBJECT ? null : (String) username;
	}

	public static String getEmail(String username) {
		String sql = "SELECT email FROM uc_members WHERE username = ?";
		Object email = DBUtil.query(sql, username);
		return email == DBUtil.EMPTY_OBJECT ? null : (String) email;
	}

	public static void updateInfo(String username, String email, String password) {
		if (password == null) {
			String sql = "UPDATE uc_members SET email = ? WHERE username = ?";
			DBUtil.update(sql, email, username);
			return;
		}
		String salt = getSalt();
		String key = getKey(password, salt);
		String sql = "UPDATE uc_members SET email = ?, " +
				"password = ?, salt = ? WHERE username = ?";
		DBUtil.update(sql, email, key, salt, username);
	}

	public static String addCookie(int uid) {
		String sql = "INSERT INTO xq_login (cookie, uid, expire) VALUES (?, ?, ?)";
		String cookie = Bytes.toHexLower(Bytes.random(16));
		int expire = new EasyDate().add(EasyDate.DAY * COOKIE_EXPIRY).getTimeSec();
		DBUtil.update(sql, cookie,
				Integer.valueOf(uid), Integer.valueOf(expire));
		return cookie;
	}

	public static void delCookie(String cookie) {
		String sql = "DELETE FROM xq_login WHERE cookie = ?";
		DBUtil.update(sql, cookie);
	}

	public static int loginCookie(String[] cookie, String[] username) {
		if (cookie == null || cookie.length == 0) {
			return -1;
		}
		String sql = "SELECT uid FROM xq_login WHERE cookie = ?";
		Object row = DBUtil.query(sql, cookie[0]);
		if (row == null) {
			return -1;
		}
		if (row == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		int uid = ((Integer) row).intValue();
		sql = "DELETE FROM xq_login WHERE cookie = ?";
		DBUtil.update(sql, cookie[0]);
		String username_ = getUsername(uid);
		if (username_ == null) {
			return 0;
		}
		cookie[0] = addCookie(uid);
		if (username != null && username.length > 0) {
			username[0] = username_;
		}
		return uid;
	}
}