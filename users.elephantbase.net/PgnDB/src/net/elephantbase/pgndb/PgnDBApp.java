package net.elephantbase.pgndb;

import net.elephantbase.pgndb.web.MainPage;
import net.elephantbase.ucenter.BaseSession;
import net.elephantbase.ucenter.web.BasePage;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.protocol.http.WebApplication;

public class PgnDBApp extends WebApplication {
	@Override
	public Class<? extends WebPage> getHomePage() {
		return new WebPage() {{
			BasePage.setResponsePage(new MainPage());
		}}.getClass();
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}