package net.elephantbase.pgndb.web;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.net.URLEncoder;

import org.apache.wicket.behavior.SimpleAttributeModifier;
import org.apache.wicket.markup.html.WebComponent;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.Link;

import net.elephantbase.cchess.MoveParser;
import net.elephantbase.cchess.Position;
import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;
import net.elephantbase.ecco.Ecco;
import net.elephantbase.pgndb.biz.EccoUtil;
import net.elephantbase.pgndb.biz.PgnInfo;
import net.elephantbase.pgndb.biz.SearchCond;
import net.elephantbase.users.web.BasePanel;
import net.elephantbase.util.wicket.WicketUtil;

public class PgnPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	private static final String[] RESULT_STRING = {
		" (结果未知)", " (红胜)", " (和局)", " (黑胜)",
	};

	private static final String[] RESULT_TAG = {
		"*", "1-0", "1/2-1/2", "0-1",
	};

	public PgnPanel(PgnInfo pgnInfo) {
		super(pgnInfo.getResult() + " - " + PgnDBPage.SUFFIX, WANT_AUTH);

		// 从数据库中读取棋谱
		String sql = "SELECT event, round, date, site, redteam, red, " +
				"blackteam, black, ecco, movelist, result FROM " +
				ConnectionPool.MYSQL_TABLEPRE + "pgn WHERE sid = ?";
		Object[] row = DBUtil.executeQuery(11, sql, Integer.valueOf(pgnInfo.getSid()));
		final String event = (String) row[0];
		final String round = (String) row[1];
		final String date = (String) row[2];
		final String site = (String) row[3];
		final String redTeam = (String) row[4];
		final String red = (String) row[5];
		final String blackTeam = (String) row[6];
		final String black = (String) row[7];
		final String ecco = EccoUtil.id2ecco(((Integer) row[8]).intValue());
		String moveList = (String) row[9];
		int result = ((Integer) row[10]).intValue();
		if (result < 1 || result > 3) {
			result = 0;
		}
		final String resultTag = RESULT_TAG[result];

		// 赛事、结果、地点、Flash、开局
		add(new Label("lblEvent", pgnInfo.getEvent()));
		add(new Label("lblResult", pgnInfo.getResult()));
		add(new Label("lblDateSite", pgnInfo.getDateSite()));
		add(new Label("lblBlack", "黑方 " + blackTeam + " " + black));
		WebComponent embed = new WebComponent("embed");
		try {
			embed.add(new SimpleAttributeModifier("flashvars",
					"MoveList=" + URLEncoder.encode(moveList, "UTF-8")));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		add(embed);
		add(new Label("lblRed", "红方 " + redTeam + " " + red));
		Link<Void> lnkEcco = new Link<Void>("lnkEcco") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				setResponsePanel(new ResultPanel(new SearchCond(ecco)));
			}
		};
		lnkEcco.add(new Label("lblOpening", pgnInfo.getOpening()));
		add(lnkEcco);

		// 走法
		StringBuilder sb = new StringBuilder();
		Position pos = new Position();
		pos.fromFen(Position.STARTUP_FEN[0]);
		String[] iccsMoves = moveList.split(" ");
		for (String iccsMove : iccsMoves) {
			if (iccsMove.length() < 5) {
				continue;
			}
			int mv = MoveParser.iccs2Move(iccsMove);
			if (mv == 0) {
				continue;
			}
			String file = MoveParser.move2File(mv, pos);
			String chin = MoveParser.file2Chin(file, pos.sdPlayer);
			if (pos.sdPlayer == 0) {
				int counter = (pos.distance / 2 + 1);
				sb.append((counter < 10 ? " " : "") + counter + ". " + chin + " ");
			} else {
				sb.append(chin + "\n");
			}
			pos.makeMove(mv);
		}
		if (pos.sdPlayer == 1) {
			sb.append("\n");
		}
		final String content = sb.toString();
		add(new Label("lblContent", content + "　　" + RESULT_STRING[result]));

		// 下载棋谱
		add(new Link<Void>("lnkPgn") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				PrintStream out = new PrintStream(baos);
				out.println("[Game \"Chinese Chess\"]");
				out.println("[Event \"" + event + "\"]");
				out.println("[Round \"" + round + "\"]");
				out.println("[Date \"" + date + "\"]");
				out.println("[Site \"" + site + "\"]");
				out.println("[RedTeam \"" + redTeam + "\"]");
				out.println("[Red \"" + red + "\"]");
				out.println("[BlackTeam \"" + blackTeam + "\"]");
				out.println("[Black \"" + black + "\"]");
				out.println("[Result \"" + resultTag + "\"]");
				out.println("[ECCO \"" + ecco + "\"]");
				out.println("[Opening \"" + Ecco.opening(ecco) + "\"]");
				out.println("[Variation \"" + Ecco.variation(ecco) + "\"]");
				out.print(content);
				out.println(resultTag);
				out.println("============================");
				out.println(" 欢迎访问《象棋百科全书网》 ");
				out.println(" 推荐用《象棋巫师》观赏棋谱 ");
				out.println("http://www.elephantbase.net/");
				WicketUtil.download("pgn", "text/plain", baos.toByteArray());
			}
		});
	}
}