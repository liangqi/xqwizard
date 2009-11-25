package net.elephantbase.users.web.admin;

import org.apache.wicket.markup.html.link.Link;

import net.elephantbase.users.web.BasePanel;

public class QnReportPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public QnReportPanel() {
		super("调查问卷报告");

		add(new Link<Void>("lnk") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				// Do Nothing
			}
		});
	}
}