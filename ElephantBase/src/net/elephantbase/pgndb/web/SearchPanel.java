package net.elephantbase.pgndb.web;

import java.util.ArrayList;

import net.elephantbase.pgndb.biz.EccoUtil;
import net.elephantbase.users.web.BasePanel;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior;
import org.apache.wicket.markup.html.form.CheckBox;
import org.apache.wicket.markup.html.form.DropDownChoice;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.TextField;
import org.apache.wicket.model.Model;

public class SearchPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private static DropDownChoice<Integer> newChoice(String id,
			int from, int to, int init) {
		ArrayList<Integer> intList = new ArrayList<Integer>();
		for (int i = from; i <= to; i ++) {
			intList.add(Integer.valueOf(i));
		}
		return new DropDownChoice<Integer>(id, Model.of(Integer.valueOf(init)), intList);
	}

	private static final String CHOICE_TOTAL = "=== 全部 ===";

	static void setChoices(DropDownChoice<String> component, String[] choices) {
		ArrayList<String> choiceList = new ArrayList<String>();
		choiceList.add(CHOICE_TOTAL);
		if (choices == null) {
			component.setEnabled(false);
		} else {
			component.setEnabled(true);
			for (String choice : choices) {
				choiceList.add(choice);
			}
		}
		component.setChoices(choiceList);
		component.setModel(Model.of(CHOICE_TOTAL));
	}

	public SearchPanel() {
		super("搜索棋谱 - 象棋巫师棋谱仓库", NO_AUTH);

		// 按赛事、时间查询
		final TextField<String> txtEvent = new
				TextField<String>("txtEvent", Model.of(""));
		final DropDownChoice<Integer> optFromYear =
				newChoice("optFromYear", 1990, 2010, 1990);
		final DropDownChoice<Integer> optFromMonth =
				newChoice("optFromMonth", 1, 12, 1);
		final DropDownChoice<Integer> optToYear =
				newChoice("optToYear", 1990, 2010, 2010);
		final DropDownChoice<Integer> optToMonth =
				newChoice("optToMonth", 1, 12, 12);

		// 按选手查询
		final TextField<String> txtPlayer1 = new
				TextField<String>("txtPlayer1", Model.of(""));
		final CheckBox chkRed1 = new CheckBox("chkRed1", Model.of(Boolean.TRUE));
		final CheckBox chkBlack1 = new CheckBox("chkBlack1", Model.of(Boolean.TRUE));
		final CheckBox chkWin1 = new CheckBox("chkWin1", Model.of(Boolean.TRUE));
		final CheckBox chkDraw1 = new CheckBox("chkDraw1", Model.of(Boolean.TRUE));
		final CheckBox chkLoss1 = new CheckBox("chkLoss1", Model.of(Boolean.TRUE));
		final CheckBox chkUnknown1 = new CheckBox("chkUnknown1", Model.of(Boolean.TRUE));

		final TextField<String> txtPlayer2 = new
				TextField<String>("txtPlayer2", Model.of(""));
		final CheckBox chkRed2 = new CheckBox("chkRed2", Model.of(Boolean.TRUE));
		final CheckBox chkBlack2 = new CheckBox("chkBlack2", Model.of(Boolean.TRUE));
		final CheckBox chkWin2 = new CheckBox("chkWin2", Model.of(Boolean.TRUE));
		final CheckBox chkDraw2 = new CheckBox("chkDraw2", Model.of(Boolean.TRUE));
		final CheckBox chkLoss2 = new CheckBox("chkLoss2", Model.of(Boolean.TRUE));
		final CheckBox chkUnknown2 = new CheckBox("chkUnknown2", Model.of(Boolean.TRUE));

		// 按开局查
		final DropDownChoice<String> optEccoLevel1 = new
				DropDownChoice<String>("optEccoLevel1");
		final DropDownChoice<String> optEccoLevel2 = new
				DropDownChoice<String>("optEccoLevel2");
		final DropDownChoice<String> optEccoLevel3 = new
				DropDownChoice<String>("optEccoLevel3");
		final CheckBox chkWin = new CheckBox("chkWin", Model.of(Boolean.TRUE));
		final CheckBox chkDraw = new CheckBox("chkDraw", Model.of(Boolean.TRUE));
		final CheckBox chkLoss = new CheckBox("chkLoss", Model.of(Boolean.TRUE));
		final CheckBox chkUnknown = new CheckBox("chkUnknown", Model.of(Boolean.TRUE));

		setChoices(optEccoLevel1, EccoUtil.LEVEL_1);
		optEccoLevel1.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(optEccoLevel1.getModelValue());
				if (level1 == 0) {
					setChoices(optEccoLevel2, null);
				} else {
					setChoices(optEccoLevel2, EccoUtil.LEVEL_2[level1 - 1]);
				}
				setChoices(optEccoLevel3, null);
				target.addComponent(optEccoLevel2);
				target.addComponent(optEccoLevel3);
			}
		});
		optEccoLevel2.setEnabled(false);
		optEccoLevel2.setOutputMarkupId(true);
		optEccoLevel2.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(optEccoLevel1.getModelValue());
				int level2 = Integer.parseInt(optEccoLevel2.getModelValue());
				if (level2 == 0) {
					setChoices(optEccoLevel3, null);
				} else {
					setChoices(optEccoLevel3, EccoUtil.LEVEL_3[level1 - 1][level2 - 1]);
				}
				target.addComponent(optEccoLevel3);
			}
		});
		optEccoLevel3.setEnabled(false);
		optEccoLevel3.setOutputMarkupId(true);

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				// setResponsePanel(new SearchPanel());
			}
		};
		add(frm);

		frm.add(txtEvent, optFromYear, optFromMonth, optToYear, optToMonth);
		frm.add(txtPlayer1, chkRed1, chkBlack1, chkWin1, chkDraw1, chkLoss1, chkUnknown1);
		frm.add(txtPlayer2, chkRed2, chkBlack2, chkWin2, chkDraw2, chkLoss2, chkUnknown2);
		frm.add(optEccoLevel1, optEccoLevel2, optEccoLevel3);
		frm.add(chkWin, chkDraw, chkLoss, chkUnknown);
	}
}