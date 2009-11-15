package net.elephantbase.pgndb.web;

import net.elephantbase.pgndb.biz.EccoUtil;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.form.CheckBox;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.markup.html.panel.Panel;

public class MainPanel extends Panel {
	private static final long serialVersionUID = 1L;

	public MainPanel(String id) {
		super(id);

		// 按赛事、时间查询
		final TextField<String> txtEvent = new TextField<String>("txtEvent");
		final DropDownChoice<Integer> optYearFrom = new
				DropDownChoice<Integer>("optYearFrom", WicketUtil.getIntList(1990, 2010));
		final DropDownChoice<Integer> optMonthFrom = new
				DropDownChoice<Integer>("optMonthFrom", WicketUtil.getIntList(1, 12));
		final DropDownChoice<Integer> optYearTo = new
				DropDownChoice<Integer>("optYearTo", WicketUtil.getIntList(1990, 2010));
		final DropDownChoice<Integer> optMonthTo = new
				DropDownChoice<Integer>("optMonthTo", WicketUtil.getIntList(1, 12));

		// 按选手查询
		final TextField<String> txtPlayer1 = new TextField<String>("txtPlayer2");
		final CheckBox chkRed1 = new CheckBox("chkRed1");
		final CheckBox chkBlack1 = new CheckBox("chkRed1");
		final CheckBox chkWin1 = new CheckBox("chkWin1");
		final CheckBox chkDraw1 = new CheckBox("chkDraw1");
		final CheckBox chkLoss1 = new CheckBox("chkLoss1");
		final CheckBox chkUnknown1 = new CheckBox("chkUnknown1");
		chkRed1.setModelObject(Boolean.TRUE);
		chkBlack1.setModelObject(Boolean.TRUE);
		chkWin1.setModelObject(Boolean.TRUE);
		chkDraw1.setModelObject(Boolean.TRUE);
		chkLoss1.setModelObject(Boolean.TRUE);
		chkUnknown1.setModelObject(Boolean.TRUE);

		final TextField<String> txtPlayer2 = new TextField<String>("txtPlayer2");
		final CheckBox chkRed2 = new CheckBox("chkRed2");
		final CheckBox chkBlack2 = new CheckBox("chkRed2");
		final CheckBox chkWin2 = new CheckBox("chkWin2");
		final CheckBox chkDraw2 = new CheckBox("chkDraw2");
		final CheckBox chkLoss2 = new CheckBox("chkLoss2");
		final CheckBox chkUnknown2 = new CheckBox("chkUnknown2");
		chkRed2.setModelObject(Boolean.TRUE);
		chkBlack2.setModelObject(Boolean.TRUE);
		chkWin2.setModelObject(Boolean.TRUE);
		chkDraw2.setModelObject(Boolean.TRUE);
		chkLoss2.setModelObject(Boolean.TRUE);
		chkUnknown2.setModelObject(Boolean.TRUE);

		// 按开局查
		final DropDownChoice<String> optEccoLevel1 = new
				DropDownChoice<String>("optEccoLevel1", EccoUtil.getLevel1List());
		final CheckBox chkWin = new CheckBox("chkWin2");
		final CheckBox chkDraw = new CheckBox("chkDraw2");
		final CheckBox chkLoss = new CheckBox("chkLoss2");
		final CheckBox chkUnknown = new CheckBox("chkUnknown2");
		chkWin.setModelObject(Boolean.TRUE);
		chkDraw.setModelObject(Boolean.TRUE);
		chkLoss.setModelObject(Boolean.TRUE);
		chkUnknown.setModelObject(Boolean.TRUE);

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				// BasePage.setResponsePage(new MainPage());
			}
		};
		add(frm);

		frm.add(txtEvent, optYearFrom, optMonthFrom, optYearTo, optMonthTo);
		frm.add(txtPlayer1, chkRed1, chkBlack1, chkWin1, chkDraw1, chkLoss1, chkUnknown1);
		frm.add(txtPlayer2, chkRed2, chkBlack2, chkWin2, chkDraw2, chkLoss2, chkUnknown2);
		frm.add(optEccoLevel1, chkWin, chkDraw, chkLoss, chkUnknown);
	}
}