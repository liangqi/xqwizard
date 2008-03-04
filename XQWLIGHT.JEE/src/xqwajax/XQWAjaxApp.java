package xqwajax;

import org.apache.wicket.protocol.http.WebApplication;

import xqwajax.util.wicket.RefreshPage;
import xqwajax.web.XQWAjaxPage;

public class XQWAjaxApp extends WebApplication {
	@Override
	public Class<? extends XQWAjaxPage> getHomePage() {
		return XQWAjaxPage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(RefreshPage.class);
	}
}