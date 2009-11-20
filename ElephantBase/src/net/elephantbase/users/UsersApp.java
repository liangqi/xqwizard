package net.elephantbase.users;

import net.elephantbase.users.web.UsersPage;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.protocol.http.WebApplication;

public class UsersApp extends WebApplication {
	@Override
	public Class<? extends UsersPage> getHomePage() {
		return UsersPage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(UsersPage.class);
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}