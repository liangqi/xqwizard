/*
MainForm.java - Source Code for XiangQi Wizard Light, Part IV

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.0, Last Modified: Aug. 2007
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
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

public class MainForm extends Canvas implements CommandListener {
	private static Image imgBackground, imgBoard, imgThinking;
	private static Image imgSelected, imgSelected2, imgCursor, imgCursor2;
	private static Image[] imgPieces = new Image[24];
	private static final String[] IMAGE_NAME = {
		null, null, null, null, null, null, null, null,
		null, "rk", "ra", "rb", "rn", "rr", "rc", "rp",
		null, "bk", "ba", "bb", "bn", "br", "bc", "bp",
	};
	private static int widthBackground, heightBackground;

	static {
		try {
			imgBackground = Image.createImage("/images/background.gif");
			imgBoard = Image.createImage("/images/board.gif");
			imgThinking = Image.createImage("/images/thinking.gif");
			imgSelected = Image.createImage("/images/selected.gif");
			imgSelected2 = Image.createImage("/images/selected2.gif");
			imgCursor = Image.createImage("/images/cursor.gif");
			imgCursor2 = Image.createImage("/images/cursor2.gif");
			for (int pc = 0; pc < 24; pc ++) {
				if (IMAGE_NAME[pc] == null) {
					imgPieces[pc] = null;
				} else {
					imgPieces[pc] = Image.createImage("/images/" + IMAGE_NAME[pc] + ".gif");
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
	private boolean clicking, quiting, thinking;
	private int sqSelected, mvLast;
	private String message;
	private int left, top;

	public MainForm(XQWLight midlet) {
		setTitle("象棋小巫师");
		this.midlet = midlet;
		search = new Search();
		search.pos = new Position();

		addCommand(new Command("退出", Command.EXIT, 1));

		setCommandListener(this);
	}

	public void reset() {
		search.pos.loadBoard(midlet.handicap);
		cursorX = cursorY = 7;
		clicking = quiting = thinking = false;
		message = null;
	}

	public void commandAction(Command c, Displayable d) {
		if (!clicking) {
			Display.getDisplay(midlet).setCurrent(midlet.startUp);
		}
	}

	public void paint(Graphics g) {
		int widthScreen = getWidth();
		int heightScreen = getHeight();
		for (int x = 0; x < widthScreen; x += widthBackground) {
			for (int y = 0; y < heightScreen; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		left = (widthScreen - 144) / 2;
		top = (heightScreen - 160) / 2;
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
		if (thinking) {
			sqDst = Position.DST(mvLast);
			int x, y;
			if (midlet.flipped) {
				x = (Position.FILE_X(sqDst) < 8 ? left : left + 112);
				y = (Position.FILE_X(sqDst) < 8 ? top : top + 128); 
			} else {
				x = (Position.FILE_X(sqDst) < 8 ? left + 112: left);
				y = (Position.FILE_X(sqDst) < 8 ? top + 128: top); 
			}
			g.drawImage(imgThinking, x, y, Graphics.LEFT + Graphics.TOP);
		}
		if (message != null) {
			//
		}
	}

	public void keyPressed(int code) {
		if (clicking) {
			return;
		}
		if (thinking) {
			thinking = false;
			repaint();
			return;
		} else if (quiting) {
			quiting = false;
			Display.getDisplay(midlet).setCurrent(midlet.startUp);
			return;
		}
		clicking = true;
		int deltaX = 0, deltaY = 0;
		int action = getGameAction(code);
		if (action == FIRE) {
			mvLast = 0;
			int sq = Position.COORD_XY(cursorX + 3, cursorY + 3);
			if (midlet.flipped) {
				sq = Position.SQUARE_FLIP(sq);
			}
			int pc = search.pos.squares[sq];
			if ((pc & Position.SIDE_TAG(search.pos.sdPlayer)) != 0) {
				sqSelected = sq;
			} else {
				if (sqSelected > 0 && addMove(Position.MOVE(sqSelected, sq)) && !responseMove()) {
					quiting = true;
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
		clicking = false;
    }

	private void drawSquare(Graphics g, Image image, int sq) {
		int sqLocal = (midlet.flipped ? Position.SQUARE_FLIP(sq) : sq);
		int sqX = left + (Position.FILE_X(sqLocal) - 3) * 16;
		int sqY = top + (Position.RANK_Y(sqLocal) - 3) * 16;
		g.drawImage(image, sqX, sqY, Graphics.LEFT + Graphics.TOP);
	}

	private boolean getResult() {
		return false;
	}

	private boolean responseMove() {
		if (getResult()) {
			return false;
		}
		thinking = true;
		return true;
	}

	private boolean addMove(int mv) {
		if (search.pos.legalMove(mv) && search.pos.makeMove(mv)) {
			int pc = search.pos.squares[Position.DST(mv)];
			if (pc > 0) {
				search.pos.setIrrev();
			}
			sqSelected = 0;
			mvLast = mv;
			return true;
		} else {
			return false;
		}
	}
}