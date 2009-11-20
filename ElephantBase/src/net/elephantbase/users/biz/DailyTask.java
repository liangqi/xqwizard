package net.elephantbase.users.biz;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.TimerTask;
import java.util.zip.GZIPOutputStream;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.util.ClassPath;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class DailyTask extends TimerTask {
	private static final String MYSQL_TABLEPRE = ConnectionPool.MYSQL_TABLEPRE;

	@Override
	public void run() {
		try {
			run0();
		} catch (RuntimeException e) {
			Logger.severe(e);
		}
	}

	private void run0() {
		EasyDate now = new EasyDate();

		// Delete Expired Login Cookies
		String sql = "DELETE FROM " + MYSQL_TABLEPRE + "login WHERE expire > ?";
		DBUtil.executeUpdate(sql, Integer.valueOf(now.getTimeSec()));
		Logger.info("Expired Login Cookies Deleted");

		// Backup Logs
		ClassPath logBackup = ClassPath.getInstance("../backup/" +
				MYSQL_TABLEPRE + "log_" + now.toDateString() + ".sql.gz");
		final PrintStream out;
		try {
			out = new PrintStream(new GZIPOutputStream(new FileOutputStream(logBackup)));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		Integer nowInt = Integer.valueOf(now.getTimeSec());
		sql = "SELECT uid, eventip, eventtime, eventtype, detail FROM " +
				MYSQL_TABLEPRE + "log WHERE eventtime < ?";
		DBUtil.executeQuery(5, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				out.printf("INSERT INTO " + ConnectionPool.MYSQL_TABLEPRE + "log " +
						"(uid, eventip, eventtime, eventtype, detail) VALUES " +
						"(%d, '%s', %d, %d, %d);\r\n",
						row[0], row[1], row[2], row[3], row[4]);
				return null;
			}
		}, nowInt);
		out.close();
		sql = "DELETE FROM " + MYSQL_TABLEPRE + "log WHERE eventtime < ?";
		DBUtil.executeUpdate(sql, nowInt);
		Logger.info("Log Backuped");

		// SQLs for Update Ranks
		String sqlTruncate = "TRUNCATE TABLE " + MYSQL_TABLEPRE + "rank%s";
		String sqlInsert1 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, rank) " +
				"SELECT uid, rank FROM " + MYSQL_TABLEPRE + "rank%s";
		String sqlInsert2 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, score) " +
				"SELECT uid, score FROM " + MYSQL_TABLEPRE + "user " +
				"WHERE lasttime > ? ORDER BY score DESC, lasttime DESC";

		// Update Weekly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "w0"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "w0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "w0", "w"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "w"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "w"),
				Integer.valueOf(now.substract(EasyDate.DAY * 7).getTimeSec()));

		// Update Monthly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "m0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "m0", "m"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "m"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "m"),
				Integer.valueOf(now.substract(EasyDate.DAY * 30).getTimeSec()));

		// Update Quarterly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "q0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "q0", "q"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "q"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "q"),
				Integer.valueOf(now.substract(EasyDate.DAY * 90).getTimeSec()));
		Logger.info("Weekly/Monthly/Quarterly Ranks Updated");
	}

	public static void main(String[] args) {
		new DailyTask().run();
	}
}