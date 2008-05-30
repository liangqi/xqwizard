package xqboss;

import java.util.Enumeration;

import javax.microedition.io.Connector;
import javax.microedition.io.file.FileConnection;
import javax.microedition.io.file.FileSystemRegistry;
import javax.microedition.lcdui.Choice;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Form;
import javax.microedition.lcdui.List;
import javax.microedition.midlet.MIDlet;

public class XQBossMIDlet extends MIDlet {
	private boolean started = false;

	String currDir = null;
	Form form = new Form("象棋小博士");

	void openFile(String file) {
		file.getClass();
	}

	void chDir(String strDir) {
		if (strDir.equals("..")) {
			// __ASSERT(currDir != null);
			int i = currDir.lastIndexOf('/');
			if (i < 0) {
				currDir = null;
			} else {
				currDir = currDir.substring(0, i);
			}
		} else {
			if (currDir == null) {
				currDir = strDir;
			} else {
				currDir += "/" + strDir;
			}
		}
	}

	void listDir() {
		final Command cmdOpen = new Command("打开", Command.OK, 1);
		final Command cmdExit = new Command("退出", Command.EXIT, 1);
		final List lstDir = new List("选择棋谱文件", Choice.IMPLICIT);

		Enumeration enumDir;
		if (currDir == null) {
			enumDir = FileSystemRegistry.listRoots();
		} else {
			FileConnection dir = null;
			try {
				dir = (FileConnection) Connector.open("file://localhost/" + currDir + "/");
				enumDir = dir.list();
			} catch (Exception e) {
				if (dir != null) {
					try {
						dir.close();
					} catch (Exception ee) {
						// Ignored
					}
				}
				return;
			}
			lstDir.append("[..]", null);
		}
		while (enumDir.hasMoreElements()) {
			String strDir = (String) enumDir.nextElement();
			if (strDir.endsWith("/")) {
				lstDir.append("[" + strDir.substring(0, strDir.length() - 1) + "]", null);
			} else {
				lstDir.append(strDir, null);
			}
		}
		lstDir.setSelectCommand(cmdOpen);
		lstDir.addCommand(cmdExit);
		lstDir.setCommandListener(new CommandListener() {
			public void commandAction(Command c, Displayable d) {
				if (c == cmdOpen) {
					final String selDir = lstDir.getString(lstDir.getSelectedIndex());
					if (selDir.startsWith("[") && selDir.endsWith("]")) {
						new Thread() {
							public void run() {
								chDir(selDir.substring(1, selDir.length() - 1));
								listDir();
							}
						}.start();
					} else {
						openFile(selDir);
					}
				} else if (c == cmdExit) {
					destroyApp(false);
					notifyDestroyed();
				}
			}
		});
		Display.getDisplay(this).setCurrent(lstDir);
	}

	protected void startApp() {
		if (started) {
			return;
		}
		started = true;
		listDir();
	}

	protected void pauseApp() {
		// Do Nothing
	}

	protected void destroyApp(boolean unc) {
		started = false;
	}
}