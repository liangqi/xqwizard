/*
StartUp.java - Source Code for XiangQi Wizard Light, Part III

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.12, Last Modified: Dec. 2007
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

public class StartUp extends Form implements CommandListener {
	private XQWLight midlet;
	private ChoiceGroup cgToMove, cgHandicap, cgLevel;
	private Command cmdStart, cmdExit;

	public StartUp(XQWLight midlet) {
		super("象棋小巫师 1.12");
		this.midlet = midlet;

		append("谁先走：");
		cgToMove = new ChoiceGroup(null, Choice.EXCLUSIVE);
		cgToMove.append("我先走", null);
		cgToMove.append("电脑先走", null);
		append(cgToMove);

		append("先走让子：");
		cgHandicap = new ChoiceGroup(null, Choice.POPUP);
		cgHandicap.append("不让子", null);
		cgHandicap.append("让单马", null);
		cgHandicap.append("让双马", null);
		cgHandicap.append("让九子", null);
		// cgHandicap.append("调试", null);
		append(cgHandicap);

		append("电脑水平：");
		cgLevel = new ChoiceGroup(null, Choice.POPUP);
		cgLevel.append("入门", null);
		cgLevel.append("业余", null);
		cgLevel.append("专业", null);
		append(cgLevel);

		cmdStart = new Command("开始", Command.OK, 1);
		cmdExit = new Command("退出", Command.BACK, 1);

		addCommand(cmdStart);
		addCommand(cmdExit);

		cgLevel.setSelectedIndex(0, true);
		cgToMove.setSelectedIndex(0, true);
		cgHandicap.setSelectedIndex(0, true);

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
			midlet.mainForm.reset();
			Display.getDisplay(midlet).setCurrent(midlet.mainForm);
		} else if (c == cmdExit) {
			midlet.notifyDestroyed();
		}
	}
}