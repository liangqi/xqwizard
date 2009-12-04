package net.elephantbase.users.web.user;

import net.elephantbase.users.web.BasePanel;
import net.elephantbase.xqbooth.ScoreEntry;
import net.elephantbase.xqbooth.XQBoothServlet;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;

public class RecentPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public RecentPanel() {
		super("´³¹Ø¶¯Ì¬");
		add(new ListView<ScoreEntry>("lstRecent", XQBoothServlet.getRecentList()) {
			private static final long serialVersionUID = 1L;

			@Override
			protected void populateItem(ListItem<ScoreEntry> item) {
				item.add(new Label("lblRecent", item.getModel()));
			}
		});
	}
}