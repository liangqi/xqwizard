package net.elephantbase.db;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Statement;

import net.elephantbase.util.ClassPath;
import net.elephantbase.util.Closeables;
import net.elephantbase.util.Logger;
import net.elephantbase.util.Streams;

public class MysqlDB {
	public static void main(String[] args) throws Exception {
		FileInputStream inSql = new FileInputStream(ClassPath.
				getInstance().append("../etc/MysqlDB.sql"));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		Streams.copy(inSql, baos);
		inSql.close();

		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			Logger.severe("Connection refused");
			return;
		}
		Statement st = null;
		try {

			Statement statement = conn.createStatement();
			String[] sqls = baos.toString().split(";");
			for (String sql : sqls) {
				System.out.println(sql + ";");
				statement.execute(sql);
			}
		} catch (Exception e) {
			Logger.severe(e);
		} finally {
			Closeables.close(st);
			ConnectionPool.getInstance().returnObject(conn);
		}
	}
}