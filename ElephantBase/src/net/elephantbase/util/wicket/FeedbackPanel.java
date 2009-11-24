package net.elephantbase.util.wicket;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;

public class FeedbackPanel extends Panel {
	private static final long serialVersionUID = 1L;

	private WebMarkupContainer fnt = new WebMarkupContainer("fnt");
	private Label lbl = new Label("lbl", "");

	public FeedbackPanel(String id) {
		super(id);
		fnt.add(lbl);
		add(fnt);
	}

	public void setInfo(String msg) {
		lbl.setDefaultModelObject(msg);
		fnt.add(new SimpleAttributeModifier("color", "#0000FF"));
	}

	public void setWarn(String msg) {
		lbl.setDefaultModelObject(msg);
		fnt.add(new SimpleAttributeModifier("color", "#FF0000"));
	}
}