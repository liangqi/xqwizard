package net.elephantbase.pgndb;

import net.elephantbase.pgndb.web.PgnDBPage;

import org.apache.wicket.protocol.http.WebApplication;

public class PgnDBApp extends WebApplication {
	@Override
	public Class<? extends PgnDBPage> getHomePage() {
		return PgnDBPage.class;
	}
}