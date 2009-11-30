package net.elephantbase.util;

import javax.servlet.http.HttpServletRequest;

public class Servlets {
	public static String getRemoteHost(HttpServletRequest req) {
		String ip = req.getHeader("x-forwarded-for");
		return ip == null ? req.getRemoteHost() : ip;
	}
}