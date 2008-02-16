package xqwajax.web;

import javax.servlet.http.Cookie;

import org.apache.wicket.model.Model;

public class CookieEntry {
	private Model name;
	private Model value;

	public CookieEntry(Cookie cookie) {
		this(cookie.getName(), cookie.getValue());
	}

	public CookieEntry(String name, String value) {
		this.name = new Model(name);
		this.value = new Model(value);
	}

	public Model getNameModel() {
		return name;
	}

	public Model getValueModel() {
		return value;
	}

	public String getName() {
		return (String) name.getObject();
	}

	public String getValue() {
		return (String) value.getObject();
	}

	public Cookie getCookie() {
		try {
			return new Cookie(getName(), getValue());
		} catch (Exception e) {
			return null;
		}
	}
}