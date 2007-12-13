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

import javax.microedition.lcdui.Display;
import javax.microedition.midlet.MIDlet;
import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;

public class XQWLight extends MIDlet {
	public StartUp startUp = new StartUp(this);
	public MainForm mainForm = new MainForm(this);

	public boolean flipped;
	public int handicap, level;
	/**
	 * 0: Status, 0 = Normal Exit, 1/2/3 = Game Saved (Level + 1)
	 * 1: Player, 0 = Red, 1 = Black (Flipped)
	 * 2-257: Squares
	 */
	public byte[] rsData = new byte[RS_DATA_LEN];

	private boolean started = false;

	private static final int RS_DATA_LEN = 258;

	public void startApp() {
		if (started) {
			return;
		}
		started = true;
		rsData[0] = 0;
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
		if (rsData[0] == 0) {
			Display.getDisplay(this).setCurrent(startUp);
		} else {
			flipped = (rsData[1] != 0);
			level = rsData[0] - 1;
			if (level < 0 || level > 2) {
				level = 0;
			}
			mainForm.reset();
			Display.getDisplay(this).setCurrent(mainForm);
		}
	}

    public void pauseApp() {
    	// Do Nothing
    }

    public void destroyApp(boolean unc) {
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