package net.elephantbase.users.biz;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.TimerTask;
import java.util.zip.GZIPOutputStream;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.util.ClassPath;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class DailyTask extends TimerTask {
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
		String sql = "DELETE FROM xq_login WHERE expire > ?";
		DBUtil.update(sql, Integer.valueOf(now.getTimeSec()));
		DBUtil.update("TRUNCATE TABLE xq_retry");
		Logger.info("Expired Login Cookies Deleted");

		// Backup Logs
		ClassPath logBackup = ClassPath.getInstance("../backup/xq_log_" +
				now.toDateString() + ".sql.gz");
		final PrintStream out;
		try {
			out = new PrintStream(new GZIPOutputStream(new
					FileOutputStream(logBackup)));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		Integer nowInt = Integer.valueOf(now.getTimeSec());
		sql = "SELECT uid, eventip, eventtime, eventtype, detail FROM " +
				"xq_log WHERE eventtime < ?";
		DBUtil.query(5, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				out.printf("INSERT INTO xq_log " +
						"(uid, eventip, eventtime, eventtype, detail) VALUES " +
						"(%d, '%s', %d, %d, %d);\r\n",
						row[0], row[1], row[2], row[3], row[4]);
				return null;
			}
		}, nowInt);
		out.close();
		sql = "DELETE FROM xq_log WHERE eventtime < ?";
		DBUtil.update(sql, nowInt);
		Logger.info("Log Backuped");

		// Update Ranks
		DBUtil.update("TRUNCATE TABLE xq_rank0");
		DBUtil.update("INSERT INTO xq_rank0 (uid, rank) " +
				"SELECT uid, rank FROM xq_rank");
		DBUtil.update("TRUNCATE TABLE xq_rank");
		sql = "INSERT INTO xq_rank (uid, score) " +
				"SELECT uid, score FROM xq_user " +
				"WHERE lasttime > ? ORDER BY score DESC, lasttime DESC";
		DBUtil.update(sql,
				Integer.valueOf(now.substract(EasyDate.DAY * 14).getTimeSec()));
		Logger.info("Rank (2 Weeks' Active Users) Updated");
	}

	public static void main(String[] args) {
		new DailyTask().run();
	}
}