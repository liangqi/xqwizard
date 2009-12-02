package net.elephantbase.users.biz;

import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.TimerTask;
import java.util.zip.GZIPOutputStream;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
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

		// Update Ranks
		DBUtil.update("TRUNCATE TABLE xq_rank0");
		DBUtil.update("INSERT INTO xq_rank0 (uid, rank) SELECT " +
				"uid, rank FROM xq_rank");
		DBUtil.update("TRUNCATE TABLE xq_rank");
		String sql = "INSERT INTO xq_rank (uid, score) SELECT " +
				"uid, score FROM xq_user WHERE lasttime > ? AND " +
				"score > 0 ORDER BY score DESC, lasttime DESC";
		DBUtil.update(sql,
				Integer.valueOf(now.substract(EasyDate.DAY * 14).getTimeSec()));
		Logger.info("Rank (2 Weeks' Active Users) Updated");

		// Delete Expired Login Cookies
		sql = "DELETE FROM xq_login WHERE expire > ?";
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
			Logger.severe(e);
			throw new RuntimeException(e);
		}
		Integer nowInt = Integer.valueOf(now.getTimeSec());
		sql = "SELECT uid, eventip, eventtime, eventtype, detail FROM " +
				"xq_log WHERE eventtime < ?";
		DBUtil.query(5, new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				out.printf("INSERT INTO xq_log " +
						"(uid, eventip, eventtime, eventtype, detail) VALUES " +
						"(%d, '%s', %d, %d, %d);\r\n",
						row.get(1), row.get(2), row.get(3), row.get(4), row.get(5));
				return true;
			}
		}, sql, nowInt);
		out.close();
		sql = "DELETE FROM xq_log WHERE eventtime < ?";
		DBUtil.update(sql, nowInt);
		Logger.info("Log Backuped");

		// Backup User Data
		ClassPath userBackup = ClassPath.getInstance("../backup/xq_user_" +
				now.toDateString() + ".sql.gz");
		try {
			Users.backup(new FileOutputStream(userBackup));
		} catch (Exception e) {
			Logger.severe(e);
			throw new RuntimeException(e);
		}
		Logger.info("User Data Backuped");
	}

	public static void main(String[] args) {
		new DailyTask().run();
	}
}