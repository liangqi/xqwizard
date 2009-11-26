package net.elephantbase.users.web.user;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.UserData;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.UsersPage;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

public class InfoPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public InfoPanel() {
		super("用户信息", UsersPage.SUFFIX, NEED_AUTH);
	}

	@Override
	protected void onLoad() {
		UserData user = new UserData(((BaseSession) getSession()).getUid(),
				WicketUtil.getServletRequest().getRemoteHost());
		Label lblScore = new Label("lblScore", "" + user.getScore());
		Label lblPoints = new Label("lblPoints", user.getPoints() == 0 ? "" :
				"您还有 " + user.getPoints() + " 点可用");
		Label lblCharged = new Label("lblCharged", user.isDiamond() ?
				"您现在是：钻石会员用户" : user.isPlatinum() ?
				"您现在是：白金会员用户" : "");
		final boolean admin = user.isAdmin();
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