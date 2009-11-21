package net.elephantbase.xqbase;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.xqbase.web.XQBasePage;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.protocol.http.WebApplication;

public class XQBaseApp extends WebApplication {
	@Override
	public Class<? extends XQBasePage> getHomePage() {
		return XQBasePage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(XQBasePage.class);
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}