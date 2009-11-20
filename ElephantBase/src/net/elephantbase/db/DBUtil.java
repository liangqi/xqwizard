package net.elephantbase.db;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

import net.elephantbase.util.Closeables;
import net.elephantbase.util.Logger;
import net.elephantbase.util.Streams;

public class DBUtil {
	public static final Object EMPTY_OBJECT = new Object();

	public static int executeUpdate(String sql, Object... in) {
		return executeUpdate(null, sql, in);
	}

	public static int executeUpdate(int[] insertId, String sql, Object... in) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return -1;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			if (insertId != null && insertId.length > 0) {
				ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			} else {
				ps = conn.prepareStatement(sql);
			}
			for (int i = 0; i < in.length; i ++) {
				ps.setObject(i + 1, in[i]);
			}
			int numRows = ps.executeUpdate();
			if (insertId != null && insertId.length > 0) {
				rs = ps.getGeneratedKeys();
				if (rs.next()) {
					insertId[0] = rs.getInt(1);
				}
			}
			return numRows;
		} catch (Exception e) {
			Logger.severe(e);
			return -1;
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}

	public static Object executeQuery(String sql, Object... in) {
		return executeQuery(1, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				return row[0];
			}
		}, in);
	}

	public static Object[] executeQuery(int columns, String sql, Object... in) {
		Object out = executeQuery(columns, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				return row;
			}
		}, in);
		if (out == EMPTY_OBJECT) {
			out = new Object[columns];
			Arrays.fill((Object[]) out, EMPTY_OBJECT);
		}
		return (Object[]) out;
	}

	public static Object executeQuery(int columns, String sql, RowCallback callback,
			Object... in) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return null;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < in.length; i ++) {
				ps.setObject(i + 1, in[i]);
			}
			rs = ps.executeQuery();
			Object[] row = new Object[columns];
			while (rs.next()) {
				for (int i = 0; i < columns; i ++) {
					row[i] = rs.getObject(i + 1);
				}
				Object out = callback.onRow(row);
				if (out != null) {
					return out;
				}
			}
			return EMPTY_OBJECT;
		} catch (Exception e) {
			Logger.severe(e);
			return null;
		} finally {
			Closeables.close(rs);
			Closeables.close(ps);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}

	public static void importSource(File sqlFile) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			FileInputStream inSql = new FileInputStream(sqlFile);
			Streams.copy(inSql, baos);
			inSql.close();
		} catch (Exception e) {
			Logger.severe(e);
		}
		String[] sqls = baos.toString().split(";");
		for (String sql : sqls) {
			System.out.println(sql + ";");
			DBUtil.executeUpdate(sql);
		}
	}

	public static String and(Iterable<String> conditions) {
		StringBuilder sb = new StringBuilder();
		for (String condition : conditions) {
			sb.append(" AND (" + condition + ")");
		}
		return sb.substring(5);
	}

	public static String or(Iterable<String> conditions) {
		StringBuilder sb = new StringBuilder();
		for (String condition : conditions) {
			sb.append(" OR (" + condition + ")");
		}
		return sb.substring(4);
	}
}