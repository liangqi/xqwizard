/*
StartUp.java - Source Code for XiangQi Wizard Light, Part III

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

import javax.microedition.lcdui.Choice;
import javax.microedition.lcdui.ChoiceGroup;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Ticker;

public class XQWLForm extends Form implements CommandListener {
	private XQWLMIDlet midlet;
	private Command cmdStart, cmdExit;

	public ChoiceGroup cgToMove, cgHandicap, cgLevel, cgSound;

	public XQWLForm(XQWLMIDlet midlet) {
		super(midlet.getAppProperty("MIDlet-Name") + " " + midlet.getAppProperty("MIDlet-Version"));
		this.midlet = midlet;

		cgToMove = new ChoiceGroup("谁先走", Choice.EXCLUSIVE, new String[] {"我先走", "电脑先走"}, null);
		append(cgToMove);
		cgHandicap = new ChoiceGroup("先走让子", Choice.POPUP, new String[] {"不让子", "让单马", "让双马", "让九子"}, null);
		append(cgHandicap);
		cgLevel = new ChoiceGroup("电脑水平", Choice.POPUP, new String[] {"入门", "业余", "专业"}, null);
		append(cgLevel);
		cgSound = new ChoiceGroup("选项", Choice.MULTIPLE, new String[] {"音效"}, null);
		append(cgSound);

		cmdStart = new Command("开始", Command.OK, 1);
		cmdExit = new Command("退出", Command.BACK, 1);

		addCommand(cmdStart);
		addCommand(cmdExit);

		setTicker(new Ticker("欢迎登录 www.elephantbase.net 免费下载PC版 象棋巫师"));
		setCommandListener(this);
	}

	public void commandAction(Command c, Displayable d) {
		if (false) {
			// Code Style
		} else if (c == cmdStart) {
			midlet.flipped = cgToMove.isSelected(1);
			midlet.handicap = cgHandicap.getSelectedIndex();
			midlet.level = cgLevel.getSelectedIndex();
			midlet.sound = cgSound.isSelected(0);
			midlet.canvas.reset();
			Display.getDisplay(midlet).setCurrent(midlet.canvas);
		} else if (c == cmdExit) {
			midlet.destroyApp(false);
			midlet.notifyDestroyed();
		}
	}
}