package net.elephantbase.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.elephantbase.util.ClassPath;
import net.elephantbase.util.Closables;
import net.elephantbase.util.Pool;

public class ConnectionPool extends Pool<Connection> {
	private static Logger logger = LoggerFactory.getLogger(ConnectionPool.class);

	private static String url, username, password;
	private static int retryInterval, retryCount;

	static {
		try {
			FileInputStream in = new FileInputStream(ClassPath.
					getInstance().append("../etc/Database.properties"));
			Properties p = new Properties();
			p.load(in);
			in.close();

			url = p.getProperty("url");
			username = p.getProperty("username");
			password = p.getProperty("password");
			retryInterval = Integer.parseInt(p.getProperty("retry_interval")) * 1000;
			retryCount = Integer.parseInt(p.getProperty("retry_count"));
			Class.forName(p.getProperty("driver"));
		} catch (Exception e) {
			logger.error("", e);
			throw new RuntimeException(e);
		}
	}

	@Override
	protected Connection makeObject() {
		for (int i = 0; i < retryCount; i ++) {
			try {
				return DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				logger.error("", e);
				try {
					Thread.sleep(retryInterval);
				} catch (InterruptedException ie) {
					// Ignored
				}
			}
		}
		logger.error("", "Exceed retry count: " + retryCount);
		return null;
	}

	private static ConnectionPool instance = new ConnectionPool();

	private ConnectionPool() {
		// Singleton
	}

	public static ConnectionPool getInstance() {
		return instance;
	}

	@Override
	protected boolean activateObject(Connection conn) {
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("SELECT 0");
			return rs.next() && rs.getInt(1) == 0;
		} catch (Exception e) {
			return false;
		} finally {
			Closables.close(rs);
			Closables.close(st);
		}
	}

	@Override
	protected void destroyObject(Connection conn) {
		Closables.close(conn);
	}
}
