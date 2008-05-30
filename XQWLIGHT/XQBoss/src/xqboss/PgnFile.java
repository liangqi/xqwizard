package xqboss;

import java.util.Vector;

import xqwlight.Position;

public class PgnFile {
	private static byte[] copySquares(byte[] squares) {
		byte[] bb = new byte[squares.length];
		System.arraycopy(squares, 0, bb, 0, squares.length);
		return bb;
	}

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
	public String redTeam = null, red = null, redElo = null;
	public String blackTeam = null, black = null, blackElo = null;
	public String ecco = null, opening = null, variation = null;
	public int maxMoves = 0, result = 0;
	public Vector lstComment = new Vector();
	public Vector lstSquares = new Vector();

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
		lstSquares.addElement(copySquares(pos.squares));
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
							if (index + 2 <= s.length() &&
									s.substring(index, index + 2).equals("-1")) {
								return;
							}
							break;
						case '1':
							if (index + 2 <= s.length() &&
									s.substring(index, index + 2).equals("-0")) {
								return;
							} else if (index + 6 <= s.length() &&
									s.substring(index, index + 6).equals("/2-1/2")) {
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
										if (index + 3 <= s.length()) {
											mv = MoveParser.file2Move(s.
													substring(index - 1, index + 3), pos);
											if (mv > 0) {
												index += 3;
											}
										}
									} else if (index + 4 <= s.length()) {
										mv = MoveParser.iccs2Move(s.
												substring(index - 1, index + 4));
										if (mv > 0) {
											index += 4;
										}
									}
								}
							} else {
								if (c >= (char) 128 && index + 3 <= s.length()) {
									String strFile = MoveParser.chin2File(s.
											substring(index - 1, index + 3));
									System.out.println(s.substring(index - 1, index + 3) + "->" + strFile);
									mv = MoveParser.file2Move(strFile, pos);
									if (mv > 0) {
										index += 3;
									}
								}
							}
							// Try Move
							lstComment.addElement(new StringBuffer());
							maxMoves ++;
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
						String value;
						if (false) {
							// Code Style
						} else if ((value = getLabel(s, "EVENT")) != null) {
							event = value;
						} else if ((value = getLabel(s, "ROUND")) != null) {
							round = value;
						} else if ((value = getLabel(s, "DATE")) != null) {
							date = value;
						} else if ((value = getLabel(s, "SITE")) != null) {
							site = value;
						} else if ((value = getLabel(s, "REDTEAM")) != null) {
							redTeam = value;
						} else if ((value = getLabel(s, "RED")) != null) {
							red = value;
						} else if ((value = getLabel(s, "REDELO")) != null) {
							redElo = value;
						} else if ((value = getLabel(s, "BLACKTEAM")) != null) {
							blackTeam = value;
						} else if ((value = getLabel(s, "BLACK")) != null) {
							black = value;
						} else if ((value = getLabel(s, "BLACKELO")) != null) {
							blackElo = value;
						} else if ((value = getLabel(s, "RESULT")) != null) {
							result = value.equals("*") ? 0 : value.equals("1-0") ? 1 :
									value.equals("1/2-1/2") ? 2 : value.equals("0-1") ? 3 : 0;
						} else if ((value = getLabel(s, "ECCO")) != null) {
							ecco = value;
						} else if ((value = getLabel(s, "OPENING")) != null) {
							opening = value;
						} else if ((value = getLabel(s, "VARIATION")) != null) {
							variation = value;
						} else if ((value = getLabel(s, "FORMAT")) != null) {
							notation = value.toUpperCase().startsWith("WFX") ? 1 :
								value.toUpperCase().startsWith("ICCS") ? 2 : 0;
						} else if ((value = getLabel(s, "FEN")) != null) {
							pos.fromFen(value);
							lstSquares.setElementAt(copySquares(pos.squares), index);
						}
						returned = true;
					} else {
						detail = true;
					}
				}
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