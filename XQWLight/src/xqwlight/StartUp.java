/*
StartUp.java - Source Code for XiangQi Wizard Light, Part III

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.0 Beta2, Last Modified: Sep. 2007
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

import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.Choice;
import javax.microedition.lcdui.ChoiceGroup;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.Image;

public class StartUp extends Form implements CommandListener {
	private static Alert altAbout;

	static {
		try {
			Image image = Image.createImage("/images/xqwlarge.png");
			altAbout = new Alert("关于\"象棋小巫师\"", "象棋小巫师 1.0 Beta2\n象棋百科全书 荣誉出品\n\n" +
	                "欢迎登录 www.elephantbase.net\n免费下载PC版 象棋巫师", image, AlertType.INFO);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		altAbout.setTimeout(Alert.FOREVER);
	}

	private XQWLight midlet;

	private ChoiceGroup cgToMove;
	private ChoiceGroup cgHandicap;
	private ChoiceGroup cgLevel;

	private Command cmdAbout;
	private Command cmdStart;

	public StartUp(XQWLight midlet) {
		super("开始 - 象棋小巫师");
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
		append(cgHandicap);

		append("电脑水平：");
		cgLevel = new ChoiceGroup(null, Choice.POPUP);
		cgLevel.append("入门", null);
		cgLevel.append("业余", null);
		cgLevel.append("专业", null);
		append(cgLevel);

		cmdAbout = new Command("关于\"象棋小巫师\"", Command.BACK, 1);
		cmdStart = new Command("开始", Command.OK, 2);

		addCommand(cmdAbout);
		addCommand(cmdStart);

		cgLevel.setSelectedIndex(0, true);
		cgToMove.setSelectedIndex(0, true);
		cgHandicap.setSelectedIndex(0, true);

		setCommandListener(this);
	}

	public void commandAction(Command c, Displayable d) {
		if (false) {
			// Code Style
		} else if (c == cmdAbout) {
			Display.getDisplay(midlet).setCurrent(altAbout);
		} else if (c == cmdStart) {
			midlet.flipped = cgToMove.isSelected(1);
			midlet.handicap = cgHandicap.getSelectedIndex();
			midlet.level = cgLevel.getSelectedIndex();
			midlet.mainForm.reset();
			Display.getDisplay(midlet).setCurrent(midlet.mainForm);
		}
	}
}
