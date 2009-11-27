package net.elephantbase.users.web.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.Model;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
import net.elephantbase.db.RowCallback;
import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.Integers;

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
				int order = Integers.minMax(0, Integers.parseInt(selOrder.getModelValue()),
						orderList.size() - 1);
				int rows = Integers.minMax(0, Integers.parseInt(selRows.getModelValue()),
						rowsList.size() - 1);
				String sql1 = "SELECT uc_members.uid, username, email, regip, regdate, " +
						"lastip, lasttime, score, points, charged FROM uc_members " +
						"INNER JOIN xq_user USING (uid)";
				String sql3 = " ORDER BY " + ORDER_BY[order] + " DESC LIMIT " +
						rowsList.get(rows);

				final ArrayList<UserDetail> userList = new ArrayList<UserDetail>();
				RowCallback callback = new RowCallback() {
					@Override
					public boolean onRow(Row row) {
						UserDetail user = new UserDetail();
						user.uid = row.getInt(1);
						user.username = row.getString(2);
						user.email = row.getString(3);
						user.regIp = row.getString(4);
						user.regTime = row.getInt(5);
						user.lastIp = row.getString(6);
						user.lastTime = row.getInt(7);
						user.score = row.getInt(8);
						user.points = row.getInt(9);
						user.charged = row.getInt(10);
						userList.add(user);
						return true;
					}
				};

				if (username != null) {
					String sql = sql1 + " WHERE username LIKE ?" + sql3;
					DBUtil.query(10, callback, sql, "%" + username + "%");
				} else if (email != null) {
					String sql = sql1 + " WHERE email LIKE ?" + sql3;
					DBUtil.query(10, callback, sql, "%" + email + "%");
				} else {
					DBUtil.query(10, callback, sql1 + sql3);
				}
				setResponsePanel(new UserListPanel(userList));
			}
		};
		frm.add(txtUsername, txtEmail, selOrder, selRows);
		add(frm);
	}
}