package net.elephantbase.xqbooth;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XQBoothServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		String act = req.getParameter("act");
		if (act == null) {
			return;
		}
		if (act.equals("querypoints")) {
			resp.setHeader("Login-Result", "");
		}
		req.getHeader("");
	}
}