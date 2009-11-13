package net.elephantbase.db;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

import net.elephantbase.util.Closeables;
import net.elephantbase.util.Logger;
import net.elephantbase.util.Streams;

public class DBUtil {
	public static final Object EMPTY_OBJECT = new Object();

	public static int executeUpdate(String sql, Object... in) {
		Integer result = (Integer) executeQuery(0, sql, in);
		return result == null ? 0 : result.intValue();
	}

	public static Object executeQuery(String sql, Object... in) {
		return executeQuery(1, sql, in);
	}

	public static Object executeQuery(int columns, String sql, Object... in) {
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
			if (columns == 0) {
				return Integer.valueOf(ps.executeUpdate());
			} else if (columns == 1) {
				rs = ps.executeQuery();
				return rs.next() ? rs.getObject(1) : EMPTY_OBJECT;
			}
			rs = ps.executeQuery();
			Object[] out = new Object[columns];
			if (rs.next()) {
				for (int i = 0; i < columns; i ++) {
					out[i] = rs.getObject(i + 1);
				}
			} else {
				Arrays.fill(out, EMPTY_OBJECT);
			}
			return out;
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
}