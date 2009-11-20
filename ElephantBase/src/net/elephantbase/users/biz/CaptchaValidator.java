package net.elephantbase.users.biz;

import net.elephantbase.util.wicket.CaptchaImageResource;

import org.apache.wicket.Component;
import org.apache.wicket.MarkupContainer;
import org.apache.wicket.behavior.AbstractBehavior;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.model.Model;

public class CaptchaValidator extends AbstractBehavior {
	private static final long serialVersionUID = 1L;

	private String captcha;
	private RequiredTextField<String> txtCaptcha;
	private Image imgCaptcha;

	public CaptchaValidator(String txtId, String imgId) {
		txtCaptcha = new RequiredTextField<String>(txtId, Model.of(""));
		imgCaptcha = new Image(imgId);
	}

	@Override
	public void bind(Component component) {
		((MarkupContainer) component).add(imgCaptcha, txtCaptcha);
	}

	public void reset() {
		captcha = Login.getSalt();
		txtCaptcha.setModel(Model.of(""));
		imgCaptcha.setImageResource(new CaptchaImageResource(captcha));
	}

	public boolean validate() {
		return txtCaptcha.getModelObject().toLowerCase().equals(captcha);
	}
}