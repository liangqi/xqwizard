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