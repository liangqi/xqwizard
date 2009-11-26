package net.elephantbase.users.web.admin;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.ClosePanel;
import net.elephantbase.users.web.UsersPage;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.Model;

public class SearchExactPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public SearchExactPanel() {
		super("管理", UsersPage.SUFFIX, NEED_ADMIN);

		final TextField<String> txtUsername = new
				TextField<String>("txtUsername", Model.of(""));
		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			private void notFound(String username) {
				ClosePanel panel = new ClosePanel("管理");
				panel.setWarn("用户[" + username + "]不存在");
				setResponsePanel(panel);
			}

			@Override
			protected void onSubmit() {
				String username = txtUsername.getModelObject();
				if (username == null) {
					notFound("");
					return;
				}
				String sql = "SELECT uc_members.uid, username, email, regip, " +
						"regdate, lastip, lasttime, score, points, charged FROM " +
						"uc_members INNER JOIN xq_user USING (uid) WHERE username = ?";
				Object[] row = DBUtil.query(10, sql, username);
				if (row == null || row[0] == DBUtil.EMPTY_OBJECT) {
					notFound(username);
					return;
				}
				UserDetail user = new UserDetail();
				user.uid = DBUtil.getInt(row, 0);
				user.username = username;
				user.email = (String) row[2];
				user.regIp = (String) row[3];
				user.regTime = DBUtil.getInt(row, 4);
				user.lastIp = (String) row[5];
				user.lastTime = DBUtil.getInt(row, 6);
				user.score = DBUtil.getInt(row, 7);
				user.points = DBUtil.getInt(row, 8);
				user.charged = DBUtil.getInt(row, 9);
				setResponsePanel(UsersPage.getEditUserPanels(user));
			}
		};
		frm.add(txtUsername);
		add(frm);

		Link<Void> lnkInfo = new Link<Void>("lnkBack") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(UsersPage.getUserPanels());
			}
		};
		add(lnkInfo);
	}

	@Override
	protected void onLoad() {
		setTitle("精确查询");
	}


	@Override
	protected void onLogout() {
		setResponsePanel(UsersPage.getUserPanels());
	}
}