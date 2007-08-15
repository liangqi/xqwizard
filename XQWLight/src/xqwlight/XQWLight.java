/*
XQWLight.java - Source Code for XiangQi Wizard Light, Part II

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

import javax.microedition.lcdui.Display;
import javax.microedition.midlet.MIDlet;

public class XQWLight extends MIDlet {
	private StartUp startUp;
	private MainForm mainForm;

	private boolean flipped;
	private int handicap, level;

	public XQWLight() {
		startUp = new StartUp(this);
		mainForm = new MainForm(this);
	}

	public MainForm getMainForm() {
		return mainForm;
	}

	public StartUp getStartUp() {
		return startUp;
	}

	public void startApp() {
		Display.getDisplay(this).setCurrent(startUp);
	}

    public void pauseApp() {
    	// Do Nothing
    }

    public void destroyApp(boolean unc) {
    	// Do Nothing
    }

    public boolean getFlipped() {
		return flipped;
	}

    public int getHandicap() {
		return handicap;
	}

    public int getLevel() {
		return level;
	}

    public void setFlipped(boolean flipped) {
		this.flipped = flipped;
	}

    public void setHandicap(int handicap) {
		this.handicap = handicap;
	}

    public void setLevel(int level) {
		this.level = level;
	}
}