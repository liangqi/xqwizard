package net.elephantbase.questionnaire.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.wicket.markup.html.WebPage;

import net.elephantbase.db.DBUtil;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.users.web.ClosePanel;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Integers;
import net.elephantbase.util.wicket.WicketUtil;

public class QuestionnairePage extends WebPage {
	{
		HttpServletRequest req = WicketUtil.getServletRequest();
		String sql = "INSERT INTO xq_qn_user (eventip, eventtime) VALUES (?, ?)";
		int[] insertId = new int[1];
		DBUtil.update(insertId, sql, req.getRemoteHost(),
				Integer.valueOf(EasyDate.currTimeSec()));
		int uid = insertId[0];
		int qid = 1;
		String s;
		while ((s = req.getParameter("a" + qid)) != null) {
			int a = Integers.parseInt(s);
			if (a == 0) {
				continue;
			}
			sql = "INSERT INTO xq_qn_answer (uid, qid, answer) VALUES (?, ?, ?)";
			DBUtil.update(sql, Integer.valueOf(uid),
					Integer.valueOf(qid), Integer.valueOf(a));
			qid ++;
		}
		String comment = req.getParameter("comment");
		if (comment != null && !comment.isEmpty()) {
			sql = "INSERT INTO xq_qn_comment (uid, comment) VALUES (?, ?)";
			DBUtil.update(sql, Integer.valueOf(uid), comment);
		}
		ClosePanel panel = new ClosePanel("问卷调查", "象棋巫师问卷调查");
		panel.setLink("【返回】", "history.back()");
		panel.setInfo("感谢您参与此次问卷调查");
		BasePanel.setResponsePanel(panel);
	}
}