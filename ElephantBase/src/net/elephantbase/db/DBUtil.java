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

	public static int update(String sql, Object... in) {
		return update(null, sql, in);
	}

	public static int update(int[] insertId, String sql, Object... in) {
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

	public static Object query(String sql, Object... in) {
		return query(1, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				return row[0];
			}
		}, in);
	}

	public static Object[] query(int columns, String sql, Object... in) {
		Object out = query(columns, sql, new RowCallback() {
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

	public static Object query(int columns, String sql, RowCallback callback,
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

	public static void source(File sqlFile) {
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
			DBUtil.update(sql);
		}
	}

	public static int getInt(Object row) {
		return row == null || row == EMPTY_OBJECT ? 0 : ((Number) row).intValue();
	}

	public static int getInt(Object[] row, int column) {
		return row == null || row[column] == EMPTY_OBJECT || row[column] == null ?
				0 : ((Number) row[column]).intValue();
	}

	public static String getString(Object row) {
		return row == null || row == EMPTY_OBJECT ? null : (String) row;
	}

	public static String getString(Object[] row, int column) {
		return row == null || row[column] == EMPTY_OBJECT ?
				null : ((String) row[column]);
	}

	public static String escape(String in) {
		String out = in.replaceAll("\\\\", "\\\\\\\\");
		out = out.replaceAll("\\\'", "\\\\\\\'");
		out = out.replaceAll("\\\"", "\\\\\\\"");
		return out;
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