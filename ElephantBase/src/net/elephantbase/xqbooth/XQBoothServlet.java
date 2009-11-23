package net.elephantbase.xqbooth;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.biz.Login;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

public class XQBoothServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int INCORRECT = 0;
	private static final int NO_RETRY = -1;
	private static final int INTERNAL_ERROR = -2;

	private static final int USER_PLATINUM = 2800;

	private static int login(String username, String password, String[] cookie) {
		// 1. Login with Cookie
		String[] username_ = new String[1];
		String[] cookie_ = new String[] {password};
		int uid = Login.loginCookie(cookie_, username_);
		if (uid > 0 && username_[0].equals(username)) {
			if (cookie != null && cookie.length > 0) {
				cookie[0] = cookie_[0];
			}
			return uid;
		}

		// 2. Get "uid"
		String sql = "SELECT uid, password, salt FROM uc_members WHERE username = ?";
		Object[] row = DBUtil.query(3, sql, username);
		if (row == null) {
			return INTERNAL_ERROR;
		}
		if (row[0] == DBUtil.EMPTY_OBJECT) {
			return 0;
		}
		uid = ((Integer) row[0]).intValue();
		String key = (String) row[1];
		String salt = (String) row[2];

		// 3. Check if "noretry"
		sql = "SELECT retrycount, retrytime FROM xq_retry WHERE uid = ?";
		row = DBUtil.query(2, sql, Integer.valueOf(uid));
		if (row == null) {
			return INTERNAL_ERROR;
		}
		boolean retry = false;
		int retryCount = 0, retryTime = 0;
		if (row[0] != DBUtil.EMPTY_OBJECT) {
			if (EasyDate.currTimeSec() < ((Integer) row[1]).intValue()) {
				return NO_RETRY;
			}
			retry = true;
			retryCount = ((Integer) row[0]).intValue();
			retryTime = ((Integer) row[1]).intValue();
		}

		// 4. Check Password
		if (Login.getKey(password, salt).equals(key)) {
			if (cookie != null && cookie.length > 0) {
				cookie[0] = Login.addCookie(uid);
			}
			if (retry) {
				// TODO DELETE
			}
			return uid;
		}
		if (!retry) {
			sql = "INSERT INTO xq_retry (uid, retrycount, retrytime) VALUES (?, 1, 0)";
			DBUtil.update(sql, Integer.valueOf(uid));
			return INCORRECT;
		}
		if (retryCount < 5) {
			sql = "UPDATE xq_retry SET retrycount = retrycount + 1 WHERE uid = ?";
			// TODO UPDATE
			return INCORRECT;
		}
		sql = "UPDATE xq_retry SET retrycount = 0, retrytime = ? WHERE uid = ?";
		// TODO UPDATE
		return NO_RETRY;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
		doGet(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		String username = req.getHeader("Login-UserName");
		String password = req.getHeader("Login-Password");
		String[] cookie = new String[1];
		int uid = login(username, password, cookie);
		if (uid == INTERNAL_ERROR) {
			resp.setHeader("Login-Result", "internal-error");
			return;
		}
		if (uid == NO_RETRY) {
			resp.setHeader("Login-Result", "noretry");
			return;
		}
		if (uid == INCORRECT) {
			resp.setHeader("Login-Result", "error");
			return;
		}
		String act = req.getParameter("act");
		if (act == null) {
			return;
		}

		String strStage = req.getParameter("stage");
		if (strStage == null) {
			strStage = req.getParameter("score");
		}
		int stage = 0;
		try {
			stage = Integer.parseInt(strStage);
		} catch (Exception e) {
			// Ignored
		}

		String sql = "SELECT score, points, charged FROM xq_user WHERE uid = ?";
		Object[] row = DBUtil.query(3, sql, Integer.valueOf(uid));
		int score = 0, points = 0, charged = 0;
		if (row == null || row[0] == DBUtil.EMPTY_OBJECT) {
			sql = "INSERT INTO xq_user (uid, lastip, lasttime) VALUES (?, ?, ?)";
			DBUtil.update(sql, Integer.valueOf(uid), req.getRemoteHost(),
					Integer.valueOf(EasyDate.currTimeSec()));
	    } else {
	    	score = ((Integer) row[0]).intValue();
	    	points = ((Integer) row[1]).intValue();
	    	charged = ((Integer) row[2]).intValue();
			sql = "UPDATE xq_user SET lastip = ?, lasttime = ? WHERE uid = ?";
			DBUtil.update(sql, req.getRemoteHost(),
					Integer.valueOf(EasyDate.currTimeSec()), Integer.valueOf(uid));
	    }
		String ip = req.getRemoteAddr();

		if (false) {
	    	// Code Style
	    } else if (act.equals("querypoints")) {
			resp.setHeader("Login-Result", "ok " + points + "|" + charged);
		} else if (act.equals("queryscore")) {
			resp.setHeader("Login-Result", "ok " + score);
		} else if (act.equals("queryrank")) {
			sql = "SELECT rank, score FROM xq_rank WHERE uid = ?";
			row = DBUtil.query(2, sql, Integer.valueOf(uid));
			if (row == null || row[0] == DBUtil.EMPTY_OBJECT) {
				resp.setHeader("Login-Result", "ok 0|0|0");
				return;
			}
			int scoreToday = ((Integer) row[0]).intValue();
			int rankToday = ((Integer) row[1]).intValue();
			int rankYesterday = 0;
			sql = "SELECT rank FROM xq_rank0 WHERE uid = ?";
			Object rowYesterday = DBUtil.query(sql, Integer.valueOf(uid));
			if (rowYesterday != null && row != DBUtil.EMPTY_OBJECT) {
				rankYesterday = ((Integer) rowYesterday).intValue();
			}
			resp.setHeader("Login-Result", "ok " + scoreToday + "|" +
					rankToday + "|" + rankYesterday);
		} else if (act.equals("ranklist")) {
			sql = "SELECT username, score FROM xq_rank LEFT JOIN uc_members " +
					"USING (uid) ORDER BY rank LIMIT 100";
			final PrintWriter out;
			try {
				out = resp.getWriter();
			} catch (Exception e) {
				Logger.severe(e);
				return;
			}
			DBUtil.query(2, sql, new RowCallback() {
				@Override
				public Object onRow(Object[] row_) {
					out.print(row_[1] + "|" + row_[0] + "\r\n");
					return null;
				}
			});
		} else if (act.equals("save")) {
			if (stage > score) {
				sql = "UPDATE xq_user SET score = ? WHERE uid = ?";
				DBUtil.update(sql, Integer.valueOf(stage), Integer.valueOf(uid));
				resp.setHeader("Login-Result", "ok");
				EventLog.log(uid, ip, EventLog.EVENT_SAVE, stage);
			} else {
				resp.setHeader("Login-Result", "nosave");
			}
		} else if (act.equals("hint")) {
			if (stage < 500) {
				resp.setHeader("Login-Result", "ok");
			} else if (points < 10 && charged < USER_PLATINUM) {
				resp.setHeader("Login-Result", "nopoints");
			} else {
				if (charged < USER_PLATINUM) {
					sql = "UPDATE xq_user SET points = points - 10 WHERE uid = ?";
					DBUtil.update(sql, Integer.valueOf(uid));
				}
				resp.setHeader("Login-Result", "ok");
				EventLog.log(uid, ip, EventLog.EVENT_HINT, stage);
			}
		} else if (act.equals("retract")) {
			if (stage < 500) {
				resp.setHeader("Login-Result", "ok");
			} else if (points < 1 && charged < USER_PLATINUM) {
				resp.setHeader("Login-Result", "nopoints");
			} else {
				if (charged < USER_PLATINUM) {
					sql = "UPDATE xq_user SET points = points - 1 WHERE uid = ?";
					DBUtil.update(sql, Integer.valueOf(uid));
				}
				resp.setHeader("Login-Result", "ok");
				EventLog.log(uid, ip, EventLog.EVENT_RETRACT, stage);
			}
		}
	}
}