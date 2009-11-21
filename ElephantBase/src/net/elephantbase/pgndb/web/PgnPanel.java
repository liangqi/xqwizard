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
		super(pgnInfo.getResult(), PgnDBPage.SUFFIX, WANT_AUTH);

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
				setResponsePanel(new ResultPanel(ecco));
			}
		};
		lnkEcco.add(new Label("lblOpening", pgnInfo.getOpening()));
		add(lnkEcco);

		// 走法
		StringBuilder sb = new StringBuilder();
		Position pos = new Position();
		pos.fromFen(Position.STARTUP_FEN[0]);
		String[] iccsMoves = moveList.split(" ");
		int counter = 0;
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
				counter ++;
				sb.append((counter < 10 ? " " : "") + counter + ". " + chin + " ");
			} else {
				sb.append(chin + "\r\n");
			}
			pos.makeMove(mv);
			if (pos.captured()) {
				pos.setIrrev();
			}
		}
		if (pos.sdPlayer == 1) {
			sb.append("\r\n");
		}
		final String content = sb.toString();
		Label lblContent = new Label("lblContent", content.replaceAll(" ", "&nbsp;").
				replaceAll("\r\n", "<br>") + "　　" + RESULT_STRING[result]);
		lblContent.setEscapeModelStrings(false);
		add(lblContent);

		// 下载棋谱
		add(new Link<Void>("lnkPgn") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				PrintStream out = new PrintStream(baos);
				out.print("[Game \"Chinese Chess\"]\r\n");
				out.printf("[Event \"%s\"]\r\n", event);
				out.printf("[Round \"%s\"]\r\n", round);
				out.printf("[Date \"%s\"]\r\n", date);
				out.printf("[Site \"%s\"]\r\n", site);
				out.printf("[RedTeam \"%s\"]\r\n", redTeam);
				out.printf("[Red \"%s\"]\r\n", red);
				out.printf("[BlackTeam \"%s\"]\r\n", blackTeam);
				out.printf("[Black \"%s\"]\r\n", black);
				out.printf("[Result \"%s\"]\r\n", resultTag);
				out.printf("[ECCO \"%s\"]\r\n", ecco);
				out.printf("[Opening \"%s\"]\r\n", Ecco.opening(ecco));
				out.printf("[Variation \"%s\"]\r\n", Ecco.variation(ecco));
				out.print(content);
				out.print(resultTag + "\r\n");
				out.print("============================\r\n");
				out.print(" 欢迎访问《象棋百科全书网》 \r\n");
				out.print(" 推荐用《象棋巫师》观赏棋谱 \r\n");
				out.print("http://www.elephantbase.net/");
				WicketUtil.download("pgn", "text/plain", baos.toByteArray());
			}
		});
	}
}