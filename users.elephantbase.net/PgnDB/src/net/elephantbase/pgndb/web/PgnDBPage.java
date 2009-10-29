package net.elephantbase.pgndb.web;

import net.elephantbase.ucenter.web.BasePage;

import org.apache.wicket.markup.html.WebPage;

public class PgnDBPage extends WebPage {
	public PgnDBPage() {
		BasePage.setResponsePage(new MainPage());
	}
}