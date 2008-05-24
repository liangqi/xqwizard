package xqphd;

import java.util.Vector;

import xqwlight.Position;

public class PgnFile {
	private static String getLabel(String s, String label) {
		if (s.toUpperCase().startsWith("[" + label + " \"")) {
			int n = s.indexOf("\"]");
			if (n > 0) {
				return s.substring(label.length() + 3, n);
			}
		}
		return null;
	}

	public String event = null, round = null, date = null, site = null;
	public String redTeam = null, red = null, redElo = null, blackTeam = null, black = null, blackElo = null;
	public String ecco = null, open = null, var = null;
	public int maxMoves = 0, result = 0;
	public Vector lstComment = new Vector();
	public Vector lstPieces = new Vector();

	public PgnFile(GBLineInputStream in) {
		Position pos = new Position();
		pos.fromFen(Position.STARTUP_FEN[0]);
		boolean returned = false, detail = false;
		int remLevel = 0, notation = 0;
		String s = in.readLine();
		if (s == null) {
			return;
		}
		int index = 0;
		lstComment.addElement(new StringBuffer());
		while (true) {
			if (detail) {
				if (remLevel > 0) {
					boolean endFor = true;
					while (index < s.length()) {
						char c = s.charAt(index);
						index ++;
						remLevel += (c == '(' || c == '{' ? 1 : c == ')' || c == '}' ? -1 : 0);
						if (remLevel == 0) {
							endFor = false;
							break;
						}
						((StringBuffer) lstComment.elementAt(maxMoves)).append(c);
					}
					if (endFor) {
						((StringBuffer) lstComment.elementAt(maxMoves)).append("\n\r\f");
						returned = true;
					}
				} else {
					boolean endFor = true;
					while (index < s.length()) {
						char c = s.charAt(index);
						index ++;
						switch (c) {
						case '(':
						case '{':
							remLevel ++;
							endFor = false;
							break;
						case '0':
							if (s.substring(index, index + 2).equals("-1")) {
								return;
							}
							break;
						case '1':
							if (s.substring(index, index + 2).equals("-0")) {
								return;
							} else if (s.substring(index, index + 6).equals("/2-1/2")) {
								return;
							}
							break;
						case '*':
							return;
						default:
							int mv = 0;
							if (notation > 0) {
								if ((c >= 'A' && c <= 'Z' ) || (c >= 'a' && c <= 'z')) {
									if (notation == 1) {
										mv = MoveParser.file2Move(s.substring(index - 1, index + 3), pos);
										if (mv > 0) {
											index += 3;
										}
									} else {
										mv = MoveParser.iccs2Move(s.substring(index - 1, index + 4), pos);
										if (mv > 0) {
											index += 4;
										}
									}
								}
							} else {
								if (c >= (char) 128) {
									String strFile = MoveParser.chin2File(s.substring(index - 1, index + 3));
									mv = MoveParser.file2Move(strFile, pos);
									if (mv > 0) {
										index += 3;
									}
								}
							}
							// Try Move
							endFor = false;
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
				if (s.length() > 0) {
					if (s.charAt(0) == '[') {
						while (true) {
							event = getLabel(s, "EVENT");
							if (event != null) {
								break;
							}
						}
					} else {
						detail = false;
					}
				}
				returned = true;
			}
			if (returned) {
				s = in.readLine();
				if (s == null) {
					return;
				}
				index = 0;
				returned = false;
			}
		}
	}
}