package xqwajax;

import org.apache.wicket.protocol.http.WebApplication;

import xqwajax.util.wicket.RefreshPage;
import xqwajax.web.XQWAjaxPage;

public class XQWAjaxApp extends WebApplication {
	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(RefreshPage.class);
	}

	@Override
	public Class<XQWAjaxPage> getHomePage() {
		return XQWAjaxPage.class;
	}
}