package net.elephantbase.users.web;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;

public class ClosePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private WebMarkupContainer lnk = new WebMarkupContainer("lnk");
	private Label lbl = new Label("lbl", "¡¾¹Ø±Õ¡¿");

	public ClosePanel(String title) {
		this(title, DEFAULT_SUFFIX);
	}

	public ClosePanel(String title, String suffix) {
		super(title, suffix, NO_AUTH);
		lnk.add(lbl);
		add(lnk);
	}

	public void setLink(String label, String script) {
		lbl.setDefaultModelObject(label);
		lnk.add(new SimpleAttributeModifier("onclick", script));
	}
}