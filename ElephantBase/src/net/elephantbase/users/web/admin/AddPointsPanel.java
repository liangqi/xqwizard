package net.elephantbase.users.web.admin;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.biz.UserData;
import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.web.BasePanel;

import org.apache.wicket.markup.html.basic.MultiLineLabel;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.model.Model;

public class AddPointsPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public AddPointsPanel(final UserDetail user) {
		super("补充点数");

		final MultiLineLabel lblInfo = new MultiLineLabel("lblInfo", "");
		lblInfo.setVisible(false);
		add(lblInfo);
		final RequiredTextField<String> txtPoints = new
				RequiredTextField<String>("txtPoints", Model.of(""));
		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				lblInfo.setVisible(false);
				int points = 0;
				try {
					points = Integer.parseInt(txtPoints.getModelObject());
				} catch (Exception e) {
					// Ignored
				}
				if (points == 0) {
					setWarn("请输入一个数值，正数代表补充，负值代表消耗");
					return;
				}
				if (points < 0) {
					String sql = "UPDATE xq_user SET points = points + ? " +
							"WHERE uid = ?";
					DBUtil.update(sql, Integer.valueOf(points),
							Integer.valueOf(user.uid));
					user.points += points;
					setInfo(String.format("用户[%s]消耗了%s点",
								user.username, "" + -points));
					EventLog.log(user.uid, EventLog.EVENT_ADMIN_CHARGE, points);
					return;
				}
				String sql = "UPDATE xq_user SET points = points + ?, " +
						"charged = charged + ? WHERE uid = ?";
				DBUtil.update(sql, Integer.valueOf(points),
						Integer.valueOf(points), Integer.valueOf(user.uid));
				user.points += points;
				user.charged += points;
				setInfo(String.format("用户[%s]补充了%s点，请把以下文本发送给用户：",
						user.username, "" + points));
				EventLog.log(user.uid, EventLog.EVENT_ADMIN_CHARGE, points);
				StringBuilder sb = new StringBuilder();
				sb.append(String.format("我们已为您的象棋巫师帐号[%s]充值%s点",
						user.username, "" + points));
				if (UserData.isPlatinum(user.charged)) {
					sb.append("，并升级为白金会员(提示和悔棋不扣点)");
				}
				sb.append(String.format("。\n目前您的帐号共有%s点可用，",
						"" + user.points));
				sb.append("请用象棋巫师魔法学校“用户中心/查询点数”功能查收。\n" +
						"有任何问题、意见和建议请及时与我们联系，感谢您对象棋巫师的支持。");
				lblInfo.setDefaultModelObject(sb.toString());
				lblInfo.setVisible(true);
			}
		};
		frm.add(txtPoints);
		add(frm);
	}
}