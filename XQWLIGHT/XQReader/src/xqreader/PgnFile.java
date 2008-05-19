package xqreader;

import java.util.Vector;

import xqwlight.Position;

public class PgnFile {
	public String event = null, round = null, date = null, site = null;
	public String redTeam = null, red = null, redElo = null, blackTeam = null, black = null, blackElo = null;
	public String ecco = null, open = null, var = null;
	public int maxMoves = 0, result = 0;
	public Position posStart = new Position();
	public Vector lstMove = new Vector();
	public Vector lstComment = new Vector();
	public Vector lstPosition = new Vector();

	public PgnFile(GBLineInputStream in) {
		posStart.fromFen(Position.STARTUP_FEN[0]);
		boolean returned = false, detail = false;
		int remLevel = 0, remLen = 0, notation = 0, counter = 1;
		String s = in.readLine();
		int index = 0;
		boolean endFor;
		while (s != null && returned) {
			if (returned) {
				s = in.readLine();
				index = 0;
				returned = false;
			}
			if (detail) {
				if (remLevel > 0) {
					endFor = true;
					while (index < s.length()) {
						char c = s.charAt(index);
						remLevel += (c == '(' || c == '{' ? 1 : c == ')' || c == '}' ? -1 : 0);
						if (remLevel == 0) {
							
						}
					}
				}
			}
		}
	}
}