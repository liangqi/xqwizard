package net.elephantbase.users.web.user;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.UserData;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.UsersPage;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

public class InfoPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public InfoPanel() {
		super("用户信息", UsersPage.SUFFIX, NEED_AUTH);
	}

	@Override
	protected void onLoad() {
		UserData data = ((BaseSession) getSession()).getData();
		Label lblScore = new Label("lblScore", "" + data.getScore());
		Label lblPoints = new Label("lblPoints", data.getPoints() == 0 ? "" :
				"您还有 " + data.getPoints() + " 点可用");
		Label lblCharged = new Label("lblCharged", data.isDiamond() ?
				"您现在是：钻石会员用户" : data.isPlatinum() ?
				"您现在是：白金会员用户" : "");
		final boolean admin = data.isAdmin();
		Link<Void> lnkAdmin = new Link<Void>("lnkAdmin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				if (admin) {
					setResponsePanel(UsersPage.getAdminPanels());
				}
			}
		};
		lnkAdmin.setVisible(admin);
		add(lblScore, lblPoints, lblCharged, lnkAdmin);
	}

	@Override
	protected void onLogout() {
		setResponsePanel(UsersPage.getUserPanels());
	}
}