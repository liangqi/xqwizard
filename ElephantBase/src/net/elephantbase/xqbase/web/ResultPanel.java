package net.elephantbase.xqbase.web;

import java.util.List;

import net.elephantbase.users.web.BasePanel;
import net.elephantbase.xqbase.biz.PgnInfo;
import net.elephantbase.xqbase.biz.SearchCond;

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

	public ResultPanel(String ecco) {
		this(new SearchCond(ecco));
	}

	public ResultPanel(final SearchCond cond) {
		super(cond.toString(), XQBasePage.SUFFIX, WANT_AUTH);

		List<PgnInfo> resultList = cond.search();
		if (resultList.isEmpty()) {
			setWarn("没有找到符合条件的棋谱");
		} else {
			setInfo("共找到" + resultList.size() + "份棋谱");
		}

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
								setResponsePanel(new DetailPanel(pgnInfo));
							} else {
								String ecco = pgnInfo.getOpening().substring(0, 3);
								setResponsePanel(new ResultPanel(ecco));
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