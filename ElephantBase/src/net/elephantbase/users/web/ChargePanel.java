package net.elephantbase.users.web;

import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RequiredTextField;
import org.apache.wicket.model.Model;

public class ChargePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ChargePanel() {
		super("²¹³äµãÊý");

		final RequiredTextField<String> txtChargeCode = new
				RequiredTextField<String>("txtChargeCode", Model.of(""));
		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				// TODO
			}
		};
		frm.add(txtChargeCode);
		add(frm);
	}
}