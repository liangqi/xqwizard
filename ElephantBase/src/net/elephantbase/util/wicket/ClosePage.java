package net.elephantbase.util.wicket;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;

public class ClosePage extends WebPage {
	public ClosePage(String message) {
		Label lblScript = new Label("lblScript",
				"var message = \"" + message + "\";");
		lblScript.setEscapeModelStrings(false);
		add(lblScript);
	}
}