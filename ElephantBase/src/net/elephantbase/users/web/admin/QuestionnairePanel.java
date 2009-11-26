package net.elephantbase.users.web.admin;

import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.admin.questionnaire.ClearPanel;
import net.elephantbase.users.web.admin.questionnaire.CommentPanel;
import net.elephantbase.users.web.admin.questionnaire.AnswerPanel;

import org.apache.wicket.markup.html.link.Link;

public class QuestionnairePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public QuestionnairePanel() {
		super("调查问卷报告");

		add(new Link<Void>("lnk") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new AnswerPanel(),
						new CommentPanel(), new ClearPanel());
			}
		});
	}
}