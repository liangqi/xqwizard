package net.elephantbase.users.web.admin.user;

import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.UsersPage;
import net.elephantbase.util.EasyDate;

import org.apache.wicket.markup.html.basic.Label;

public class DetailInfoPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public DetailInfoPanel(UserDetail user) {
		super("编辑用户", UsersPage.SUFFIX, NEED_ADMIN);

		add(new Label("lblUsername", user.username));
		add(new Label("lblEmail", user.email));
		add(new Label("lblRegIp", user.regIp));
		add(new Label("lblRegTime", EasyDate.toStringSec(user.regTime)));
		add(new Label("lblLastIp", user.lastIp));
		add(new Label("lblLastTime", EasyDate.toStringSec(user.lastTime)));
		add(new Label("lblScore", "" + user.score));
		add(new Label("lblPoints", "" + user.points));
		add(new Label("lblCharged", "" + user.charged));
	}

	@Override
	protected void onLoad() {
		setTitle("详细信息");
	}

	@Override
	protected void onLogout() {
		setResponsePanel(UsersPage.getUserPanels());
	}
}