package net.elephantbase.users.biz;

import java.io.Serializable;

public class UserDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	public int uid, regTime, lastTime, score, points, charged;
	public String username, email, regIp, lastIp;
}