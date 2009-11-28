package net.elephantbase.db;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import net.elephantbase.util.Closeables;
import net.elephantbase.util.Logger;
import net.elephantbase.util.Streams;

public class DBUtil {
	public static int update(String sql, Object... in) {
		return update(null, false, sql, in);
	}

	public static int update(boolean ignoreError, String sql, Object... in) {
		return update(null, ignoreError, sql, in);
	}

	public static int update(int[] insertId, String sql, Object... in) {
		return update(insertId, false, sql, in);
	}

	public static int update(int[] insertId, boolean ignoreError,
			String sql, Object... in) {
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
			int numRows;
			if (ignoreError) {
				try {
					numRows = ps.executeUpdate();
				} catch (Exception e) {
					Logger.info(e.getMessage());
					return -1;
				}
			} else {
				numRows = ps.executeUpdate();
			}
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

	public static Row query(int columns, String sql, Object... in) {
		final Row[] row_ = new Row[1];
		row_[0] = null;
		RowCallback callback = new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				row_[0] = row;
				return false;
			}
		};
		if (!query(columns, callback, sql, in)) {
			return Row.ERROR;
		}
		return (row_[0] == null ? Row.EMPTY : row_[0]);
	}

	public static boolean query(int columns, RowCallback callback,
			String sql, Object... in) {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return false;
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < in.length; i ++) {
				ps.setObject(i + 1, in[i]);
			}
			rs = ps.executeQuery();
			while (rs.next() && callback.onRow(new Row(rs, columns))) {
				// Do Nothing
			}
			return true;
		} catch (Exception e) {
			Logger.severe(e);
			return false;
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