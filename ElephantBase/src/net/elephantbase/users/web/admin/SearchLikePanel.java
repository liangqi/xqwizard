package net.elephantbase.users.web.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.Model;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;

public class SearchLikePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	static final String[] ORDER_BY = new String[] {
		"regdate", "lasttime", "score", "points", "charged",
	};

	static List<String> orderList = Arrays.asList(new String[] {
		"注册时间", "上次登录时间", "成绩", "点数", "充值",
	});

	static List<String> rowsList = Arrays.asList(new String[] {
		"10", "100", "1000",
	});

	public SearchLikePanel() {
		super("模糊查询");
		final TextField<String> txtUsername = new
				TextField<String>("txtUsername", Model.of(""));
		final TextField<String> txtEmail = new
				TextField<String>("txtEmail", Model.of(""));
		final DropDownChoice<String> selOrder = new
				DropDownChoice<String>("selOrder",
				Model.of(orderList.get(4)), orderList);
		final DropDownChoice<String> selRows = new
				DropDownChoice<String>("selRows",
				Model.of(rowsList.get(0)), rowsList);
		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				String username = txtUsername.getModelObject();
				String email = txtEmail.getModelObject();
				int order = 0;
				try {
					order = Integer.parseInt(selOrder.getModelValue());
				} catch (Exception e) {
					// Ignored
				}
				order = Math.max(0, Math.min(order, orderList.size() - 1));
				int rows = 0;
				try {
					rows = Integer.parseInt(selRows.getModelValue());
				} catch (Exception e) {
					// Ignored
				}
				rows = Math.max(0, Math.min(rows, rowsList.size() - 1));
				String sql1 = "SELECT uc_members.uid, username, email, regip, " +
						"regdate, lastip, lasttime, score, points, charged FROM " +
						"uc_members INNER JOIN xq_user USING (uid)";
				String sql3 = " ORDER BY " + ORDER_BY[order] + " DESC LIMIT " +
						rowsList.get(rows);

				final ArrayList<UserDetail> userList = new ArrayList<UserDetail>();
				RowCallback callback = new RowCallback() {
					@Override
					public Object onRow(Object[] row) {
						UserDetail user = new UserDetail();
						user.uid = DBUtil.getInt(row, 0);
						user.username = (String) row[1];
						user.email = (String) row[2];
						user.regIp = (String) row[3];
						user.regTime = DBUtil.getInt(row, 4);
						user.lastIp = (String) row[5];
						user.lastTime = DBUtil.getInt(row, 6);
						user.score = DBUtil.getInt(row, 7);
						user.points = DBUtil.getInt(row, 8);
						user.charged = DBUtil.getInt(row, 9);
						userList.add(user);
						return null;
					}
				};

				if (username != null) {
					String sql = sql1 + " WHERE username LIKE ?" + sql3;
					DBUtil.query(10, sql, callback, "%" + username + "%");
				} else if (email != null) {
					String sql = sql1 + " WHERE email LIKE ?" + sql3;
					DBUtil.query(10, sql, callback, "%" + email + "%");
				} else {
					DBUtil.query(10, sql1 + sql3, callback);
				}
				setResponsePanel(new UserListPanel(userList));
			}
		};
		frm.add(txtUsername, txtEmail, selOrder, selRows);
		add(frm);
	}
}