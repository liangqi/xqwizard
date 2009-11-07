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
	private String redTeam = "", red = "", redElo = "";
	private String blackTeam = "", black = "", blackElo = "";
	private String ecco = "", opening = "", variation = "";
	private int maxMoves = 0, result = 0, sdStart = 0;
	private ArrayList<Integer> sqSrcList = new ArrayList<Integer>();
	private ArrayList<Integer> sqDstList = new ArrayList<Integer>();
	private ArrayList<StringBuilder> commentList = new ArrayList<StringBuilder>();

	public PgnFile(BufferedReader in) throws IOException {
		SimplePos pos = new SimplePos();
		pos.fromFen(SimplePos.STARTUP_FEN);
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
								int sqSrc = SimplePos.SRC(mv);
								int sqDst = SimplePos.DST(mv);
								if (sqSrc == sqDst) {
									pos.squares[sqDst] = (byte) (SimplePos.SIDE_TAG(pos.sdPlayer) +
											SimplePos.PIECE_PAWN);
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
						notation = value.toUpperCase().startsWith("WXF") ? 1 :
								value.toUpperCase().startsWith("ICCS") ? 2 : 0;
					} else if ((value = getLabel(s, "FEN")) != null) {
						pos.fromFen(value);
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

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		// 1. Event String
		sb.append(event);
		if (round.length() > 0) {
			sb.append(event.length() == 0 ? "" : " ");
			try {
				int nRound = Integer.parseInt(round);
				sb.append(nRound == 98 ? "半决赛" : nRound == 99 ? "决赛" : "第" + nRound + "轮");
			} catch (Exception e) {
				sb.append(round);
			}
		}
		sb.append("\n\r");
		// 2. Result String
		if (red.length() == 0 || black.length() == 0) {
			sb.append("(着法：" + (sdStart == 0 ? "红先" : "黑先"));
			sb.append((result == 0 ? "" : result == 1 ? (sdStart == 0 ? "胜" : "负") :
					result == 2 ? "和" : (sdStart == 0 ? "负" : "胜")) + ")");
		} else {
			sb.append(redTeam + (redTeam.length() == 0 ? "" : " ") + red);
			sb.append(redElo.length() == 0 ? "" : " (" + redElo + ")");
			sb.append(result == 0 ? " (对) " :
					result == 1 ? (sdStart == 0 ? " (先胜) " : " (后胜) ") :
					result == 2 ? (sdStart == 0 ? " (先和) " : " (后和) ") :
					(sdStart == 0 ? " (先负) " : " (后负) "));
			sb.append(blackTeam + (blackTeam.length() == 0 ? "" : " ") + black);
			sb.append(blackElo.length() == 0 ? "" : " (" + blackElo + ")");
		}
		sb.append("\n\r\f");
		// 3. Date/Site String
		if (date.length() == 0) {
			sb.append(site.length() == 0 ? "" : "(弈于 " + site + ")");
		} else {
			sb.append("(" + date + (site.length() == 0 ? ")" : " 弈于 " + site + ")"));
		}
		sb.append("\n\r\f");
		// 4. Open String
		sb.append(opening + (opening.length() == 0 || variation.length() == 0 ? "" : "——"));
		sb.append(variation);
		if (ecco.length() > 0) {
			if (opening.length() == 0 && variation.length() == 0) {
				sb.append("(ECCO开局编号：" + ecco + ")");
			} else {
				sb.append("(" + ecco + ")");
			}
		}
		return sb.toString();
	}
}