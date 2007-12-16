/*
MainForm.java - Source Code for XiangQi Wizard Light, Part IV

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.13, Last Modified: Dec. 2007
Copyright (C) 2004-2007 www.elephantbase.net

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

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

public class MainForm extends Canvas implements CommandListener {
	private static final int PHASE_STARTING = 0;
	private static final int PHASE_WAITING = 1;
	private static final int PHASE_THINKING = 2;
	private static final int PHASE_EXITTING = 3;

	private static Image imgBackground, imgThinking;
	private Image imgBoard;
	private static final String[] IMAGE_NAME = {
		null, null, null, null, null, null, null, null,
		null, "rk", "ra", "rb", "rn", "rr", "rc", "rp",
		null, "bk", "ba", "bb", "bn", "br", "bc", "bp",
	};
	private static int widthBackground, heightBackground;
	private static Font font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_BOLD + Font.STYLE_ITALIC, Font.SIZE_LARGE);
	private static int fontWidth = font.charWidth('　');
	private static int fontHeight = font.getHeight();

	static {
		try {
			imgBackground = Image.createImage("/images/background.png");
			imgThinking = Image.createImage("/images/thinking.png");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		widthBackground = imgBackground.getWidth();
		heightBackground = imgBackground.getHeight();
	}

	private XQWLight midlet;
	private Search search;

	private int cursorX, cursorY;
	private int sqSelected, mvLast;
	private int normalWidth, normalHeight;
	private volatile int phase;
	private String message;
	private Command cmdRetract, cmdBack;

	private boolean bLoaded;
	private Image imgSelected, imgSelected2, imgCursor, imgCursor2;
	private Image[] imgPieces = new Image[24];
	private int squareSize, squareShift;
	private int width, height, left, right, top, bottom;

	public MainForm(XQWLight midlet) {
		this.midlet = midlet;
		search = new Search();
		search.pos = new Position();
		// Assume FullScreenMode = false
		normalWidth = getWidth();
		normalHeight = getHeight();
		setFullScreenMode(true);
		// cmdRetract = new Command("悔棋", Command.OK, 1);
		// addCommand(cmdRetract);
		cmdBack = new Command("返回", Command.BACK, 1);
		addCommand(cmdBack);
		setCommandListener(this);
		phase = PHASE_STARTING;
		bLoaded = false;
	}

	public void reset() {
		setFullScreenMode(true);
		cursorX = cursorY = 7;
		sqSelected = mvLast = 0;
		if (midlet.rsData[0] == 0) {
			search.pos.fromFen(Position.STARTUP_FEN[midlet.handicap]);
		} else {
			search.pos.clearBoard();
			for (int sq = 0; sq < 256; sq ++) {
				int pc = midlet.rsData[sq + 2];
				if (pc > 0) {
					search.pos.addPiece(sq, pc);
				}
			}
			if (midlet.flipped) {
				search.pos.changeSide();
			}
			search.pos.setIrrev();
		}
		phase = PHASE_STARTING;
	}

	public void commandAction(Command c, Displayable d) {
		if (phase == PHASE_WAITING || phase == PHASE_EXITTING) {
			if (false) {
				// Code Style
			} else if (c == cmdRetract) {
				// Not Available, Never Occurs
			} else if (c == cmdBack) {
				midlet.rsData[0] = 0;
				Display.getDisplay(midlet).setCurrent(midlet.startUp);
			}
		}
	}

	protected void paint(Graphics g) {
		if (phase == PHASE_STARTING) {
			phase = PHASE_WAITING;
			// Wait 1 second for resizing
			width = getWidth();
			height = getHeight();
			for (int i = 0; i < 10; i ++) {
				if (width != normalWidth || height != normalHeight) {
					break;
				}
				width = getWidth();
				height = getHeight();
				try {
					Thread.sleep(100);
				} catch (Exception e) {
					// Ignored
				}
			}
			if (!bLoaded) {
				bLoaded = true;
				// "width" and "height" are Full-Screen values
				String imagePath = "/images/";
				if (width >= 320 && height >= 356) {
					imagePath += "large/";
					squareSize = 36;
					squareShift = 2;
				} else if (width >= 232 && height >= 258) {
					imagePath += "medium/";
					squareSize = 26;
					squareShift = 1;
				} else {
					imagePath += "small/";
					squareSize = 18;
					squareShift = 1;
				}
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
				int boardWidth = imgBoard.getWidth();
				int boardHeight = imgBoard.getHeight();
				left = (width - boardWidth) / 2;
				top = (height - boardHeight) / 2;
				right = left + boardWidth - 32;
				bottom = top + boardHeight - 32;
			}
			if (search.pos.sdPlayer == 0 ? midlet.flipped : !midlet.flipped) {
				responseMove();
				return;
			}
		}
		for (int x = 0; x < width; x += widthBackground) {
			for (int y = 0; y < height; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		g.drawImage(imgBoard, left, top, Graphics.LEFT + Graphics.TOP);
		for (int sq = 0; sq < 256; sq ++) {
			if (Position.IN_BOARD(sq)) {
				int pc = search.pos.squares[sq];
				if (pc > 0) {
					drawPiece(g, imgPieces[pc], sq);
				}
			}
		}
		int sqSrc = 0;
		int sqDst = 0;
		if (mvLast > 0) {
			sqSrc = Position.SRC(mvLast);
			sqDst = Position.DST(mvLast);
			drawPiece(g, (search.pos.squares[sqSrc] & 8) == 0 ? imgSelected : imgSelected2, sqSrc);
			drawPiece(g, (search.pos.squares[sqDst] & 8) == 0 ? imgSelected : imgSelected2, sqDst);
		} else if (sqSelected > 0) {
			drawPiece(g, (search.pos.squares[sqSelected] & 8) == 0 ? imgSelected : imgSelected2, sqSelected);
		}
		int sq = Position.COORD_XY(cursorX + 3, cursorY + 3);
		if (midlet.flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		if (sq == sqSrc || sq == sqDst || sq == sqSelected) {
			drawCursor(g, (search.pos.squares[sq] & 8) == 0 ? imgCursor2 : imgCursor, sq);
		} else {
			drawCursor(g, (search.pos.squares[sq] & 8) == 0 ? imgCursor : imgCursor2, sq);
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
			g.setFont(font);
			g.setColor(0x0000ff);
			g.drawString(message, (width - message.length() * fontWidth) / 2, (height - fontHeight) / 2, Graphics.LEFT + Graphics.TOP);
		}
	}

	protected void keyPressed(int code) {
		if (phase == PHASE_EXITTING) {
			Display.getDisplay(midlet).setCurrent(midlet.startUp);			
			return;
		}
		int deltaX = 0, deltaY = 0;
		int action = getGameAction(code);
		if (action == FIRE || code == KEY_NUM5) {
			int sq = Position.COORD_XY(cursorX + 3, cursorY + 3);
			if (midlet.flipped) {
				sq = Position.SQUARE_FLIP(sq);
			}
			int pc = search.pos.squares[sq];
			if ((pc & Position.SIDE_TAG(search.pos.sdPlayer)) != 0) {
				mvLast = 0;
				sqSelected = sq;
			} else {
				if (sqSelected > 0 && addMove(Position.MOVE(sqSelected, sq)) && !responseMove()) {
					mvLast = 0;
					midlet.rsData[0] = 0;
					phase = PHASE_EXITTING;
					repaint();
					serviceRepaints();
					return;
				}
			}
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

	private void drawCursor(Graphics g, Image image, int sq) {
		drawSquare(g, image, sq, true);
	}

	private void drawPiece(Graphics g, Image image, int sq) {
		drawSquare(g, image, sq, false);
	}

	private void drawSquare(Graphics g, Image image, int sq, boolean cursor) {
		int shift = (cursor ? 0 : squareShift);
		int sqLocal = (midlet.flipped ? Position.SQUARE_FLIP(sq) : sq);
		int sqX = left + (Position.FILE_X(sqLocal) - 3) * squareSize + shift;
		int sqY = top + (Position.RANK_Y(sqLocal) - 3) * squareSize + shift;
		g.drawImage(image, sqX, sqY, Graphics.LEFT + Graphics.TOP);
	}

	private boolean getResult(boolean computer) {
		if (search.pos.isMate()) {
			message = computer ? "请再接再厉！" : "祝贺你取得胜利！";
			return true;
		}
		int vlRep = search.pos.repStatus(3);
		if (vlRep > 0) {
			vlRep = (computer ? -search.pos.repValue(vlRep) : search.pos.repValue(vlRep));
			message = (vlRep > Position.WIN_VALUE ? "长打作负，请不要气馁！" : vlRep < -Position.WIN_VALUE ? "电脑长打作负，祝贺你取得胜利！" : "双方不变作和，辛苦了！");
			return true;
		}
		if (search.pos.moveNum == 100) {
			message = "超过自然限着作和，辛苦了！";
			return true;
		}
		if (computer) {
			midlet.rsData[0] = (byte) (midlet.level + 1);
			midlet.rsData[1] = (byte) (midlet.flipped ? 1 : 0);
			System.arraycopy(search.pos.squares, 0, midlet.rsData, 2, 256);
		}
		return false;
	}

	private boolean addMove(int mv) {
		if (search.pos.legalMove(mv)) {
			int pc = search.pos.squares[Position.DST(mv)];
			if (search.pos.makeMove(mv)) {
				if (pc > 0) {
					search.pos.setIrrev();
				}
				sqSelected = 0;
				mvLast = mv;
				return true;
			}
		}
		return false;
	}

	public boolean responseMove() {
		if (getResult(false)) {
			return false;
		}
		phase = PHASE_THINKING;
		repaint();
		serviceRepaints();
		search.searchMain(1 << (midlet.level << 1));
		int pc = search.pos.squares[Position.DST(search.mvResult)];
		search.pos.makeMove(search.mvResult);
		if (pc > 0) {
			search.pos.setIrrev();
		}
		mvLast = search.mvResult;
		phase = PHASE_WAITING;
		repaint();
		serviceRepaints();
		return !getResult(true);
	}
}