package net.elephantbase.ucenter.web;

import org.apache.wicket.Request;
import org.apache.wicket.protocol.http.WebSession;

public class BaseSession extends WebSession {
	private static final long serialVersionUID = 1L;

	private int uid = 0;
	private String username = null;

	public BaseSession(Request request) {
		super(request);
	}

	public int getUid() {
		return uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}