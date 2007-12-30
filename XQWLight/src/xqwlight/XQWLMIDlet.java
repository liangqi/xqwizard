/*
XQWLMIDlet.java - Source Code for XiangQi Wizard Light, Part V

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

import java.io.InputStream;

import javax.microedition.lcdui.Display;
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
	private static final String[] SOUND_NAME = {
		"click", "illegal", "move", "move2", "capture", "capture2",
		"check", "check2", "win", "draw", "loss",
	};

	public static final int RS_DATA_LEN = 512;

	public byte[] rsData = new byte[RS_DATA_LEN];
	public boolean flipped;
	public int handicap, level, sound, music;
	public Player midiPlayer = null;
	public XQWLForm form = new XQWLForm(this);
	public XQWLCanvas canvas = new XQWLCanvas(this);

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
		form.cgToMove.setSelectedIndex(flipped ? 1 : 0, true);
		form.cgLevel.setSelectedIndex(level, true);
		form.cgHandicap.setSelectedIndex(handicap, true);
		form.gSound.setValue(sound);
		form.gMusic.setValue(music);
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

	public void playSound(int response) {
		if (sound == 0) {
			return;
		}
		final int i = response;
		new Thread() {
			public void run() {
				InputStream in = getClass().getResourceAsStream("/sounds/" + SOUND_NAME[i] + ".wav");
				try {
					Player p = Manager.createPlayer(in, "audio/x-wav");
					p.realize();
					VolumeControl vc = (VolumeControl) p.getControl("VolumeControl");
					if (vc != null) {
						vc.setLevel(sound * 10);
					}
					p.start();
					while (p.getState() == Player.STARTED) {
						try {
							sleep(1);
						} catch (Exception e) {
							// Ignored
						}
					}
					p.close();
				} catch (Exception e) {
					// Ignored
				}
			}
		}.start();
	}

	public void stopMusic() {
		if (midiPlayer != null) {
			midiPlayer.close();
			midiPlayer = null;
		}
	}

	public void startMusic(String strMusic) {
		stopMusic();
		InputStream in = getClass().getResourceAsStream("/musics/" + strMusic + ".mid");
		try {
			midiPlayer = Manager.createPlayer(in, "audio/midi");
			midiPlayer.setLoopCount(-1);
			midiPlayer.realize();
			setMusicVolume();
			midiPlayer.start();
		} catch (Exception e) {
			midiPlayer = null;
		}
	}

	public void setMusicVolume() {
		if (midiPlayer != null) {
			VolumeControl vc = (VolumeControl) midiPlayer.getControl("VolumeControl");
			if (vc != null) {
				vc.setLevel(music * 10);
				vc.setMute(music == 0);
			}
		}
	}
}