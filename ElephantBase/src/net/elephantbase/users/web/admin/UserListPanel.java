package net.elephantbase.users.web.admin;

import java.util.ArrayList;

import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.UsersPage;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;

public class UserListPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private static final int LINK_NONE = 0;
	private static final int LINK_USER = 1;
	private static final int LINK_EMAIL = 2;

	public UserListPanel(ArrayList<UserDetail> userList) {
		super("用户列表", UsersPage.SUFFIX, NEED_AUTH);

		ListView<UserDetail> listView = new
				ListView<UserDetail>("userList", userList) {
			private static final long serialVersionUID = 1L;

			private void addTd(ListItem<UserDetail> item, String tag,
					String content, int type) {
				WebMarkupContainer td = new WebMarkupContainer("td" + tag);
				item.add(td);
				td.add(new SimpleAttributeModifier("title", content));
				td.add(new SimpleAttributeModifier("bgcolor",
						item.getIndex() % 2 == 0 ? "#EEEEEE" : "DDDDDD"));
				Label lbl = new Label("lbl" + tag, content);
				if (type == LINK_NONE) {
					td.add(lbl);
					return;
				}
				if (type == LINK_EMAIL) {
					WebMarkupContainer lnk = new WebMarkupContainer("lnk" + tag);
					lnk.add(new SimpleAttributeModifier("href",
							"mailto:" + content));
					lnk.add(lbl);
					td.add(lnk);
					return;
				}
				final UserDetail user = item.getModelObject();
				Link<Void> lnk = new Link<Void>("lnk" + tag) {
					private static final long serialVersionUID = 1L;

					@Override
					public void onClick() {
						setResponsePanel(UsersPage.getEditUserPanels(user));
					}
				};
				lnk.add(lbl);
				td.add(lnk);
			}

			@Override
			protected void populateItem(ListItem<UserDetail> item) {
				UserDetail user = item.getModelObject();
				addTd(item, "Username", user.username, LINK_USER);
				addTd(item, "Email", user.email, LINK_EMAIL);
				addTd(item, "Score", "" + user.score, LINK_NONE);
				addTd(item, "Points", "" + user.points, LINK_NONE);
				addTd(item, "Charged", "" + user.charged, LINK_NONE);
			}			
		};
		add(listView);
	}
}