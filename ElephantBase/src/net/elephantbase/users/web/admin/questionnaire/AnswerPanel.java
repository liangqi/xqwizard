package net.elephantbase.users.web.admin.questionnaire;

import java.io.Serializable;
import java.util.ArrayList;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.Row;
import net.elephantbase.db.RowCallback;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.UsersPage;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.list.ListItem;
import org.apache.wicket.markup.html.list.ListView;

class AnswerEntry implements Serializable {
	private static final long serialVersionUID = 1L;

	int qid, answer, count;
}

public class AnswerPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public AnswerPanel() {
		super("问卷调查报告", UsersPage.SUFFIX, NEED_ADMIN);

		final ArrayList<AnswerEntry> answerList = new ArrayList<AnswerEntry>();
		String sql = "SELECT qid, answer, COUNT(*) FROM xq_qn_answer WHERE " +
				"answer > 0 GROUP BY qid, answer ORDER BY qid, answer";
		DBUtil.query(3, new RowCallback() {
			@Override
			public boolean onRow(Row row) {
				AnswerEntry answer = new AnswerEntry();
				answer.qid = row.getInt(1);
				answer.answer = row.getInt(2);
				answer.count = row.getInt(3);
				answerList.add(answer);
				return true;
			}
		}, sql);

		ListView<AnswerEntry> listView = new
				ListView<AnswerEntry>("lstAnswer", answerList) {
			private static final long serialVersionUID = 1L;

			private void addTd(ListItem<AnswerEntry> item, String tag, String content) {
				WebMarkupContainer td = new WebMarkupContainer("td" + tag);
				td.add(new SimpleAttributeModifier("bgcolor",
						item.getIndex() % 2 == 0 ? "#EEEEEE" : "DDDDDD"));
				td.add(new Label("lbl" + tag, content));
				item.add(td);
			}

			@Override
			protected void populateItem(ListItem<AnswerEntry> item) {
				AnswerEntry answer = item.getModelObject();
				addTd(item, "Qid", "" + answer.qid);
				addTd(item, "Answer", "" + answer.answer);
				addTd(item, "Count", "" + answer.count);
			}
		};
		add(listView);
	}
}