package xqwajax.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionPool extends Pool<Connection> {
	private final String url;

	public ConnectionPool(String url) {
		this.url = url;
	}

	@Override
	protected Connection makeObject() {
		try {
			return DriverManager.getConnection(url);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected void destroyObject(Connection conn) {
		try {
			conn.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected boolean activateObject(Connection conn) {
		return true;
	}

	@Override
	protected boolean passivateObject(Connection conn) {
		return true;
	}
}