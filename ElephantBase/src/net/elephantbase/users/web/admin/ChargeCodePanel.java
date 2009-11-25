package net.elephantbase.users.web.admin;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.model.Model;

public class ChargeCodePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ChargeCodePanel() {
		super("生成点卡密码");

		final RequiredTextField<String> txtRegname = new
				RequiredTextField<String>("txtRegname", Model.of("注册用户"));
		final RequiredTextField<String> txtPoints = new
				RequiredTextField<String>("txtPoints", Model.of("1000"));
		final RequiredTextField<String> txtNumber = new
				RequiredTextField<String>("txtNumber", Model.of("100"));

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				String regname = txtRegname.getModelObject();
				int points = 0, number = 0;
				try {
					points = Integer.parseInt(txtPoints.getModelObject());
					number = Integer.parseInt(txtNumber.getModelObject());
				} catch (Exception e) {
					// Ignored
				}
				if (points <= 0 || number <= 0) {
					return;
				}
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				PrintStream out = new PrintStream(baos);
				for (int i = 0; i < number; i ++) {
					String chargeCode = Bytes.toHexLower(Bytes.random(16));
					String sql = "INSERT INTO xq_chargecode VALUES (?, ?)";
					DBUtil.update(sql, chargeCode, Integer.valueOf(points));
					out.print(regname + ";" + chargeCode + "\r\n");
				}
				out.close();
				WicketUtil.download("txt", "text/plain", baos.toByteArray());
				EventLog.log(((BaseSession) getSession()).getUid(),
						EventLog.EVENT_CHARGECODE, points * number);
			}
		};
		frm.add(txtRegname, txtPoints, txtNumber);
		add(frm);
	}
}