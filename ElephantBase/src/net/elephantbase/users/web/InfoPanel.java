package net.elephantbase.users.web;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.Users;

public class InfoPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public InfoPanel() {
		super("用户信息", UsersPage.SUFFIX, NEED_AUTH);
	}

	@Override
	protected void init() {
		BaseSession session = (BaseSession) getSession();
		String sql = "SELECT usertype, score, points, charged FROM xq_user WHERE uid = ?";
		Object[] row = DBUtil.query(4, sql, Integer.valueOf(session.getUid()));
		int userType = DBUtil.getInt(row, 0);
		int score = DBUtil.getInt(row, 1);
		int points = DBUtil.getInt(row, 2);
		int charged = DBUtil.getInt(row, 3);
		final boolean admin = (userType & Users.TYPE_ADMIN) != 0;

		Label lblScore = new Label("lblScore", "" + score);
		Label lblPoints = new Label("lblPoints", points == 0 ? "" :
				"您还有 " + points + " 点可用");
		Label lblCharged = new Label("lblCharged", charged < Users.PLATINUM ? "" :
				charged < Users.DIAMOND ? "您现在是：白金会员用户" : "您现在是：钻石会员用户");
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
}