package net.elephantbase.pgndb;

import net.elephantbase.pgndb.web.PgnDBPage;
import net.elephantbase.users.biz.BaseSession;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.protocol.http.WebApplication;

public class PgnDBApp extends WebApplication {
	@Override
	public Class<? extends PgnDBPage> getHomePage() {
		return PgnDBPage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(PgnDBPage.class);
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}