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
		setChoices(component, choices, -1);
	}

	static void setChoices(DropDownChoice<String> component, String[] choices,
			int index) {
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
		component.setModel(Model.of(choiceList.get(index + 1)));
	}

	public SearchPanel(final SearchCond cond) {
		super("搜索棋谱", PgnDBPage.SUFFIX, WANT_AUTH);

		// 按赛事、时间查询
		final TextField<String> txtEvent = new
				TextField<String>("txtEvent", Model.of(cond.event));
		final DropDownChoice<Integer> selYearFrom = newChoice("selYearFrom",
				SearchCond.YEAR_FROM, SearchCond.YEAR_TO, cond.yearFrom);
		final DropDownChoice<Integer> selMonthFrom = newChoice("selMonthFrom",
				SearchCond.MONTH_FROM, SearchCond.MONTH_TO, cond.monthFrom);
		final DropDownChoice<Integer> selYearTo = newChoice("selYearTo",
				SearchCond.YEAR_FROM, SearchCond.YEAR_TO, cond.yearTo);
		final DropDownChoice<Integer> selMonthTo = newChoice("selMonthTo",
				SearchCond.MONTH_FROM, SearchCond.MONTH_TO, cond.monthTo);

		// 按选手查询
		final TextField<String> txtPlayer1 = new
				TextField<String>("txtPlayer1", Model.of(cond.player1));
		final DropDownChoice<String> selSide = new
				DropDownChoice<String>("selRedBlack",
				Model.of(SearchCond.SIDE_CHOICES[cond.side]),
				Arrays.asList(SearchCond.SIDE_CHOICES));
		final TextField<String> txtPlayer2 = new
				TextField<String>("txtPlayer2", Model.of(cond.player2));

		// 按开局查
		final DropDownChoice<String> selLevel1 = new
				DropDownChoice<String>("selLevel1");
		final DropDownChoice<String> selLevel2 = new
				DropDownChoice<String>("selLevel2");
		final DropDownChoice<String> selLevel3 = new
				DropDownChoice<String>("selLevel3");
		final CheckBox chkWin = new CheckBox("chkWin",
				Model.of(Boolean.valueOf(cond.win)));
		final CheckBox chkDraw = new CheckBox("chkDraw",
				Model.of(Boolean.valueOf(cond.draw)));
		final CheckBox chkLoss = new CheckBox("chkLoss",
				Model.of(Boolean.valueOf(cond.loss)));

		setChoices(selLevel1, EccoUtil.LEVEL_1, cond.level1);
		if (cond.level1 < 0) {
			selLevel2.setEnabled(false);
			selLevel3.setEnabled(false);
		} else {
			setChoices(selLevel2, EccoUtil.LEVEL_2[cond.level1], cond.level2);
			if (cond.level2 < 0) {
				selLevel3.setEnabled(false);
			} else {
				setChoices(selLevel3,
						EccoUtil.LEVEL_3[cond.level1][cond.level2], cond.level3);
			}
		}

		selLevel1.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(selLevel1.getModelValue()) - 1;
				if (level1 < 0) {
					setChoices(selLevel2, null);
				} else {
					setChoices(selLevel2, EccoUtil.LEVEL_2[level1]);
				}
				setChoices(selLevel3, null);
				target.addComponent(selLevel2);
				target.addComponent(selLevel3);
			}
		});
		selLevel2.setOutputMarkupId(true);
		selLevel2.add(new OnChangeAjaxBehavior() {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onUpdate(AjaxRequestTarget target) {
				int level1 = Integer.parseInt(selLevel1.getModelValue());
				int level2 = Integer.parseInt(selLevel2.getModelValue());
				if (level2 == 0) {
					setChoices(selLevel3, null);
				} else {
					setChoices(selLevel3,
							EccoUtil.LEVEL_3[level1 - 1][level2 - 1]);
				}
				target.addComponent(selLevel3);
			}
		});
		selLevel3.setOutputMarkupId(true);

		Form<Void> frm = new Form<Void>("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				SearchCond cond_ = new SearchCond();
				cond_.event = txtEvent.getModelObject();
				cond_.yearFrom = selYearFrom.getModelObject().intValue();
				cond_.monthFrom = selMonthFrom.getModelObject().intValue();
				cond_.yearTo = selYearTo.getModelObject().intValue();
				cond_.monthTo = selMonthTo.getModelObject().intValue();
				cond_.player1 = txtPlayer1.getModelObject();
				cond_.side = Integer.parseInt(selSide.getModelValue());
				cond_.player2 = txtPlayer2.getModelObject();
				cond_.level1 = Integer.parseInt(selLevel1.getModelValue()) - 1;
				cond_.level2 = Integer.parseInt(selLevel2.getModelValue()) - 1;
				cond_.level3 = Integer.parseInt(selLevel3.getModelValue()) - 1;
				cond_.win = chkWin.getModelObject().booleanValue();
				cond_.draw = chkDraw.getModelObject().booleanValue();
				cond_.loss = chkLoss.getModelObject().booleanValue();
				cond_.validate();
				setResponsePanel(new ResultPanel(cond_));
			}
		};
		add(frm);

		frm.add(txtEvent, selYearFrom, selMonthFrom, selYearTo, selMonthTo);
		frm.add(txtPlayer1, selSide, txtPlayer2);
		frm.add(selLevel1, selLevel2, selLevel3);
		frm.add(chkWin, chkDraw, chkLoss);
	}
}