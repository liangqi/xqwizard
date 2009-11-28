package net.elephantbase.users.web.admin;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
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
				String sql = "SELECT uc_members.uid, email, regip, regdate, " +
						"lastip, lasttime, score, points, charged FROM uc_members " +
						"INNER JOIN xq_user USING (uid) WHERE username = ?";
				Row row = DBUtil.query(9, sql, username);
				if (!row.valid()) {
					notFound(username);
					return;
				}
				UserDetail user = new UserDetail();
				user.uid = row.getInt(1);
				user.username = username;
				user.email = row.getString(2);
				user.regIp = row.getString(3);
				user.regTime = row.getInt(4);
				user.lastIp = row.getString(5);
				user.lastTime = row.getInt(6);
				user.score = row.getInt(7);
				user.points = row.getInt(8);
				user.charged = row.getInt(9);
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
	protected void onBeforeRender() {
		setTitle("精确查询");
		super.onBeforeRender();
	}
}