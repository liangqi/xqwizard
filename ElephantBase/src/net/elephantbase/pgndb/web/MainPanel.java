package net.elephantbase.pgndb.web;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;

public class MainPanel extends Panel {
	private static final long serialVersionUID = 1L;

	public MainPanel(String id) {
		super(id);
		String js = "<!--\n" +
				"  alert('=== »¶Ó­·ÃÎÊÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â ===');\n" +
				"-->";
		Label jsMain = new Label("jsMain", js);
		jsMain.setEscapeModelStrings(false);
		add(jsMain);
	}
}