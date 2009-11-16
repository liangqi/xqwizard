package net.elephantbase.users;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.Timer;
import java.util.TimerTask;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

import com.google.code.jswin.util.ClassPath;

public class DailyTask implements ServletContextListener {
	private static final String MYSQL_TABLEPRE = ConnectionPool.MYSQL_TABLEPRE;

	private Timer timer;

	static void updateRank() {
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
		DBUtil.executeQuery(5, sql, new DBUtil.Callback() {
			@Override
			public Object onRecord(Object[] record) {
				out.printf("INSERT INTO " + ConnectionPool.MYSQL_TABLEPRE + "log " +
						"(uid, eventip, eventtime, eventtype, detail) VALUES " +
						"(%d, '%s', %d, %d, %d);\r\n",
						record[0], record[1], record[2], record[3], record[4]);
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

	@Override
	public void contextInitialized(ServletContextEvent event) {
		timer = new Timer();
		// Do DailyTask at 4:00 everyday
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				try {
					updateRank();
				} catch (RuntimeException e) {
					Logger.severe(e);
				}
			}
		}, new EasyDate().nextMidnightPlus(EasyDate.HOUR * 4).getDate(), EasyDate.DAY);
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
	}

	public static void main(String[] args) {
		updateRank();
	}
}