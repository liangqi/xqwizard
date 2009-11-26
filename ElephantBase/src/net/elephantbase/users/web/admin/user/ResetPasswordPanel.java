package net.elephantbase.users.web.admin.user;

import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.biz.UserDetail;
import net.elephantbase.users.biz.Users;
import net.elephantbase.users.web.BasePanel;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.model.Model;

public class ResetPasswordPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ResetPasswordPanel(final UserDetail user) {
		super("重置密码");

		final RequiredTextField<String> txtPassword = new
				RequiredTextField<String>("txtPassword", Model.of(""));
		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				String password = txtPassword.getModelObject();
				Users.updateInfo(user.username, null, password);
				setInfo("用户[" + user.username + "]的密码已被重置");
				EventLog.log(user.uid, EventLog.ADMIN_PASSWORD, 0);
			}
		};
		frm.add(txtPassword);
		add(frm);
	}
}