/*
XQWLight.java - Source Code for XiangQi Wizard Light, Part VI

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

import java.io.InputStream;

import javax.microedition.lcdui.Display;
import javax.microedition.media.Manager;
import javax.microedition.media.Player;
import javax.microedition.media.control.VolumeControl;
import javax.microedition.midlet.MIDlet;
import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;

public class XQWLMIDlet extends MIDlet {
	public XQWLForm form = new XQWLForm(this);
	public XQWLCanvas canvas = new XQWLCanvas(this);

	public boolean flipped, sound;
	public int handicap, level;

	private static String[] SOUND_NAME = {
		"click", "illegal", "move", "move2", "capture", "capture2",
		"check", "check2", "win", "draw", "loss",
	};
	public Player[] players = new Player[SOUND_NAME.length];

	public static final int RS_DATA_LEN = 512;
	/**
	 * 0: Status, 0 = Normal Exit, 1 = Game Saved
	 * 16: Player, 0 = Red, 1 = Black (Flipped)
	 * 17: Handicap, 0 = None, 1 = 1 Knight, 2 = 2 Knights, 3 = 9 Pieces
	 * 18: Level, 0 = Beginner, 1 = Amateur, 2 = Expert
	 * 19: Sound, 0 = Off, 1 = On
	 * 256-511: Squares
	 */
	public byte[] rsData = new byte[RS_DATA_LEN];

	private boolean started = false;

	public void startApp() {
		if (started) {
			return;
		}
		started = true;
		// Open Sounds
		for (int i = 0; i < SOUND_NAME.length; i ++) {
			InputStream in = this.getClass().getResourceAsStream("/sounds/" + SOUND_NAME[i] + ".mp3");
			try {
				players[i] = Manager.createPlayer(in, "audio/mpeg");
				players[i].prefetch();
			} catch (Exception e) {
				players[i] = null;
			}
			if (players[i] != null) {
				continue;
			}
			in = this.getClass().getResourceAsStream("/sounds/" + SOUND_NAME[i] + ".wav");
			try {
				players[i] = Manager.createPlayer(in, "audio/x-wav");
				players[i].prefetch();
			} catch (Exception e) {
				players[i] = null;
			}
			if (players[i] != null) {
				VolumeControl vc = (VolumeControl) players[i].getControl("VolumeControl");
				if (vc != null) {
					vc.setLevel(30);
				}
			}
		}
		// Load Record-Store
		for (int i = 0; i < RS_DATA_LEN; i ++) {
			rsData[i] = 0;
		}
		try {
			RecordStore rs = RecordStore.openRecordStore("XQWLight", true);
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
		handicap = Math.min(Math.max(0, rsData[17]), 3);
		level = Math.min(Math.max(0, rsData[18]), 2);
		sound = (rsData[19] == 0);
		form.cgToMove.setSelectedIndex(flipped ? 1 : 0, true);
		form.cgLevel.setSelectedIndex(level, true);
		form.cgHandicap.setSelectedIndex(handicap, true);
		form.cgSound.setSelectedIndex(0, sound);
		if (rsData[0] == 0) {
			Display.getDisplay(this).setCurrent(form);
		} else {
			canvas.reset();
			Display.getDisplay(this).setCurrent(canvas);
		}
	}

    public void pauseApp() {
    	// Do Nothing
    }

    public void destroyApp(boolean unc) {
    	// Close Sounds
		for (int i = 0; i < SOUND_NAME.length; i ++) {
			if (players[i] != null) {
				players[i].close();
			}
		}
		// Save Record-Store
		rsData[16] = (byte) (flipped ? 1 : 0);
		rsData[17] = (byte) handicap;
		rsData[18] = (byte) level;
		rsData[19] = (byte) (sound ? 0 : 1);
		try {
			RecordStore rs = RecordStore.openRecordStore("XQWLight", true);
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
}