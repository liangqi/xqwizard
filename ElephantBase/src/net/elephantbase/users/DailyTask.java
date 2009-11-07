package net.elephantbase.users;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class DailyTask implements ServletContextListener {
	private static String MYSQL_TABLEPRE = ConnectionPool.MYSQL_TABLEPRE;

	private Timer timer;

	static void updateRank() {
		EasyDate now = new EasyDate();

		String sqlTruncate = "TRUNCATE TABLE " + MYSQL_TABLEPRE + "rank%s";
		String sqlInsert1 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, rank) " +
				"SELECT uid, rank FROM " + MYSQL_TABLEPRE + "rank%s";
		String sqlInsert2 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, score) " +
				"SELECT uid, score FROM " + MYSQL_TABLEPRE + "user " +
				"WHERE lasttime > ? ORDER BY score DESC, lasttime DESC";

		// Calculate Weekly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "w0"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "w0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "w0", "w"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "w"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "w"),
				Integer.valueOf(now.substract(EasyDate.DAY * 7).getTimeSec()));

		// Calculate Monthly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "m0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "m0", "m"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "m"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "m"),
				Integer.valueOf(now.substract(EasyDate.DAY * 30).getTimeSec()));

		// Calculate Quarterly Ranks
		DBUtil.executeUpdate(String.format(sqlTruncate, "q0"));
		DBUtil.executeUpdate(String.format(sqlInsert1, "q0", "q"));
		DBUtil.executeUpdate(String.format(sqlTruncate, "q"));
		DBUtil.executeUpdate(String.format(sqlInsert2, "q"),
				Integer.valueOf(now.substract(EasyDate.DAY * 90).getTimeSec()));
		Logger.info("Weekly/Monthly/Quarterly Ranks Updated");

		// Delete Expired Login Cookies
		String sqlDelete = "DELETE FROM " + MYSQL_TABLEPRE + "login WHERE expire > ?";
		DBUtil.executeUpdate(sqlDelete, Integer.valueOf(now.getTimeSec()));
		Logger.info("Expired Login Cookies Deleted");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		timer = new Timer();
		// Do DailyTask at 4:00 everyday
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				updateRank();
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