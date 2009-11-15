package net.elephantbase.pgndb.web;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;

import net.elephantbase.ucenter.web.BasePage;

public class MainPage extends BasePage {
	class MainPanel extends Panel {
		private static final long serialVersionUID = 1L;

		MainPanel() {
			super(MAIN_PANEL_ID);
			String js = "<!--\n" +
					"  alert('=== »¶Ó­·ÃÎÊÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â ===');\n" +
					"-->";
			Label jsMain = new Label("jsMain", js);
			jsMain.setEscapeModelStrings(false);
			add(jsMain);
		}
	}

	public MainPage() {
		super("Ê×Ò³ - ÏóÆåÎ×Ê¦ÆåÆ×²Ö¿â", NEED_AUTH);
		add(new MainPanel());
	}
}