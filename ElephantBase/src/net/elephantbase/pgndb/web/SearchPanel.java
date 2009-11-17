package net.elephantbase.pgndb.web;

import java.util.ArrayList;
import java.util.Arrays;

import net.elephantbase.pgndb.biz.EccoUtil;
import net.elephantbase.pgndb.biz.SearchCond;
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
		return new DropDownChoice<Integer>(id,
				Model.of(Integer.valueOf(init)), intList);
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

	public SearchPanel(final SearchCond cond) {
		super("搜索棋谱 - " + PgnDBPage.SUFFIX, WANT_AUTH);

		// 按赛事、时间查询
		final TextField<String> txtEvent = new
				TextField<String>("txtEvent", Model.of(""));
		txtEvent.setRequired(false);
		final DropDownChoice<Integer> selFromYear = newChoice("selYearFrom",
				SearchCond.YEAR_FROM, SearchCond.YEAR_TO, cond.yearFrom);
		final DropDownChoice<Integer> selFromMonth = newChoice("selMonthFrom",
				SearchCond.MONTH_FROM, SearchCond.MONTH_TO, cond.monthFrom);
		final DropDownChoice<Integer> selToYear = newChoice("selYearTo",
				SearchCond.YEAR_FROM, SearchCond.YEAR_TO, cond.yearTo);
		final DropDownChoice<Integer> selToMonth = newChoice("selMonthTo",
				SearchCond.MONTH_FROM, SearchCond.MONTH_TO, cond.monthTo);

		// 按选手查询
		final TextField<String> txtPlayer1 = new
				TextField<String>("txtPlayer1", Model.of(""));
		txtPlayer1.setRequired(false);
		final DropDownChoice<String> selSide = new
				DropDownChoice<String>("selRedBlack",
				Model.of(SearchCond.SIDE_CHOICES[SearchCond.SIDE_BOTH]),
				Arrays.asList(SearchCond.SIDE_CHOICES));
		final TextField<String> txtPlayer2 = new
				TextField<String>("txtPlayer2", Model.of(""));
		txtPlayer2.setRequired(false);

		// 按开局查
		final DropDownChoice<String> selEccoLevel1 = new
				DropDownChoice<String>("selEccoLevel1");
		final DropDownChoice<String> selEccoLevel2 = new
				DropDownChoice<String>("selEccoLevel2");
		final DropDownChoice<String> selEccoLevel3 = new
				DropDownChoice<String>("selEccoLevel3");
		final CheckBox chkWin = new CheckBox("chkWin",
				Model.of(Boolean.valueOf(cond.win)));
		final CheckBox chkDraw = new CheckBox("chkDraw",
				Model.of(Boolean.valueOf(cond.draw)));
		final CheckBox chkLoss = new CheckBox("chkLoss",
				Model.of(Boolean.valueOf(cond.loss)));

		setChoices(selEccoLevel1, EccoUtil.LEVEL_1);
		selEccoLevel1.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(selEccoLevel1.getModelValue());
				if (level1 == 0) {
					setChoices(selEccoLevel2, null);
				} else {
					setChoices(selEccoLevel2, EccoUtil.LEVEL_2[level1 - 1]);
				}
				setChoices(selEccoLevel3, null);
				target.addComponent(selEccoLevel2);
				target.addComponent(selEccoLevel3);
			}
		});
		selEccoLevel2.setEnabled(false);
		selEccoLevel2.setOutputMarkupId(true);
		selEccoLevel2.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(selEccoLevel1.getModelValue());
				int level2 = Integer.parseInt(selEccoLevel2.getModelValue());
				if (level2 == 0) {
					setChoices(selEccoLevel3, null);
				} else {
					setChoices(selEccoLevel3,
							EccoUtil.LEVEL_3[level1 - 1][level2 - 1]);
				}
				target.addComponent(selEccoLevel3);
			}
		});
		selEccoLevel3.setEnabled(false);
		selEccoLevel3.setOutputMarkupId(true);

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				setResponsePanel(new ResultPanel(cond));
			}
		};
		add(frm);

		frm.add(txtEvent, selFromYear, selFromMonth, selToYear, selToMonth);
		frm.add(txtPlayer1, selSide, txtPlayer2);
		frm.add(selEccoLevel1, selEccoLevel2, selEccoLevel3);
		frm.add(chkWin, chkDraw, chkLoss);
	}
}