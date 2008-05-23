package xqphd;

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
		int remLevel = 0, notation = 0;
		String s = in.readLine();
		int index = 0;
		lstMove.addElement(null);
		lstComment.addElement(new StringBuffer());
		while (s != null && returned) {
			if (returned) {
				s = in.readLine();
				index = 0;
				returned = false;
			}
			if (detail) {
				if (remLevel > 0) {
					boolean endFor = true;
					while (index < s.length()) {
						char c = s.charAt(index);
						remLevel += (c == '(' || c == '{' ? 1 : c == ')' || c == '}' ? -1 : 0);
						if (remLevel == 0) {
							endFor = false;
							index ++;
							break;
						}
						((StringBuffer) lstComment.elementAt(maxMoves)).append(c);
						index ++;
					}
					if (endFor) {
						((StringBuffer) lstComment.elementAt(maxMoves)).append("\n\r\f");
						returned = true;
					}
				} else {
					boolean endFor = true;
					while (index < s.length()) {
						char c = s.charAt(index);
						switch (c) {
						case '(':
						case '{':
							remLevel ++;
							endFor = false;
							break;
						case '0':
							// 0-1
							break;
						case '1':
							// 1-0 || 1/2-1/2
							break;
						case '*':
							// *
							break;
						default:
							if (notation > 0) {
								if ((c >= 'A' && c <= 'Z' ) || (c >= 'a' && c <= 'z')) {
									if (notation == 1) {
										// WXF
									} else {
										// ICCS
									}
								}
							}
						}
						if (!endFor) {
							break;
						}
					}
					if (endFor) {
						returned = true;
					}
				}
			} else {
				// Labels
			}
		}
	}
}