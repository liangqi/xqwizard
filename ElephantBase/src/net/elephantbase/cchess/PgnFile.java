package net.elephantbase.cchess;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

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

	private String event = "", round = "", date = "", site = "";
	private String redTeam = "", red = "";
	private String blackTeam = "", black = "";
	private String ecco = "", opening = "", variation = "";
	private int maxMoves = 0, result = 0, sdStart = 0;
	private String fen = null;
	private ArrayList<Integer> sqSrcList = new ArrayList<Integer>();
	private ArrayList<Integer> sqDstList = new ArrayList<Integer>();
	private ArrayList<StringBuilder> commentList = new ArrayList<StringBuilder>();

	
	public void load(BufferedReader in) throws IOException {
		Position pos = new Position();
		pos.fromFen(Position.STARTUP_FEN[0]);
		boolean returned = false, detail = false;
		int remLevel = 0, notation = 0;
		String s = in.readLine();
		if (s == null) {
			return;
		}
		int index = 0;
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
						commentList.get(maxMoves).append(c);
					}
					if (endFor) {
						commentList.get(maxMoves).append("\n\r");
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
									mv = MoveParser.file2Move(strFile, pos);
									if (mv > 0) {
										index += 3;
									}
								}
							}
							if (mv > 0) {
								int sqSrc = Position.SRC(mv);
								int sqDst = Position.DST(mv);
								if (sqSrc == sqDst) {
									pos.squares[sqDst] = (byte) (Position.SIDE_TAG(pos.sdPlayer) +
											Position.PIECE_PAWN);
								} else {
									pos.squares[sqDst] = pos.squares[sqSrc];
									pos.squares[sqSrc] = 0;
								}
								pos.changeSide();
								maxMoves ++;
								// lstComment.addElement(new StringBuffer());
								sqSrcList.add(Integer.valueOf(sqSrc));
								sqDstList.add(Integer.valueOf(sqDst));
							}
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
				if (s.length() == 0) {
					returned = true;
				} else if (s.charAt(0) == '[') {
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
					} else if ((value = getLabel(s, "BLACKTEAM")) != null) {
						blackTeam = value;
					} else if ((value = getLabel(s, "BLACK")) != null) {
						black = value;
					} else if ((value = getLabel(s, "RESULT")) != null) {
						result = value.equals("*") ? 0 : value.equals("1-0") ? 1 :
								value.equals("1/2-1/2") ? 2 : value.equals("0-1") ? 3 : 0;
					} else if ((value = getLabel(s, "FORMAT")) != null) {
						notation = value.toUpperCase().startsWith("WXF") ? 1 :
								value.toUpperCase().startsWith("ICCS") ? 2 : 0;
					} else if ((value = getLabel(s, "FEN")) != null) {
						pos.fromFen(value);
						fen = value;
						sdStart = pos.sdPlayer;
					}
					returned = true;
				} else {
					detail = true;
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

	public int getSqSrc(int index) {
		return sqSrcList.get(index).intValue();
	}

	public int getSqDst(int index) {
		return sqDstList.get(index).intValue();
	}

	public String getComment(int index) {
		return commentList.get(index).toString();
	}

	public int size() {
		return maxMoves;
	}

	public String toEventString() {
		if (round.isEmpty()) {
			return event;
		}
		String strEvent = (event.isEmpty() ? "" : event + " ");
		try {
			return strEvent + "第" + Integer.parseInt(round) + "轮";
		} catch (Exception e) {
			return strEvent + round;
		}
	}

	private static final String[][] START_RESULT_1 = {
		{"红先", "红先胜", "红先和", "红先负"},
		{"黑先", "黑先负", "黑先和", "黑先胜"},
	};

	private static final String[][] START_RESULT_2 = {
		{"对", "先胜", "先和", "先负"},
		{"对", "后胜", "后和", "后负"},
	};

	public String toResultString() {
		if (red.isEmpty() || black.isEmpty()) {
			return "(着法：" + START_RESULT_1[sdStart][result] + ")";
		}
		String strRed = redTeam + (redTeam.isEmpty() ? "" : " ") + red;
		String strBlack = blackTeam + (blackTeam.isEmpty() ? "" : " ") + black;
		return strRed + " (" + START_RESULT_2 + ") " + strBlack;
	}

	public String toDateSiteString() {
		if (date.isEmpty()) {
			return site.isEmpty() ? "" : "(弈于 " + site + ")";
		}
		return "(" + date + (site.isEmpty() ? ")" : " 弈于 " + site + ")");
	}

	public String toOpenString() {
		String strOpening = opening + (opening.isEmpty() || variation.isEmpty() ? "" : "——") + variation;
		return strOpening + (ecco.isEmpty() ? "" :
				(strOpening.isEmpty() ? "(ECCO开局编号：" + ecco + ")" : "(" + ecco + ")"));
	}

	public String toFlashString() {
		String flashVars = "Position=" + fen;
		return "<embed src=\"http://pub.elephantbase.net/flashxq.swf\" " +
				"width=\"324\" height=\"396\" type=\"application/x-shockwave-flash\" " +
				"pluginspage=\"http://www.macromedia.com/go/getflashplayer\" " +
				"allowScriptAccess=\"always\" quality=\"high\" wmode=\"transparent\" " +
				"flashvars=\"" + flashVars + "\">";
	}
}