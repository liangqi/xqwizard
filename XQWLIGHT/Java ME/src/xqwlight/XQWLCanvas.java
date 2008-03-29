/*
XQWLCanvas.java - Source Code for XiangQi Wizard Light, Part IV

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.24, Last Modified: Mar. 2008
Copyright (C) 2004-2008 www.elephantbase.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
package xqwlight;

import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

class XQWLCanvas extends Canvas {
	private static final int PHASE_LOADING = 0;
	private static final int PHASE_WAITING = 1;
	private static final int PHASE_THINKING = 2;
	private static final int PHASE_EXITTING = 3;

	private static final int RESP_CLICK = 0;
	private static final int RESP_ILLEGAL = 1;
	private static final int RESP_MOVE = 2;
	private static final int RESP_MOVE2 = 3;
	private static final int RESP_CAPTURE = 4;
	private static final int RESP_CAPTURE2 = 5;
	private static final int RESP_CHECK = 6;
	private static final int RESP_CHECK2 = 7;
	private static final int RESP_WIN = 8;
	private static final int RESP_DRAW = 9;
	private static final int RESP_LOSS = 10;

	private static Image imgXQWLight, imgBackground, imgThinking;
	private Image imgBoard;
	private static final String[] IMAGE_NAME = {
		null, null, null, null, null, null, null, null,
		"rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
		"bk", "ba", "bb", "bn", "br", "bc", "bp", null,
	};
	private static int widthBackground, heightBackground;
	private static Font fontLarge = Font.getFont(Font.FACE_SYSTEM,
			Font.STYLE_BOLD + Font.STYLE_ITALIC, Font.SIZE_LARGE);
	private static Font fontSmall = Font.getFont(Font.FACE_SYSTEM,
			Font.STYLE_BOLD, Font.SIZE_SMALL);

	static {
		try {
			imgXQWLight = Image.createImage("/images/xqwlight.png");
			imgBackground = Image.createImage("/images/background.png");
			imgThinking = Image.createImage("/images/thinking.png");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		widthBackground = imgBackground.getWidth();
		heightBackground = imgBackground.getHeight();
	}

	XQWLMIDlet midlet;
	byte[] retractData = new byte[XQWLMIDlet.RS_DATA_LEN];

	private Position pos = new Position();
	private Search search = new Search(pos, 12);
	private String message;
	private int cursorX, cursorY;
	private int sqSelected, mvLast;
	// Assume FullScreenMode = false
	private int normalWidth = getWidth();
	private int normalHeight = getHeight();

	Alert altAbout = new Alert("关于\"象棋小巫师\"", null, imgXQWLight, AlertType.INFO);
	Command cmdBack = new Command("返回", Command.ITEM, 1);
	Command cmdRetract = new Command("悔棋", Command.ITEM, 1);
	Command cmdAbout = new Command("关于", Command.ITEM, 1);
	volatile int phase = PHASE_LOADING;

	private boolean init = false;
	private Image imgSelected, imgSelected2, imgCursor, imgCursor2;
	private Image[] imgPieces = new Image[24];
	private int squareSize, width, height, left, right, top, bottom;

	private boolean bCompatible = false;

	XQWLCanvas(XQWLMIDlet midlet_) {
		this.midlet = midlet_;
		setFullScreenMode(true);
		altAbout.setTimeout(Alert.FOREVER);
		altAbout.setString(midlet.getAppProperty("MIDlet-Description") +
				"\n\r\f象棋百科全书 荣誉出品\n\r\f\n\r\f" +
				"(C) 2004-2008 www.elephantbase.net\n\r\f本产品符合GNU通用公共许可协议\n\r\f\n\r\f" +
				"欢迎登录 www.elephantbase.net\n\r\f免费下载PC版 象棋巫师");
		addCommand(cmdBack);
		addCommand(cmdRetract);
		addCommand(cmdAbout);

		if (midlet.getAppProperty("XQWLight-Compatible").toLowerCase().equals("true")) {
			bCompatible = true;
		}

		setCommandListener(new CommandListener() {
			public void commandAction(Command c, Displayable d) {
				if (phase == PHASE_WAITING || phase == PHASE_EXITTING) {
					if (false) {
						// Code Style
					} else if (c == cmdBack) {
						midlet.rsData[0] = 0;
						midlet.startMusic("form");
						Display.getDisplay(midlet).setCurrent(midlet.form);
					} else if (c == cmdRetract) {
						// Restore Retract Status
						System.arraycopy(retractData, 0, midlet.rsData, 0, XQWLMIDlet.RS_DATA_LEN);
						load();
						repaint();
						serviceRepaints();
					} else if (c == cmdAbout) {
						Display.getDisplay(midlet).setCurrent(altAbout);
						phase = PHASE_LOADING;
						setFullScreenMode(true);
					}
				}
			}
		});
	}

	void load() {
		setFullScreenMode(true);
		cursorX = cursorY = 7;
		sqSelected = mvLast = 0;
		if (midlet.rsData[0] == 0) {
			pos.fromFen(Position.STARTUP_FEN[midlet.handicap]);
		} else {
			// Restore Record-Score Data
			pos.clearBoard();
			for (int sq = 0; sq < 256; sq ++) {
				int pc = midlet.rsData[sq + 256];
				if (pc > 0) {
					pos.addPiece(sq, pc);
				}
			}
			if (midlet.flipped) {
				pos.changeSide();
			}
			pos.setIrrev();
		}
		// Backup Retract Status
		System.arraycopy(midlet.rsData, 0, retractData, 0, XQWLMIDlet.RS_DATA_LEN);
		// Call "responseMove()" if Computer Moves First
		phase = PHASE_LOADING;
		if (pos.sdPlayer == 0 ? midlet.flipped : !midlet.flipped) {
			new Thread() {
				public void run() {
					while (phase == PHASE_LOADING) {
						try {
							sleep(100);
						} catch (Exception e) {
							// Ignored
						}
					}
					responseMove();
				}
			}.start();
		}
	}

	protected void paint(Graphics g) {
		if (phase == PHASE_LOADING) {
			// Wait 1 second for resizing
			width = getWidth();
			height = getHeight();
			for (int i = 0; i < 10; i ++) {
				if (width != normalWidth || height != normalHeight) {
					break;
				}
				try {
					Thread.sleep(100);
				} catch (Exception e) {
					// Ignored
				}
				width = getWidth();
				height = getHeight();
			}
			if (!init) {
				init = true;
				// "width" and "height" are Full-Screen values
				String imagePath = "/images/";
				squareSize = Math.min(width / 9, height / 10);
				if (false) {
					// Code Style
				} else if (squareSize >= 36) {
					squareSize = 36;
					imagePath += "large/";
				} else if (squareSize >= 26) {
					squareSize = 26;
					imagePath += "medium/";
				} else if (squareSize >= 18) {
					squareSize = 18;
					imagePath += "small/";
				} else {
					squareSize = 13;
					imagePath += "tiny/";
				}
				int boardWidth = squareSize * 9;
				int boardHeight = squareSize * 10;
				try {
					imgBoard = Image.createImage(imagePath + "board.png");
					imgSelected = Image.createImage(imagePath + "selected.png");
					imgSelected2 = Image.createImage(imagePath + "selected2.png");
					imgCursor = Image.createImage(imagePath + "cursor.png");
					imgCursor2 = Image.createImage(imagePath + "cursor2.png");
					for (int pc = 0; pc < 24; pc ++) {
						if (IMAGE_NAME[pc] == null) {
							imgPieces[pc] = null;
						} else {
							imgPieces[pc] = Image.createImage(imagePath + IMAGE_NAME[pc] + ".png");
						}
					}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
				left = (width - boardWidth) / 2;
				top = (height - boardHeight) / 2;
				right = left + boardWidth - 32;
				bottom = top + boardHeight - 32;
			}
			phase = PHASE_WAITING;
		}
		for (int x = 0; x < width; x += widthBackground) {
			for (int y = 0; y < height; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		g.drawImage(imgBoard, left, top, Graphics.LEFT + Graphics.TOP);
		for (int sq = 0; sq < 256; sq ++) {
			if (Position.IN_BOARD(sq)) {
				int pc = pos.squares[sq];
				if (pc > 0) {
					drawSquare(g, imgPieces[pc], sq);
				}
			}
		}
		int sqSrc = 0;
		int sqDst = 0;
		if (mvLast > 0) {
			sqSrc = Position.SRC(mvLast);
			sqDst = Position.DST(mvLast);
			drawSquare(g, (pos.squares[sqSrc] & 8) == 0 ? imgSelected : imgSelected2, sqSrc);
			drawSquare(g, (pos.squares[sqDst] & 8) == 0 ? imgSelected : imgSelected2, sqDst);
		} else if (sqSelected > 0) {
			drawSquare(g, (pos.squares[sqSelected] & 8) == 0 ? imgSelected : imgSelected2, sqSelected);
		}
		int sq = Position.COORD_XY(cursorX + Position.FILE_LEFT, cursorY + Position.RANK_TOP);
		if (midlet.flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		if (sq == sqSrc || sq == sqDst || sq == sqSelected) {
			drawSquare(g, (pos.squares[sq] & 8) == 0 ? imgCursor2 : imgCursor, sq);
		} else {
			drawSquare(g, (pos.squares[sq] & 8) == 0 ? imgCursor : imgCursor2, sq);
		}
		if (phase == PHASE_THINKING) {
			int x, y;
			if (midlet.flipped) {
				x = (Position.FILE_X(sqDst) < 8 ? left : right);
				y = (Position.RANK_Y(sqDst) < 8 ? top : bottom);
			} else {
				x = (Position.FILE_X(sqDst) < 8 ? right: left);
				y = (Position.RANK_Y(sqDst) < 8 ? bottom: top);
			}
			g.drawImage(imgThinking, x, y, Graphics.LEFT + Graphics.TOP);
		} else if (phase == PHASE_EXITTING) {
			g.setFont(fontLarge);
			g.setColor(0x0000ff);
			g.drawString(message, width / 2, height / 2, Graphics.HCENTER + Graphics.BASELINE);
		}

		if (bCompatible) {
			g.setFont(fontSmall);
			g.setColor(0x0000ff);
			g.drawString("* - 退出", 0, height, Graphics.LEFT + Graphics.BASELINE);
			g.drawString("0 - 悔棋", width / 2, height, Graphics.HCENTER + Graphics.BASELINE);
			g.drawString("# - 关于", width, height, Graphics.RIGHT + Graphics.BASELINE);
		}
	}

	protected void keyPressed(int code) {
		if (phase == PHASE_EXITTING) {
			midlet.startMusic("form");
			Display.getDisplay(midlet).setCurrent(midlet.form);
			return;
		}
		if (phase == PHASE_THINKING) {
			return;
		}

		if (bCompatible) {
			switch (code) {
			case KEY_STAR:
				midlet.rsData[0] = 0;
				midlet.startMusic("form");
				Display.getDisplay(midlet).setCurrent(midlet.form);
				return;
			case KEY_NUM0:
				// Restore Retract Status
				System.arraycopy(retractData, 0, midlet.rsData, 0, XQWLMIDlet.RS_DATA_LEN);
				load();
				repaint();
				serviceRepaints();
				return;
			case KEY_POUND:
				Display.getDisplay(midlet).setCurrent(altAbout);
				phase = PHASE_LOADING;
				setFullScreenMode(true);
				return;
			}
		}

		int deltaX = 0, deltaY = 0;
		int action = getGameAction(code);
		if (action == FIRE || code == KEY_NUM5) {
			clickSquare();
		} else {
			switch (action) {
			case UP:
				deltaY = -1;
				break;
			case LEFT:
				deltaX = -1;
				break;
			case RIGHT:
				deltaX = 1;
				break;
			case DOWN:
				deltaY = 1;
				break;
			default:
				switch (code) {
				case KEY_NUM1:
					deltaX = -1;
					deltaY = -1;
					break;
				case KEY_NUM2:
					deltaY = -1;
					break;
				case KEY_NUM3:
					deltaX = 1;
					deltaY = -1;
					break;
				case KEY_NUM4:
					deltaX = -1;
					break;
				case KEY_NUM6:
					deltaX = 1;
					break;
				case KEY_NUM7:
					deltaX = -1;
					deltaY = 1;
					break;
				case KEY_NUM8:
					deltaY = 1;
					break;
				case KEY_NUM9:
					deltaX = 1;
					deltaY = 1;
					break;
				}
			}
			cursorX = (cursorX + deltaX + 9) % 9;
			cursorY = (cursorY + deltaY + 10) % 10;
		}
		repaint();
		serviceRepaints();
	}

	protected void pointerPressed(int x, int y) {
		if (phase == PHASE_EXITTING) {
			midlet.startMusic("form");
			Display.getDisplay(midlet).setCurrent(midlet.form);
			return;
		}
		if (phase == PHASE_THINKING) {
			return;
		}
		cursorX = Util.MIN_MAX(0, (x - left) / squareSize, 8);
		cursorY = Util.MIN_MAX(0, (y - top) / squareSize, 9);
		clickSquare();
		repaint();
		serviceRepaints();
	}

	private void clickSquare() {
		int sq = Position.COORD_XY(cursorX + Position.FILE_LEFT, cursorY + Position.RANK_TOP);
		if (midlet.flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		int pc = pos.squares[sq];
		if ((pc & Position.SIDE_TAG(pos.sdPlayer)) != 0) {
			midlet.playSound(RESP_CLICK);
			mvLast = 0;
			sqSelected = sq;
		} else {
			if (sqSelected > 0 && addMove(Position.MOVE(sqSelected, sq)) && !responseMove()) {
				midlet.rsData[0] = 0;
				phase = PHASE_EXITTING;
			}
		}
	}

	private void drawSquare(Graphics g, Image image, int sq) {
		int sqFlipped = (midlet.flipped ? Position.SQUARE_FLIP(sq) : sq);
		int sqX = left + (Position.FILE_X(sqFlipped) - Position.FILE_LEFT) * squareSize;
		int sqY = top + (Position.RANK_Y(sqFlipped) - Position.RANK_TOP) * squareSize;
		g.drawImage(image, sqX, sqY, Graphics.LEFT + Graphics.TOP);
	}

	/** Player Move Result */
	private boolean getResult() {
		return getResult(-1);
	}

	/** Computer Move Result */
	private boolean getResult(int response) {
		if (pos.isMate()) {
			midlet.playSound(response < 0 ? RESP_WIN : RESP_LOSS);
			message = (response < 0 ? "祝贺你取得胜利！" : "请再接再厉！");
			return true;
		}
		int vlRep = pos.repStatus(3);
		if (vlRep > 0) {
			vlRep = (response < 0 ? pos.repValue(vlRep) : -pos.repValue(vlRep));
			midlet.playSound(vlRep > Position.WIN_VALUE ? RESP_LOSS :
					vlRep < -Position.WIN_VALUE ? RESP_WIN : RESP_DRAW);
			message = (vlRep > Position.WIN_VALUE ? "长打作负，请不要气馁！" :
					vlRep < -Position.WIN_VALUE ? "电脑长打作负，祝贺你取得胜利！" : "双方不变作和，辛苦了！");
			return true;
		}
		if (pos.moveNum > 100) {
			midlet.playSound(RESP_DRAW);
			message = "超过自然限着作和，辛苦了！";
			return true;
		}
		if (response >= 0) {
			midlet.playSound(response);
			// Backup Retract Status
			System.arraycopy(midlet.rsData, 0, retractData, 0, XQWLMIDlet.RS_DATA_LEN);
			// Backup Record-Score Data
			midlet.rsData[0] = 1;
			System.arraycopy(pos.squares, 0, midlet.rsData, 256, 256);
		}
		return false;
	}

	private boolean addMove(int mv) {
		if (pos.legalMove(mv)) {
			if (pos.makeMove(mv)) {
				midlet.playSound(pos.inCheck() ? RESP_CHECK :
						pos.captured() ? RESP_CAPTURE : RESP_MOVE);
				if (pos.captured()) {
					pos.setIrrev();
				}
				sqSelected = 0;
				mvLast = mv;
				return true;
			}
			midlet.playSound(RESP_ILLEGAL);
		}
		return false;
	}

	boolean responseMove() {
		if (getResult()) {
			return false;
		}
		phase = PHASE_THINKING;
		repaint();
		serviceRepaints();
		mvLast = search.searchMain(1000 << (midlet.level << 1));
		pos.makeMove(mvLast);
		int response = RESP_MOVE2;
		if (pos.captured()) {
			response = RESP_CAPTURE2;
			pos.setIrrev();
		}
		if (pos.inCheck()) {
			response = RESP_CHECK2;
		}
		phase = PHASE_WAITING;
		repaint();
		serviceRepaints();
		return !getResult(response);
	}
}