package net.elephantbase.questionnaire;

import net.elephantbase.questionnaire.web.QuestionnairePage;

import org.apache.wicket.protocol.http.WebApplication;

public class QuestionnaireApp extends WebApplication {
	@Override
	public Class<? extends QuestionnairePage> getHomePage() {
		return QuestionnairePage.class;
	}
}