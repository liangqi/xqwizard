package net.elephantbase.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.util.Closeables;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.LoggerFactory;

public class DailyTask implements ServletContextListener {
	private static Logger logger = LoggerFactory.getLogger();
	private static String MYSQL_TABLEPRE = ConnectionPool.MYSQL_TABLEPRE;

	private Timer timer;

	private static void execute(Connection conn, String sql,
			EasyDate... params) throws Exception {
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i ++) {
				ps.setInt(i + 1, (int) (params[i].getTime() / 1000));
			}
			ps.execute();
		} finally {
			Closeables.close(ps);
		}
	}

	static void updateRank() {
		Connection conn = ConnectionPool.getInstance().borrowObject();
		if (conn == null) {
			logger.severe("Connection refused");
			return;
		}
		try {
			EasyDate now = new EasyDate();

			String sqlTruncate = "TRUNCATE TABLE " + MYSQL_TABLEPRE + "rank%s";
			String sqlInsert1 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, rank) " +
					"SELECT uid, rank FROM " + MYSQL_TABLEPRE + "rank%s";
			String sqlInsert2 = "INSERT INTO " + MYSQL_TABLEPRE + "rank%s (uid, score) " +
					"SELECT uid, score FROM " + MYSQL_TABLEPRE + "user " +
					"WHERE lasttime > ? ORDER BY score DESC, lasttime DESC";

			execute(conn, String.format(sqlTruncate, "w0"));
			execute(conn, String.format(sqlInsert1, "w0", "w"));
			execute(conn, String.format(sqlTruncate, "w"));
			execute(conn, String.format(sqlInsert2, "w"), now.substract(EasyDate.DAY * 7));

			execute(conn, String.format(sqlTruncate, "m0"));
			execute(conn, String.format(sqlInsert1, "m0", "m"));
			execute(conn, String.format(sqlTruncate, "m"));
			execute(conn, String.format(sqlInsert2, "m"), now.substract(EasyDate.DAY * 30));

			execute(conn, String.format(sqlTruncate, "q0"));
			execute(conn, String.format(sqlInsert1, "q0", "q"));
			execute(conn, String.format(sqlTruncate, "q"));
			execute(conn, String.format(sqlInsert2, "q"), now.substract(EasyDate.DAY * 90));

		} catch (Exception e) {
			logger.log(Level.SEVERE, "", e);
		} finally {
			ConnectionPool.getInstance().returnObject(conn);
		}
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