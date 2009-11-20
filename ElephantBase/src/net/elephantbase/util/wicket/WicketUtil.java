package net.elephantbase.util.wicket;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.elephantbase.util.Bytes;

import org.apache.wicket.IRequestTarget;
import org.apache.wicket.RequestCycle;
import org.apache.wicket.protocol.http.WebRequest;
import org.apache.wicket.protocol.http.WebResponse;

public class WicketUtil {
	public static HttpServletRequest getServletRequest() {
		return ((WebRequest) RequestCycle.get().getRequest()).
				getHttpServletRequest();
	}

	public static HttpServletResponse getServletResponse() {
		return ((WebResponse) RequestCycle.get().getResponse()).
				getHttpServletResponse();
	}

	public static String getCookie(String name) {
		Cookie cookie = ((WebRequest) RequestCycle.get().getRequest()).getCookie(name);
		return (cookie == null ? null : cookie.getValue());
	}

	public static void setCookie(String name, String value, int expiry) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(expiry);
		((WebResponse) RequestCycle.get().getResponse()).addCookie(cookie);
	}

	public static void download(final String ext,
			final String type, final byte[] content) {
		RequestCycle.get().setRequestTarget(new IRequestTarget() {
			@Override
			public void detach(RequestCycle requestCycle) {
				// Do Nothing
			}

			@Override
			public void respond(RequestCycle requestCycle) {
				byte[] fileBytes = Bytes.random(4);
				WebResponse r = (WebResponse) requestCycle.getResponse();
				if (ext.toUpperCase().equals(ext)) {
					r.setAttachmentHeader(Bytes.toHexUpper(fileBytes) + "." + ext);
				} else {
					r.setAttachmentHeader(Bytes.toHexLower(fileBytes) + "." + ext);
				}
				r.setContentType(type);
				try {
					r.getOutputStream().write(content);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		});
	}
}