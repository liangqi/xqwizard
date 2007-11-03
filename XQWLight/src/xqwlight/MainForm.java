/*
MainForm.java - Source Code for XiangQi Wizard Light, Part IV

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.0, Last Modified: Nov. 2007
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

	private static Image imgBackground, imgBoard, imgThinking;
	private static Image imgSelected, imgSelected2, imgCursor, imgCursor2;
	private static Image[] imgPieces = new Image[24];
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
			imgBoard = Image.createImage("/images/board.png");
			imgThinking = Image.createImage("/images/thinking.png");
			imgSelected = Image.createImage("/images/selected.png");
			imgSelected2 = Image.createImage("/images/selected2.png");
			imgCursor = Image.createImage("/images/cursor.png");
			imgCursor2 = Image.createImage("/images/cursor2.png");
			for (int pc = 0; pc < 24; pc ++) {
				if (IMAGE_NAME[pc] == null) {
					imgPieces[pc] = null;
				} else {
					imgPieces[pc] = Image.createImage("/images/" + IMAGE_NAME[pc] + ".png");
				}
			}
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
	private String message;
	private int width, height, left, top;
	private int phase;
	private Command cmdBack, cmdExit;

	public MainForm(XQWLight midlet) {
		this.midlet = midlet;
		search = new Search();
		search.pos = new Position();

		cmdBack = new Command("返回", Command.BACK, 1);
		cmdExit = new Command("退出", Command.EXIT, 2);
		addCommand(cmdBack);
		addCommand(cmdExit);

		setCommandListener(this);
	}

	public void reset() {
		setTitle("象棋小巫师");
		search.pos.loadBoard(midlet.handicap);
		cursorX = cursorY = 7;
		sqSelected = mvLast = 0;
		width = getWidth();
		height = getHeight();
		left = (width - 144) / 2;
		top = (height - 160) / 2;
		phase = PHASE_STARTING;
	}

	public void commandAction(Command c, Displayable d) {
		if (phase == PHASE_WAITING || phase == PHASE_EXITTING) {
			if (false) {
				// Code Style
			} else if (c == cmdBack) {
				Display.getDisplay(midlet).setCurrent(midlet.startUp);
			} else if (c == cmdExit) {
				midlet.notifyDestroyed();
			}
		}
	}

	protected void paint(Graphics g) {
		if (phase == PHASE_STARTING) {
			phase = PHASE_WAITING;
			if (midlet.flipped) {
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
					drawSquare(g, imgPieces[pc], sq);
				}
			}
		}
		int sqSrc = 0;
		int sqDst = 0;
		if (mvLast > 0) {
			sqSrc = Position.SRC(mvLast);
			sqDst = Position.DST(mvLast);
			drawSquare(g, (search.pos.squares[sqSrc] & 8) == 0 ? imgSelected : imgSelected2, sqSrc);
			drawSquare(g, (search.pos.squares[sqDst] & 8) == 0 ? imgSelected : imgSelected2, sqDst);
		} else if (sqSelected > 0) {
			drawSquare(g, (search.pos.squares[sqSelected] & 8) == 0 ? imgSelected : imgSelected2, sqSelected);
		}
		int sq = Position.COORD_XY(cursorX + 3, cursorY + 3);
		if (midlet.flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		if (sq == sqSrc || sq == sqDst || sq == sqSelected) {
			drawSquare(g, (search.pos.squares[sq] & 8) == 0 ? imgCursor2 : imgCursor, sq);
		} else {
			drawSquare(g, (search.pos.squares[sq] & 8) == 0 ? imgCursor : imgCursor2, sq);
		}
		if (phase == PHASE_THINKING) {
			int x, y;
			if (midlet.flipped) {
				x = (Position.FILE_X(sqDst) < 8 ? left : left + 112);
				y = (Position.RANK_Y(sqDst) < 8 ? top : top + 128); 
			} else {
				x = (Position.FILE_X(sqDst) < 8 ? left + 112: left);
				y = (Position.RANK_Y(sqDst) < 8 ? top + 128: top); 
			}
			g.drawImage(imgThinking, x, y, Graphics.LEFT + Graphics.TOP);
		} else if (phase == PHASE_EXITTING) {
			g.setFont(font);
			g.setColor(0x0000ff);
			g.drawString(message, (width - message.length() * fontWidth) / 2, (height - fontHeight) / 2, Graphics.LEFT + Graphics.TOP);
			setTitle("棋局结束");
		}
	}

	protected void keyPressed(int code) {
		if (phase == PHASE_EXITTING) {
			Display.getDisplay(midlet).setCurrent(midlet.startUp);			
			return;
		}
		int deltaX = 0, deltaY = 0;
		int action = getGameAction(code);
		if (action == FIRE) {
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
			case DOWN:
				deltaY = 1;
				break;
			case LEFT:
				deltaX = -1;
				break;
			case RIGHT:
				deltaX = 1;
				break;
			}
			cursorX = (cursorX + deltaX + 9) % 9;
			cursorY = (cursorY + deltaY + 10) % 10;
		}
		repaint();
		serviceRepaints();
    }

	private void drawSquare(Graphics g, Image image, int sq) {
		int sqLocal = (midlet.flipped ? Position.SQUARE_FLIP(sq) : sq);
		int sqX = left + (Position.FILE_X(sqLocal) - 3) * 16;
		int sqY = top + (Position.RANK_Y(sqLocal) - 3) * 16;
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
		search.pos.makeMove(search.mvResult);
		mvLast = search.mvResult;
		int sq = Position.DST(mvLast);
		if (midlet.flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		cursorX = Position.FILE_X(sq) - 3;
		cursorY = Position.RANK_Y(sq) - 3;
		phase = PHASE_WAITING;
		repaint();
		serviceRepaints();
		return !getResult(true);
	}
}