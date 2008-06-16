package xqwlight;

import java.util.HashMap;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.protocol.http.WebApplication;
import org.apache.wicket.protocol.http.WebRequest;

import xqwlight.util.Pool;
import xqwlight.util.wicket.RefreshPage;
import xqwlight.web.XQWLightPage;

class XQWLightSession {
	Position pos = new Position();
	Search search = new Search(pos, 16);
}

public class XQWLightApp extends WebApplication {
	private HashMap<String, XQWLightSession> sessionMap = new HashMap<String, XQWLightSession>();
	private Pool<XQWLightSession> sessionPool = new Pool<XQWLightSession>() {
		@Override
		protected XQWLightSession makeObject() {
			return new XQWLightSession();
		}

		@Override
		protected void destroyObject(XQWLightSession obj) {
			// Do Nothing
		}

		@Override
		protected boolean activateObject(XQWLightSession obj) {
			return true;
		}

		@Override
		protected boolean passivateObject(XQWLightSession obj) {
			return true;
		}
	};

	@Override
	public Class<? extends XQWLightPage> getHomePage() {
		return XQWLightPage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(RefreshPage.class);
	}

	@Override
	public Session newSession(Request request, Response response) {
		sessionMap.put(((WebRequest) request).getHttpServletRequest().getSession().getId(),
				sessionPool.borrowObject());
		return super.newSession(request, response);
	}

	@Override
	public void sessionDestroyed(String sessionId) {
		sessionPool.returnObject(sessionMap.remove(sessionId));
	}

	public Position getPosition(XQWLightPage page) {
		return sessionMap.get(page.getSession().getId()).pos;
	}

	public Search getSearch(XQWLightPage page) {
		return sessionMap.get(page.getSession().getId()).search;
	}
}