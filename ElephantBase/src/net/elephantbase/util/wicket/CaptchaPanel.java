package net.elephantbase.util.wicket;

import net.elephantbase.util.Bytes;

import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.Model;

public class CaptchaPanel extends Panel {
	private static final long serialVersionUID = 1L;

	private String captcha;
	private RequiredTextField<String> txtCaptcha =
			new RequiredTextField<String>("txt", Model.of(""));
	private Image imgCaptcha = new Image("img");

	public CaptchaPanel(String id) {
		super(id);
		add(txtCaptcha, imgCaptcha);
	}

	@Override
	protected void onBeforeRender() {
		captcha = Bytes.toHexUpper(Bytes.random(2));
		txtCaptcha.setModelObject("");
		imgCaptcha.setImageResource(new CaptchaImageResource(captcha));
		super.onBeforeRender();
	}

	public boolean validate() {
		return txtCaptcha.getModelObject().toUpperCase().equals(captcha);
	}
}