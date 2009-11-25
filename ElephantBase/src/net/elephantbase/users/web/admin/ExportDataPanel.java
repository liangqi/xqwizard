package net.elephantbase.users.web.admin;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.zip.GZIPOutputStream;

import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.Logger;
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
				final PrintStream out;
				try {
					out = new PrintStream(new GZIPOutputStream(baos));
				} catch (Exception e) {
					Logger.severe(e);
					throw new RuntimeException(e);
				}

				String sql = "SELECT uid, username, password, salt, email " +
						"FROM uc_members";
				DBUtil.query(5, sql, new RowCallback() {
					@Override
					public Object onRow(Object[] row) {
						String username = DBUtil.escape((String) row[1]);
						String email = DBUtil.escape((String) row[4]);
						out.printf("INSERT INTO uc_members " +
								"(uid, username, password, salt, email) VALUES " +
								"(%d, '%s', '%s', '%s', '%s'));\r\n",
								row[0], username, row[2], row[3], email);
						return null;
					}
				});

				sql = "SELECT uid, usertype, score, points, charged " +
						"FROM xq_user";
				DBUtil.query(5, sql, new RowCallback() {
					@Override
					public Object onRow(Object[] row) {
						out.printf("INSERT INTO xq_user " +
								"(uid, usertype, score, points, charged) VALUES " +
								"(%d, %d, %d, %d, %d);\r\n",
								row[0], row[1], row[2], row[3], row[4]);
						return null;
					}
				});

				out.close();
				WicketUtil.download("sql.gz", "application/x-gzip", baos.toByteArray());
			}
		});
	}
}