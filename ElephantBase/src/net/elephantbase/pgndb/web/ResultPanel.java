package net.elephantbase.pgndb.web;

import java.util.ArrayList;

import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.db.RowCallback;
import net.elephantbase.pgndb.biz.EccoUtil;
import net.elephantbase.pgndb.biz.PgnUtil;
import net.elephantbase.pgndb.biz.PgnInfo;
import net.elephantbase.pgndb.biz.SearchCond;
import net.elephantbase.users.web.BasePanel;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebMarkupContainer;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.markup.html.navigation.paging.PagingNavigator;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.markup.repeater.data.DataView;
import org.apache.wicket.markup.repeater.data.ListDataProvider;

public class ResultPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private static final int LINK_NONE = 0;
	private static final int LINK_PGN = 1;
	private static final int LINK_ECCO = 2;

	public ResultPanel(final SearchCond cond) {
		super("搜索结果 - " + PgnDBPage.SUFFIX, WANT_AUTH);

		// 从数据库中搜索棋谱
		final ArrayList<PgnInfo> resultList = new ArrayList<PgnInfo>();
		String sql = "SELECT sid, event, round, date, site, redteam, red, blackteam, " +
				"black, ecco, result FROM " + ConnectionPool.MYSQL_TABLEPRE + "pgn";
		DBUtil.executeQuery(11, sql, new RowCallback() {
			@Override
			public Object onRow(Object[] row) {
				int sid = ((Integer) row[0]).intValue();
				String event = PgnUtil.toEventString((String) row[1], (String) row[2]);
				String result = PgnUtil.toResultString((String) row[5], (String) row[6],
						(String) row[7], (String) row[8], 0, ((Integer) row[10]).intValue());
				String dateSite = PgnUtil.toDateSiteString((String) row[3], (String) row[4]);
				String ecco = EccoUtil.id2ecco(((Integer) row[9]).intValue());
				String opening = PgnUtil.getOpeningString(ecco);
				resultList.add(new PgnInfo(sid, event, result, dateSite, opening));
				return null;
			}
		});

		// 显示搜索结果列表
		DataView<PgnInfo> dataView = new DataView<PgnInfo>("resultList",
				new ListDataProvider<PgnInfo>(resultList)) {
			private static final long serialVersionUID = 1L;

			private void addTd(Item<PgnInfo> item, String tag,
					String content, int limit, final int type) {
				WebMarkupContainer td = new WebMarkupContainer("td" + tag);
				td.add(new SimpleAttributeModifier("title", content));
				td.add(new SimpleAttributeModifier("bgcolor",
						item.getIndex() % 2 == 0 ? "#EEEEEE" : "DDDDDD"));
				Label lbl = new Label("lbl" + tag, content.length() < limit ? content :
						content.substring(0, limit - 2) + "...");
				if (type == LINK_NONE) {
					td.add(lbl);
				} else {
					final PgnInfo pgnInfo = item.getModelObject();
					Link<Void> lnk = new Link<Void>("lnk" + tag) {
						private static final long serialVersionUID = 1L;

						@Override
						public void onClick() {
							if (type == LINK_PGN) {
								setResponsePanel(new PgnPanel(pgnInfo));
							} else {
								setResponsePanel(new ResultPanel(cond));
							}
						}
					};
					lnk.add(lbl);
					td.add(lnk);
				}
				item.add(td);
			}

			@Override
			protected void populateItem(Item<PgnInfo> item) {
				PgnInfo entry = item.getModelObject();
				addTd(item, "Event", entry.getEvent(), 15, LINK_NONE);
				addTd(item, "Result", entry.getResult(), 20, LINK_PGN);
				addTd(item, "DateSite", entry.getDateSite(), 10, LINK_NONE);
				addTd(item, "Opening", entry.getOpening(), 20, LINK_ECCO);
			}			
		};
		dataView.setItemsPerPage(20);
		add(dataView);

		// 显示上下两行返回链接和翻页链接
		add(new Link<Void>("lnkBackTop") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new SearchPanel(cond));
			}
		});
		add(new PagingNavigator("navTop", dataView));
		add(new Link<Void>("lnkBackBottom") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new SearchPanel(cond));
			}
		});
		add(new PagingNavigator("navBottom", dataView));
	}
}