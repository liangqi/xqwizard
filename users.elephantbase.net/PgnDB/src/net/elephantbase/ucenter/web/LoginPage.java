package net.elephantbase.ucenter.web;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.basic.Label;

public class LoginPage extends BasePage {
	private Label lblInfo = new Label("lblInfo", "");

	public LoginPage() {
		setTitle("µÇÂ¼");
		LoginPanel panel = new LoginPanel(MAIN_PANEL_ID);
		lblInfo.setVisible(false);
		panel.add(lblInfo);
		setPanel(panel);
	}

	public void setInfo(String strInfo, String color) {
		lblInfo.setDefaultModelObject(strInfo);
		lblInfo.setVisible(true);
		lblInfo.add(new SimpleAttributeModifier("style", "color:" + color));
	}
}