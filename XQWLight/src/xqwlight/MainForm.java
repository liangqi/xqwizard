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
	}

	private XQWLight midlet;
	private int cursorX, cursorY;
	private boolean clicking;

	public MainForm(XQWLight midlet) {
		this.midlet = midlet;

		addCommand(new Command("ÍË³ö", Command.EXIT, 1));

		cursorX = cursorY = 8;
		clicking = false;

		setCommandListener(this);
	}

	public void commandAction(Command c, Displayable d) {
		if (!clicking) {
			Display.getDisplay(midlet).setCurrent(midlet.getStartUp());
		}
	}

	public void paint(Graphics g) {
		int widthScreen = getWidth();
		int heightScreen = getHeight();
		int widthBackground = imgBackground.getWidth();
		int heightBackground = imgBackground.getHeight();
		for (int x = 0; x < widthScreen; x += widthBackground) {
			for (int y = 0; y < heightScreen; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		int left = (widthScreen - 144) / 2;
		int top = (heightScreen - 160) / 2;
		g.drawImage(imgBoard, left, top, Graphics.LEFT + Graphics.TOP);
		g.drawImage(imgSelected, left, top, Graphics.LEFT + Graphics.TOP);
		g.drawImage(imgCursor, left + cursorX * 16, top + cursorY * 16, Graphics.LEFT + Graphics.TOP);
	}

	public void keyPressed(int code) {
		if (clicking) {
			return;
		}
		int deltaX = 0, deltaY = 0;
		switch (getGameAction(code)) {
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
		cursorX = (cursorX + deltaX) % 9;
		cursorY = (cursorY + deltaY) % 10;

		// ...

		repaint();
    }
}