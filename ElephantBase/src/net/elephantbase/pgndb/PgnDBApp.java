package net.elephantbase.pgndb;

import net.elephantbase.pgndb.web.SearchPanel;
import net.elephantbase.users.BaseSession;
import net.elephantbase.users.web.BasePanel;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.protocol.http.WebApplication;

public class PgnDBApp extends WebApplication {
	@Override
	public Class<? extends WebPage> getHomePage() {
		return new WebPage() {{
			BasePanel.setResponsePanel(new SearchPanel());
		}}.getClass();
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}