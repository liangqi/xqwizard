package net.elephantbase.ucenter;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.Closeables;
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
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return -1;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {

			String sql = "SELECT uid, password, salt FROM " +
					ConnectionPool.UC_DBTABLEPRE + "members WHERE username = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (!rs.next()) {
				return -1;
			}

			int uid = rs.getInt(1);
			String key = rs.getString(2);
			String salt = rs.getString(3);
			if (md5(md5(password) + salt).equals(key)) {
				return uid;
			}
			return 0;

		} catch (Exception e) {
			Logger.severe(e);
			return -1;
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}

	public static String getUsername(int uid) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return null;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {

			String sql = "SELECT username FROM " +
					ConnectionPool.UC_DBTABLEPRE + "members WHERE uid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			if (!rs.next()) {
				return null;
			}
			return rs.getString(1);

		} catch (Exception e) {
			Logger.severe(e);
			return null;
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}
}