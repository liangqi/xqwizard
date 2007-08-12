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
	private XQWLight midlet;

	private ChoiceGroup cgToMove;
	private ChoiceGroup cgHandicap;
	private ChoiceGroup cgLevel;

	private Command cmdAbout;
	private Command cmdStart;
	private Command cmdExit;

	private Alert altAbout;

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
		cmdExit = new Command("退出", Command.CANCEL, 3);

		addCommand(cmdAbout);
		addCommand(cmdStart);
		// addCommand(cmdExit);

		reset();

		Image image = null;
		try {
			image = Image.createImage("/images/xqwlarge.gif");
		} catch (Exception e) {
			// Ignored
		}
		altAbout = new Alert("关于\"象棋小巫师\"", "象棋小巫师 1.0\n象棋百科全书 荣誉出品\n\n" +
                "欢迎登录 www.elephantbase.net\n免费下载PC版 象棋巫师", image, AlertType.INFO);
		altAbout.setTimeout(Alert.FOREVER);

		setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
    	if (false) {
    		// Code Style
    	} else if (c == cmdAbout) {
    		Display.getDisplay(midlet).setCurrent(altAbout);
    	} else if (c == cmdStart) {
        	midlet.setFlipped(cgToMove.isSelected(1));
        	midlet.setHandicap(cgHandicap.getSelectedIndex());
        	midlet.setLevel(cgLevel.getSelectedIndex());
            Display.getDisplay(midlet).setCurrent(midlet.getMainForm());
    	} else if (c == cmdExit) {
    		midlet.notifyDestroyed();
    	}
    }

    public void reset() {
		cgLevel.setSelectedIndex(0, true);
		cgToMove.setSelectedIndex(0, true);
		cgHandicap.setSelectedIndex(0, true);
	}
}