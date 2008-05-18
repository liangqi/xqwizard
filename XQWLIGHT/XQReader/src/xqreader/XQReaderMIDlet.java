package xqreader;

import java.util.Enumeration;

import javax.microedition.io.file.FileSystemRegistry;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Form;
import javax.microedition.midlet.MIDlet;

public class XQReaderMIDlet extends MIDlet {
	Form form = new Form("œÛ∆ÂÕº Èπ›");

	protected void startApp() {
		form.deleteAll();
		Enumeration e = FileSystemRegistry.listRoots();
		while (e.hasMoreElements()) {
			form.append((String) e.nextElement());
		}
		Display.getDisplay(this).setCurrent(form);
	}

	protected void pauseApp() {
		// Ignored
	}

	protected void destroyApp(boolean unc) {
		// Ignored
	}
}