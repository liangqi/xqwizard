package net.elephantbase.util;

import javax.servlet.http.HttpServletRequest;

public class Servlets {
	public static String getRemoteHost(HttpServletRequest req) {
		String ip = req.getHeader("x-forwarded-for");
		if (ip == null) {
			ip = req.getRemoteHost();
			if (ip == null) {
				return "0.0.0.0";
			}
			if (ip.length() > 15) {
				Logger.warning("RemoteHost truncated: \"" + ip + "\"");
				ip = ip.substring(0, 15);
			}
		} else {
			String[] ips = ip.split(", ");
			ip = ips[ips.length - 1];
			if (ip.length() > 15) {
				Logger.warning("x-forwarded-for truncated: \"" + ip + "\"");
				ip = ip.substring(0, 15);
			}
		}
		return ip;
	}
}