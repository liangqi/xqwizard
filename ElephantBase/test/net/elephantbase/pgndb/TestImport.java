package net.elephantbase.pgndb;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import net.elephantbase.cchess.PgnFile;
import net.elephantbase.db.ConnectionPool;
import net.elephantbase.db.DBUtil;

public class TestImport {
	public static void main(String[] args) throws Exception {
		String sql = "INSERT INTO " + ConnectionPool.MYSQL_TABLEPRE + "pgns " +
				"(event, date, site, redteam, red, blackteam, black, " +
				"ecco, movelist, maxmoves, result) " +
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		File pgnDir = new File("D:\\PGNS");
		File[] files = pgnDir.listFiles();
		for (File file : files) {
			BufferedReader in = new BufferedReader(new FileReader(file));
			PgnFile pgn = new PgnFile();
			in.close();
			DBUtil.executeUpdate(sql, pgn.getMoveList());
		}
	}
}