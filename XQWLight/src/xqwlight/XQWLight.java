/*
XQWLight.java - Source Code for XiangQi Wizard Light, Part VI

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.11, Last Modified: Dec. 2007
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
	public StartUp startUp;
	public MainForm mainForm;

	public boolean flipped;
	public int handicap, level;

	public XQWLight() {
		startUp = new StartUp(this);
		mainForm = new MainForm(this);
	}

	public void startApp() {
		Display.getDisplay(this).setCurrent(startUp);
	}

    public void pauseApp() {
    	// Do Nothing
    }

    public void destroyApp(boolean unc) {
    	Display.getDisplay(this).setCurrent(null);
    }
}
