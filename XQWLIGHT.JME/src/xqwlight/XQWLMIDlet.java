/*
XQWLMIDlet.java - Source Code for XiangQi Wizard Light, Part III

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.23, Last Modified: Mar. 2008
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

import java.io.InputStream;

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
import javax.microedition.media.Manager;
import javax.microedition.media.Player;
import javax.microedition.media.control.VolumeControl;
import javax.microedition.midlet.MIDlet;
import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;

public class XQWLMIDlet extends MIDlet {
	private static final String STORE_NAME = "XQWLight";
	/**
	 * 0: Status, 0 = Normal Exit, 1 = Game Saved
	 * 16: Player, 0 = Red, 1 = Black (Flipped)
	 * 17: Handicap, 0 = None, 1 = 1 Knight, 2 = 2 Knights, 3 = 9 Pieces
	 * 18: Level, 0 = Beginner, 1 = Amateur, 2 = Expert
	 * 19: Sound Level, 0 = Mute, 5 = Max
	 * 20: Music Level, 0 = Mute, 5 = Max
	 * 256-511: Squares
	 */
	static final String[] SOUND_NAME = {
		"click", "illegal", "move", "move2", "capture", "capture2",
		"check", "check2", "win", "draw", "loss",
	};

	static final int RS_DATA_LEN = 512;

	byte[] rsData = new byte[RS_DATA_LEN];
	boolean flipped;
	int handicap, level, sound, music;
	Player midiPlayer = null;
	Form form = new Form("象棋小巫师");
	XQWLCanvas canvas = new XQWLCanvas(this);

	Command cmdStart = new Command("开始", Command.OK, 1);
	Command cmdExit = new Command("退出", Command.BACK, 1);

	ChoiceGroup cgToMove = new ChoiceGroup("谁先走", Choice.EXCLUSIVE,
			new String[] {"我先走", "电脑先走"}, null);
	ChoiceGroup cgHandicap = new ChoiceGroup("先走让子", Choice.POPUP,
			new String[] {"不让子", "让左马", "让双马", "让九子"}, null);
	ChoiceGroup cgLevel = new ChoiceGroup("电脑水平", Choice.POPUP,
			new String[] {"入门", "业余", "专业"}, null);
	Gauge gSound = new Gauge("音效", true, 5, 0);
	Gauge gMusic = new Gauge("音乐", true, 5, 0);

	{
		form.append(cgToMove);
		form.append(cgHandicap);
		form.append(cgLevel);
		form.append(gSound);
		form.append(gMusic);
		form.addCommand(cmdStart);
		form.addCommand(cmdExit);
		form.setTicker(new Ticker("欢迎登录 www.elephantbase.net 免费下载PC版 象棋巫师"));

		form.setCommandListener(new CommandListener() {
			public void commandAction(Command c, Displayable d) {
				if (false) {
					// Code Style
				} else if (c == cmdStart) {
					flipped = cgToMove.isSelected(1);
					handicap = cgHandicap.getSelectedIndex();
					level = cgLevel.getSelectedIndex();
					sound = gSound.getValue();
					music = gMusic.getValue();
					canvas.load();
					startMusic("canvas");
					Display.getDisplay(XQWLMIDlet.this).setCurrent(canvas);
				} else if (c == cmdExit) {
					destroyApp(false);
					notifyDestroyed();
				}
			}
		});

		form.setItemStateListener(new ItemStateListener() {
			public void itemStateChanged(Item i) {
				if (false) {
					// Code Style
				} else if (i == gSound) {
					sound = gSound.getValue();
					playSound(0);
				} else if (i == gMusic) {
					int originalMusic = music;
					music = gMusic.getValue();
					if (music == 0) {
						stopMusic();
					} else if (originalMusic == 0) {
						startMusic("form");
					} else {
						setMusicVolume();
					}
				}
			}
		});
	}

	private boolean started = false;

	public void startApp() {
		if (started) {
			return;
		}
		started = true;
		for (int i = 0; i < RS_DATA_LEN; i ++) {
			rsData[i] = 0;
		}
		rsData[19] = 3;
		rsData[20] = 2;
		try {
			RecordStore rs = RecordStore.openRecordStore(STORE_NAME, true);
			RecordEnumeration re = rs.enumerateRecords(null, null, false);
			if (re.hasNextElement()) {
				int recordId = re.nextRecordId();
				if (rs.getRecordSize(recordId) == RS_DATA_LEN) {
					rsData = rs.getRecord(recordId);
				} else {
					rs.setRecord(recordId, rsData, 0, RS_DATA_LEN);
				}
			} else {
				rs.addRecord(rsData, 0, RS_DATA_LEN);
			}
			rs.closeRecordStore();
		} catch (Exception e) {
			// Ignored
		}
		flipped = (rsData[16] != 0);
		handicap = Util.MIN_MAX(0, rsData[17], 3);
		level = Util.MIN_MAX(0, rsData[18], 2);
		sound = Util.MIN_MAX(0, rsData[19], 5);
		music = Util.MIN_MAX(0, rsData[20], 5);
		cgToMove.setSelectedIndex(flipped ? 1 : 0, true);
		cgLevel.setSelectedIndex(level, true);
		cgHandicap.setSelectedIndex(handicap, true);
		gSound.setValue(sound);
		gMusic.setValue(music);
		if (rsData[0] == 0) {
			startMusic("form");
			Display.getDisplay(this).setCurrent(form);
		} else {
			canvas.load();
			startMusic("canvas");
			Display.getDisplay(this).setCurrent(canvas);
		}
	}

	public void pauseApp() {
		// Do Nothing
	}

	public void destroyApp(boolean unc) {
		stopMusic();
		rsData[16] = (byte) (flipped ? 1 : 0);
		rsData[17] = (byte) handicap;
		rsData[18] = (byte) level;
		rsData[19] = (byte) sound;
		rsData[20] = (byte) music;
		try {
			RecordStore rs = RecordStore.openRecordStore(STORE_NAME, true);
			RecordEnumeration re = rs.enumerateRecords(null, null, false);
			if (re.hasNextElement()) {
				int recordId = re.nextRecordId();
				rs.setRecord(recordId, rsData, 0, RS_DATA_LEN);
			} else {
				rs.addRecord(rsData, 0, RS_DATA_LEN);
			}
			rs.closeRecordStore();
		} catch (Exception e) {
			// Ignored
		}
		started = false;
	}

	Player createPlayer(String name, String type) {
		InputStream in = getClass().getResourceAsStream(name);
		try {
			return Manager.createPlayer(in, type);
			// If creating "Player" succeeded, no need to close "InputStream".
		} catch (Exception e) {
			try {
				in.close();
			} catch (Exception e2) {
				// Ignored
			}
			return null;
		}
	}

	void playSound(int response) {
		if (sound == 0) {
			return;
		}
		final int i = response;
		new Thread() {
			public void run() {
				Player player = createPlayer("/sounds/" + SOUND_NAME[i] + ".wav", "audio/x-wav");
				if (player == null) {
					return;
				}
				try {
					player.realize();
					VolumeControl vc = (VolumeControl) player.getControl("VolumeControl");
					if (vc != null) {
						vc.setLevel(sound * 10);
					}
					player.start();
				} catch (Exception e) {
					// Ignored
				}
				while (player.getState() == Player.STARTED) {
					try {
						sleep(1);
					} catch (Exception e) {
						// Ignored
					}
				}
				player.close();
			}
		}.start();
	}

	void stopMusic() {
		if (midiPlayer != null) {
			midiPlayer.close();
			midiPlayer = null;
		}
	}

	void startMusic(String strMusic) {
		stopMusic();
		if (music == 0) {
			return;
		}
		midiPlayer = createPlayer("/musics/" + strMusic + ".mid", "audio/midi");
		if (midiPlayer == null) {
			return;
		}
		try {
			midiPlayer.setLoopCount(-1);
			midiPlayer.realize();
			setMusicVolume();
			midiPlayer.start();
		} catch (Exception e) {
			// Ignored
		}
	}

	void setMusicVolume() {
		if (midiPlayer != null) {
			VolumeControl vc = (VolumeControl) midiPlayer.getControl("VolumeControl");
			if (vc != null) {
				vc.setLevel(music * 10);
			}
		}
	}
}