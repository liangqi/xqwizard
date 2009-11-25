package net.elephantbase.users.biz;

import net.elephantbase.db.DBUtil;
import net.elephantbase.util.EasyDate;

public class UserData {
	private static final int PLATINUM = 2800;
	private static final int DIAMOND = 8800;

	private static final int TYPE_ADMIN = 128;

	private boolean admin = false;
	private int score = 0, points = 0, charged = 0;

	public UserData(int uid) {
		this(uid, null);
	}

	public UserData(int uid, String ip) {
		String sql = "SELECT usertype, score, points, charged FROM " +
				"xq_user WHERE uid = ?";
		Object[] row = DBUtil.query(4, sql, Integer.valueOf(uid));
		if (row == null || row[0] == DBUtil.EMPTY_OBJECT) {
			sql = "INSERT INTO xq_user (uid, lastip, lasttime) VALUES (?, ?, ?)";
			DBUtil.update(sql, Integer.valueOf(uid), ip == null ? "" : ip,
					Integer.valueOf(EasyDate.currTimeSec()));
	    } else {
	    	admin = (((Integer) row[0]).intValue() & TYPE_ADMIN) != 0;
	    	score = ((Integer) row[1]).intValue();
	    	points = ((Integer) row[2]).intValue();
	    	charged = ((Integer) row[3]).intValue();
	    	if (ip != null) {
	    		sql = "UPDATE xq_user SET lastip = ?, lasttime = ? WHERE uid = ?";
	    		DBUtil.update(sql, ip, Integer.valueOf(EasyDate.currTimeSec()),
	    				Integer.valueOf(uid));
	    	}
	    }
	}

	public boolean isAdmin() {
		return admin;
	}

	public int getScore() {
		return score;
	}

	public int getPoints() {
		return points;
	}

	public int getCharged() {
		return charged;
	}

	public boolean isPlatinum() {
		return isPlatinum(charged);
	}

	public boolean isDiamond() {
		return isDiamond(charged);
	}

	public static boolean isPlatinum(int charged) {
		return charged >= PLATINUM;
	}

	public static boolean isDiamond(int charged) {
		return charged >= DIAMOND;
	}
}