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
	private static Image imgBackground, imgBoard, imgSelected, imgCursor;
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
			imgSelected = Image.createImage("/images/selected.gif");
			imgCursor = Image.createImage("/images/cursor.gif");
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
	private boolean clicking;

	public MainForm(XQWLight midlet) {
		this.midlet = midlet;
		search = new Search();
		search.pos = new Position();

		addCommand(new Command("ÍË³ö", Command.EXIT, 1));

		setCommandListener(this);
	}

	public void reset() {
		search.pos.loadBoard(midlet.handicap);
		cursorX = cursorY = 7;
		clicking = false;
	}

	public void commandAction(Command c, Displayable d) {
		if (!clicking) {
			Display.getDisplay(midlet).setCurrent(midlet.startUp);
		}
	}

	private int sqSelected, mvLast;
	private int left, top;

	private void drawSquare(Graphics g, Image image, int sq) {
		int sqX = left + (Position.FILE_X(sq) - 3) * 16;
		int sqY = top + (Position.RANK_Y(sq) - 3) * 16;
		g.drawImage(image, sqX, sqY, Graphics.LEFT + Graphics.TOP);
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
		if (mvLast > 0) {
			drawSquare(g, imgSelected, Position.SRC(mvLast));
			drawSquare(g, imgSelected, Position.DST(mvLast));
		} else if (sqSelected > 0) {
			drawSquare(g, imgSelected, sqSelected);
		}
		drawSquare(g, imgCursor, Position.COORD_XY(cursorX + 3, cursorY + 3));
	}

	public void keyPressed(int code) {
		if (clicking) {
			return;
		}
		int deltaX = 0, deltaY = 0;
		int action = getGameAction(code);
		if (action == FIRE) {
			mvLast = 0;
			sqSelected = Position.COORD_XY(cursorX + 3, cursorY + 3);
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
			case FIRE:
				break;
			}
			cursorX = (cursorX + deltaX + 9) % 9;
			cursorY = (cursorY + deltaY + 10) % 10;
		}
		repaint();
    }
}