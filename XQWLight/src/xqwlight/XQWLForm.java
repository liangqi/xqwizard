/*
XQWLForm.java - Source Code for XiangQi Wizard Light, Part III

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.21, Last Modified: Jan. 2008
Copyright (C) 2004-2008 www.elephantbase.net

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
import javax.microedition.lcdui.Gauge;
import javax.microedition.lcdui.Item;
import javax.microedition.lcdui.ItemStateListener;
import javax.microedition.lcdui.Ticker;

public class XQWLForm extends Form {
	private XQWLMIDlet midlet;
	private Command cmdStart = new Command("开始", Command.OK, 1);
	private Command cmdExit = new Command("退出", Command.BACK, 1);

	public ChoiceGroup cgToMove = new ChoiceGroup("谁先走", Choice.EXCLUSIVE,
			new String[] {"我先走", "电脑先走"}, null);
	public ChoiceGroup cgHandicap = new ChoiceGroup("先走让子", Choice.POPUP,
			new String[] {"不让子", "让左马", "让双马", "让九子"}, null);
	public ChoiceGroup cgLevel = new ChoiceGroup("电脑水平", Choice.POPUP,
			new String[] {"入门", "业余", "专业"}, null);
	public Gauge gSound = new Gauge("音效", true, 5, 0);
	public Gauge gMusic = new Gauge("音乐", true, 5, 0);

	public XQWLForm(XQWLMIDlet midlet_) {
		super("象棋小巫师");
		this.midlet = midlet_;
		append(cgToMove);
		append(cgHandicap);
		append(cgLevel);
		append(gSound);
		append(gMusic);
		addCommand(cmdStart);
		addCommand(cmdExit);
		setTicker(new Ticker("欢迎登录 www.elephantbase.net 免费下载PC版 象棋巫师"));

		setCommandListener(new CommandListener() {
			public void commandAction(Command c, Displayable d) {
				if (false) {
					// Code Style
				} else if (c == cmdStart) {
					midlet.flipped = cgToMove.isSelected(1);
					midlet.handicap = cgHandicap.getSelectedIndex();
					midlet.level = cgLevel.getSelectedIndex();
					midlet.sound = gSound.getValue();
					midlet.music = gMusic.getValue();
					midlet.canvas.load();
					midlet.startMusic("canvas");
					Display.getDisplay(midlet).setCurrent(midlet.canvas);
				} else if (c == cmdExit) {
					midlet.destroyApp(false);
					midlet.notifyDestroyed();
				}
			}
		});

		setItemStateListener(new ItemStateListener() {
			public void itemStateChanged(Item i) {
				if (false) {
					// Code Style
				} else if (i == gSound) {
					midlet.sound = gSound.getValue();
					midlet.playSound(0);
				} else if (i == gMusic) {
					int originalMusic = midlet.music;
					midlet.music = gMusic.getValue();
					if (midlet.music == 0) {
						midlet.stopMusic();
					} else if (originalMusic == 0) {
						midlet.startMusic("form");
					} else {
						midlet.setMusicVolume();
					}
				}
			}
		});
	}
}