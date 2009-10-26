package net.elephantbase.ucenter;

import java.io.FileInputStream;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.ClassPath;
import net.elephantbase.util.Closeables;
import net.elephantbase.util.LoggerFactory;

public class Login {
	private static Logger logger = LoggerFactory.getLogger(Login.class);

	private static String ucTablePre; 

	static {
		try {
			FileInputStream in = new FileInputStream(ClassPath.
					getInstance().append("../etc/Database.properties"));
			Properties p = new Properties();
			p.load(in);
			in.close();
			ucTablePre = p.getProperty("ucenter_tablepre");
		} catch (Exception e) {
			logger.log(Level.SEVERE, "", e);
			throw new RuntimeException(e);
		}
	}

	private static String md5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			return Bytes.toHexLower(md.digest(input.getBytes()));
		} catch (Exception e) {
			logger.log(Level.SEVERE, "", e);
			throw new RuntimeException(e);
		}
	}

	public static int login(String username, String password) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			logger.severe("Connection refused");
			return 0;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {

			String sql = "SELECT uid, password, salt FROM " +
					ucTablePre + "members WHERE username = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (!rs.next()) {
				return 0;
			}

			int uid = rs.getInt(1);
			String key = rs.getString(2);
			String salt = rs.getString(3);
			if (md5(md5(password) + salt).equals(key)) {
				return uid;
			}
			return 0;

		} catch (Exception e) {
			logger.log(Level.SEVERE, "", e);
			return 0;
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}
}