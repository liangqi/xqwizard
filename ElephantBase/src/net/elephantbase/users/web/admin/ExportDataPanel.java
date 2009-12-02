package net.elephantbase.users.web.admin;

import java.io.ByteArrayOutputStream;

import net.elephantbase.users.biz.Users;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.wicket.WicketUtil;

import org.apache.wicket.markup.html.link.Link;

public class ExportDataPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ExportDataPanel() {
		super("导出用户数据");

		add(new Link<Void>("lnk") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				Users.backup(baos);
				WicketUtil.download("sql.gz", "application/x-gzip", baos.toByteArray());
			}
		});
	}
}