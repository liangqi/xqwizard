package net.elephantbase.xqbase;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import net.elephantbase.cchess.PgnReader;
import net.elephantbase.db.DBUtil;
import net.elephantbase.util.Integers;
import net.elephantbase.xqbase.biz.EccoUtil;

public class ImportPgns {
	public static void main(String[] args) throws Exception {
		String sql = "INSERT INTO xq_pgn (year, month, event, round, date, site, " +
				"redteam, red, blackteam, black, movelist, ecco, maxmoves, result) " +
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		File pgnDir = new File("D:\\PGNS");
		File[] files = pgnDir.listFiles();
		for (File file : files) {
			BufferedReader in = new BufferedReader(new FileReader(file));
			PgnReader pgn = new PgnReader();
			pgn.load(in);
			in.close();
			String round = pgn.getRound();
			String site = pgn.getSite();
			round = round.equals("?") ? "" : round;
			site = site.equals("?") ? "" : site;
			String date = pgn.getDate();
			String[] ss = date.split("\\.");
			int year = Integers.parseInt(ss[0], -1);
			int month = Integers.parseInt(ss[1], -1);
			int day = Integers.parseInt(ss[2], -1);
			date = (year < 0 ? "" : year + "Äê");
			date += (month < 0 ? "" : month + "ÔÂ");
			date += (day < 0 ? "" : day + "ÈÕ");
			String moveList = pgn.getMoveList();
			int eccoId = EccoUtil.ecco2id(EccoUtil.parseEcco(moveList));
			DBUtil.update(sql, Integer.valueOf(year), Integer.valueOf(month),
					pgn.getEvent(), round, date, site, pgn.getRedTeam(), pgn.getRed(),
					pgn.getBlackTeam(), pgn.getBlack(), moveList, Integer.valueOf(eccoId),
					Integer.valueOf(pgn.size()), Integer.valueOf(pgn.getResult()));
		}
	}
}