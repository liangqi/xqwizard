package net.elephantbase.users.web;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.EventLog;
import net.elephantbase.users.biz.Users;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.Model;

public class UpdatePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public UpdatePanel() {
		super("更改信息");
	}

	@Override
	protected void onLoad(BaseSession session) {
		final String username = session.getUsername();

		final PasswordTextField txtPassword0 = new
				PasswordTextField("txtPassword0", Model.of(""));
		final PasswordTextField txtPassword1 = new
				PasswordTextField("txtPassword1", Model.of(""));
		final PasswordTextField txtPassword2 = new
				PasswordTextField("txtPassword2", Model.of(""));
		final TextField<String> txtEmail = new
				TextField<String>("txtEmail",
				Model.of(Users.getEmail(username)));
		txtPassword0.setRequired(false);
		txtPassword1.setRequired(false);
		txtPassword2.setRequired(false);

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				String email = txtEmail.getModelObject();
				if (email == null || !Users.validateEmail(email)) {
					setWarn("Email不符合规格");
					return;
				}
				String password1 = txtPassword1.getModelObject();
				String password2 = txtPassword2.getModelObject();
				if (password1 == null || password1.length() < 6) {
					Users.updateInfo(username, email, null);
					setInfo("Email更新成功");
					// TODO
					EventLog.log(0, EventLog.EVENT_ADMIN_DELETE, 0);
					return;
				}
				if (!password1.equals(password2)) {
					setWarn("两遍密码不一致");
					return;
				}
				String password0 = txtPassword0.getModelObject();
				if (Users.login(username, password0) <= 0) {
					setWarn("原密码错误");
					return;
				}
				Users.updateInfo(username, email, password1);
				setInfo("Email和密码更新成功");
				// TODO
				EventLog.log(0, EventLog.EVENT_ADMIN_DELETE, 0);
			}
		};
		frm.add(txtPassword0, txtPassword1, txtPassword2, txtEmail);
		add(frm);
	}
}