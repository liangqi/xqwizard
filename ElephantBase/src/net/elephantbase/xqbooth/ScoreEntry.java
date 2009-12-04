package net.elephantbase.xqbooth;

import java.io.Serializable;

import net.elephantbase.util.EasyDate;

public class ScoreEntry implements Serializable {
	private static final long serialVersionUID = 1L;

	private int uid, score, time;
	private String username;

	public ScoreEntry(int uid, String username, int score) {
		this.uid = uid;
		this.username = username;
		this.score = score;
		time = EasyDate.currTimeSec();
	}

	public int getUid() {
		return uid;
	}

	@Override
	public String toString() {
		return EasyDate.toTimeStringSec(time) + "　" + username +
				"闯过了" + (score > 900 ? "超过900关" : score + "关");
	}
}