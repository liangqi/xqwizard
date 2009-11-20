package net.elephantbase.users.web;

import net.elephantbase.users.Login;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.wicket.CaptchaImageResource;

import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.Model;

public class RegisterPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public RegisterPanel(final BasePanel... redirectPanels) {
		super("注册", redirectPanels[0].getSuffix(), NO_AUTH);

		final WebMarkupContainer lblWelcome = new WebMarkupContainer("lblWelcome");
		Link<Void> lnkLogin = new Link<Void>("lnkLogin") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new LoginPanel(redirectPanels));
			}
		};
		lblWelcome.add(lnkLogin);
		final Label lblWarn = new Label("lblWarn", "");
		lblWarn.setVisible(false);
		add(lblWelcome, lblWarn);

		final TextField<String> txtUsername = new TextField<String>("txtUsername", Model.of(""));
		final PasswordTextField txtPassword = new PasswordTextField("txtPassword", Model.of(""));
		final PasswordTextField txtPassword2 = new PasswordTextField("txtPassword2", Model.of(""));
		final TextField<String> txtEmail = new TextField<String>("txtEmail", Model.of("@"));
		final TextField<String> txtCaptcha = new TextField<String>("txtCaptcha", Model.of(""));
		final String captcha = Bytes.toHexUpper(Bytes.random(2));

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				lblWelcome.setVisible(false);
				lblWarn.setVisible(true);
				if (!txtCaptcha.getModelObject().toUpperCase().equals(captcha)) {
					lblWarn.setDefaultModelObject("验证码错误");
					return;
				}
				String password = txtPassword.getModelObject();
				if (!password.equals(txtPassword2.getModelObject())) {
					lblWarn.setDefaultModelObject("两遍密码不一致");
					return;
				}
				String username = txtUsername.getModelObject();
				if (username.getBytes().length < 6 || password.length() < 6) {
					lblWarn.setDefaultModelObject("用户名和密码都不能少于6个字符");
					return;
				}
				String email = txtEmail.getModelObject();
				int indexAt = email.indexOf('@');
				int indexDot = email.indexOf('.');
				if (!(indexAt > 0 && indexDot > indexAt + 1 && indexDot < email.length() - 1)) {
					lblWarn.setDefaultModelObject("Email不符合规格");
					return;
				}
				if (Login.register(username, password, email)) {
					LoginPanel panel = new LoginPanel(redirectPanels);
					panel.setInfo("您已成功注册了帐号[" + username + "]，现在就可以登录了");
					setResponsePanel(panel);
				} else {
					lblWarn.setDefaultModelObject("已经存在同样的名用户");
				}
			}
		};
		frm.add(txtUsername, txtPassword, txtPassword2, txtEmail, txtCaptcha);
		frm.add(new Image("imgCaptcha", new CaptchaImageResource(captcha)));
		add(frm);
	}
}