package net.elephantbase.ucenter.web;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;

public class BasePage extends WebPage {
	public static final String MAIN_PANEL_ID = "pnlMain";

	protected void setTitle(String title) {
		add(new Label("lblTitle", title + " - ÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â"));
		add(new Label("lblSubtitle", title));
	}

	protected void setPanel(Panel panel) {
		add(panel);
	}
}