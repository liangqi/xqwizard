package net.elephantbase.users.web;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.util.wicket.CaptchaPanel;

import org.apache.wicket.markup.html.form.CheckBox;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.Model;

public class LoginPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	CaptchaPanel pnlCaptcha = new CaptchaPanel("pnlCaptcha");

	public LoginPanel(final BasePanel... redirectPanels) {
		super("登录", redirectPanels[0].getSuffix(), NO_AUTH);

		final RequiredTextField<String> txtUsername = new
				RequiredTextField<String>("txtUsername", Model.of(""));
		final PasswordTextField txtPassword = new
				PasswordTextField("txtPassword", Model.of(""));
		final CheckBox chkSave = new CheckBox("chkSave", Model.of(Boolean.TRUE));

		Link<Void> lnkRegister = new Link<Void>("lnkRegister") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new RegisterPanel(redirectPanels));
			}
		};
		Link<Void> lnkGetPassword = new Link<Void>("lnkGetPassword") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new GetPasswordPanel());
			}
		};

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				if (!pnlCaptcha.validate()) {
					setWarn("验证码错误");
					return;
				}
				int uid = ((BaseSession) getSession()).login(
						txtUsername.getModelObject(), txtPassword.getModelObject(),
						chkSave.getModelObject().booleanValue());
				if (uid > 0) {
					setResponsePanel(redirectPanels);
				} else if (uid < 0) {
					setWarn("无法连接到象棋巫师用户中心，请稍候再试");
				} else {
					setWarn("用户名或密码不正确");
				}
			}
		};
		frm.add(txtUsername, txtPassword, pnlCaptcha,
				chkSave, lnkRegister, lnkGetPassword);
		add(frm);
	}
}