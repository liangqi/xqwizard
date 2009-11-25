package net.elephantbase.users.web;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.biz.UserData;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.model.Model;

public class ChargePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ChargePanel() {
		super("补充点数");

		final Label lblInfo = new Label("lblInfo", "");
		add(lblInfo);

		final RequiredTextField<String> txtChargeCode = new
				RequiredTextField<String>("txtChargeCode", Model.of(""));

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				lblInfo.setVisible(false);
				String chargeCode = txtChargeCode.getModelObject();
				String sql = "SELECT points FROM xq_chargecode WHERE chargecode = ?";
				int points = DBUtil.getInt(DBUtil.query(sql, chargeCode));
				if (points == 0) {
					setWarn("点卡密码错误");
					return;
				}
				sql = "DELETE FROM xq_chargecode WHERE chargecode = ?";
				int rows = DBUtil.update(sql, chargeCode);
				if (rows == 0) {
					setWarn("点卡密码失效");
					return;
				}

				int uid = ((BaseSession) getSession()).getUid();
				sql = "UPDATE xq_user SET points = points + ?, " +
						"charged = charged + ? WHERE uid = ?";
				DBUtil.update(sql, Integer.valueOf(points),
						Integer.valueOf(points), Integer.valueOf(uid));

				UserData user = new UserData(uid);
				String info = "您刚才补充了 " + points + " 点，现在共有 " +
						user.getPoints() + " 点可用";
				if (user.isPlatinum()) {
					lblInfo.setDefaultModelObject(user.isDiamond() ?
							"您已经升级为：钻石会员用户" : "您已经升级为：白金会员用户");
					lblInfo.setVisible(true);
				}
				setInfo(info);
				EventLog.log(uid, EventLog.EVENT_CHARGE, points);
			}
		};
		frm.add(txtChargeCode);
		add(frm);
	}
}