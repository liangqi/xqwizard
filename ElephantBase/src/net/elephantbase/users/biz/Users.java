package net.elephantbase.users.biz;

import java.io.OutputStream;
import java.io.PrintStream;
import java.security.MessageDigest;
import java.util.zip.GZIPOutputStream;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
import net.elephantbase.db.RowCallback;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class Users {
	public static final int COOKIE_EXPIRY = 14;

	public static boolean validateEmail(String email) {
		int indexAt = email.indexOf('@');
		int indexDot = email.indexOf('.');
		return indexAt > 0 && indexDot > indexAt + 1 &&
				indexDot < email.length() - 1;
	}

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
		return login(username, password, null);
	}

	public static int login(String username, String password, String[] email) {
		String sql = "SELECT uid, password, salt, email FROM " +
				"uc_members WHERE username = ?";
		Row row = DBUtil.query(4, sql, username);
		if (row.error()) {
			return -1;
		}
		if (row.empty()) {
			return 0;
		}
		int uid = row.getInt(1);
		String key = row.getString(2);
		String salt = row.getString(3);
		if (email != null && email.length > 0) {
			email[0] = row.getString(4);
		}
		return getKey(password, salt).equals(key) ? uid : 0;
	}

	public static int register(String username, String password,
			String email, String regIp) {
		String sql = "INSERT INTO uc_members (username, password, email, " +
				"regip, regdate, salt) VALUES (?, ?, ?, ?, ?, ?)";
		String salt = getSalt();
		String key = getKey(password, salt);
		Integer regDate = Integer.valueOf(EasyDate.currTimeSec());
		int[] insertId = new int[1];
		if (DBUtil.update(insertId, true, sql, username,
				key, email, regIp, regDate, salt) < 0) {
			return 0;
		}
		sql = "INSERT INTO uc_memberfields (uid, blacklist) VALUES (?, ?)";
		DBUtil.update(sql, Integer.valueOf(insertId[0]), "");
		return insertId[0];
	}

	public static void delUser(int uid) {
		String sql = "DELETE FROM xq_user WHERE uid = ?";
		DBUtil.update(sql, Integer.valueOf(uid));
		sql = "DELETE FROM uc_memberfields WHERE uid = ?";
		DBUtil.update(sql, Integer.valueOf(uid));
		sql = "DELETE FROM uc_members WHERE uid = ?";
		DBUtil.update(sql, Integer.valueOf(uid));
	}

	public static void setEmail(int uid ,String email) {
		String sql = "UPDATE uc_members SET email = ? WHERE uid = ?";
		DBUtil.update(sql, email, Integer.valueOf(uid));
	}

	public static void setPassword(int uid, String password) {
		setPassword(uid, password, null);
	}

	public static void setPassword(int uid, String password, String email) {
		String salt = getSalt();
		String key = getKey(password, salt);
		if (email == null) {
			String sql = "UPDATE uc_members SET password = ?, salt = ? WHERE uid = ?";
			DBUtil.update(sql, key, salt, Integer.valueOf(uid));
		} else {
			String sql = "UPDATE uc_members SET password = ?, salt = ?, " +
					"email = ? WHERE uid = ?";
			DBUtil.update(sql, key, salt, email, Integer.valueOf(uid));
		}
	}

	public static String addCookie(int uid) {
		String sql = "INSERT INTO xq_login " +
				"(cookie, uid, expire) VALUES (?, ?, ?)";
		String cookie = Bytes.toHexLower(Bytes.random(16));
		int expire = new EasyDate().
				add(EasyDate.DAY * COOKIE_EXPIRY).getTimeSec();
		DBUtil.update(sql, cookie,
				Integer.valueOf(uid), Integer.valueOf(expire));
		return cookie;
	}

	public static void delCookie(String cookie) {
		String sql = "DELETE FROM xq_login WHERE cookie = ?";
		DBUtil.update(sql, cookie);
	}

	public static int loginCookie(String[] cookie, String[] username, String[] email) {
		if (cookie == null || cookie.length == 0) {
			return -1;
		}
		String sql = "SELECT uid FROM xq_login WHERE cookie = ?";
		Row row = DBUtil.query(1, sql, cookie[0]);
		if (row.error()) {
			return -1;
		}
		if (row.empty()) {
			return 0;
		}
		int uid = row.getInt(1);
		sql = "DELETE FROM xq_login WHERE cookie = ?";
		DBUtil.update(sql, cookie[0]);
		sql = "SELECT username, email FROM uc_members WHERE uid = ?";
		row = DBUtil.query(2, sql, Integer.valueOf(uid));
		String username_ = row.getString(1, null);
		if (username_ == null) {
			return 0;
		}
		cookie[0] = addCookie(uid);
		if (username != null && username.length > 0) {
			username[0] = username_;
		}
		if (email != null && email.length > 0) {
			email[0] = row.getString(2);
		}
		return uid;
	}

	public static void backup(OutputStream out) {
		final PrintStream gz;
		try {
			gz = new PrintStream(new GZIPOutputStream(out));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}

		String sql = "SELECT uid, username, password, salt, email " +
				"FROM uc_members";
		DBUtil.query(5, new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				String username = DBUtil.escape(row.getString(2));
				String email = DBUtil.escape(row.getString(5));
				gz.printf("INSERT INTO uc_members " +
						"(uid, username, password, salt, email) VALUES " +
						"(%d, '%s', '%s', '%s', '%s');\r\n",
						row.get(1), username, row.get(3), row.get(4), email);
				return true;
			}
		}, sql);

		sql = "SELECT uid, usertype, score, points, charged " +
				"FROM xq_user";
		DBUtil.query(5, new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				gz.printf("INSERT INTO xq_user " +
						"(uid, usertype, score, points, charged) VALUES " +
						"(%d, %d, %d, %d, %d);\r\n", row.get(1),
						row.get(2), row.get(3), row.get(4), row.get(5));
				return true;
			}
		}, sql);

		gz.close();
	}
}