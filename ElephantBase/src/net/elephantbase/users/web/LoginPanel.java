package net.elephantbase.users.web;

import net.elephantbase.users.BaseSession;
import net.elephantbase.util.Bytes;
import net.elephantbase.util.wicket.CaptchaImageResource;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.CheckBox;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.PasswordTextField;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.model.Model;

public class LoginPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private static String getSuffix(String title) {
		int index = title.indexOf(" - ");
		return index < 0 ? "象棋巫师用户中心" : title.substring(index + 3);
	}

	public LoginPanel(final BasePanel redirectPanel) {
		super("登录 - " + getSuffix(redirectPanel.getTitle()), NO_AUTH);

		final Label lblInfo = new Label("lblInfo", "");
		final TextField<String> txtUsername = new TextField<String>("txtUsername", Model.of(""));
		final PasswordTextField txtPassword = new PasswordTextField("txtPassword", Model.of(""));
		final TextField<String> txtCaptcha = new TextField<String>("txtCaptcha", Model.of(""));
		final CheckBox chkSave = new CheckBox("chkSave", Model.of(Boolean.TRUE));
		final String captcha = Bytes.toHexUpper(Bytes.random(2));

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				lblInfo.setVisible(true);
				if (!captcha.equals(txtCaptcha.getModelObject())) {
					lblInfo.setDefaultModelObject("验证码错误");
				} else {
					int uid = ((BaseSession) getSession()).login(
							txtUsername.getModelObject(), txtPassword.getModelObject(),
							chkSave.getModelObject().booleanValue());
					if (uid > 0) {
						setResponsePanel(redirectPanel);
					} else if (uid < 0) {
						lblInfo.setDefaultModelObject("无法连接到象棋巫师用户中心，请稍候再试");
					} else {
						lblInfo.setDefaultModelObject("用户名或密码不正确");
					}
				}
			}
		};
		frm.add(txtUsername, txtPassword, txtCaptcha, chkSave);
		frm.add(new Image("imgCaptcha", new CaptchaImageResource(captcha)));
		add(lblInfo);
		add(frm);
	}
}