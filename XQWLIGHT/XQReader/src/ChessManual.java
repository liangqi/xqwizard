// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

import java.io.IOException;
import java.util.Enumeration;
import javax.microedition.io.Connector;
import javax.microedition.io.file.FileConnection;
import javax.microedition.io.file.FileSystemRegistry;
import javax.microedition.lcdui.*;
import javax.microedition.midlet.MIDlet;

public class ChessManual extends MIDlet
    implements CommandListener
{

    public ChessManual()
    {
        openCommand = new Command("\u9009\u62E9\u68CB\u8C31", 8, 1);
        infoCommand = new Command("\u68CB\u8C31\u4FE1\u606F", 8, 1);
        viewCommand = new Command("\u6253\u5F00", 8, 1);
        exitCommand = new Command("\u9000\u51FA", 7, 1);
        backCommand = new Command("\u8FD4\u56DE", 2, 1);
        helpCommand = new Command("\u5E2E\u52A9", 5, 1);
        viewer = new TextBox(null, null, 1024, 0x20000);
        display = Display.getDisplay(this);
        canvas = new ChessManualCanvas();
        alert = new Alert("Warning");
        currDirName = "/";
        canvas.start();
        canvas.addCommand(openCommand);
        canvas.addCommand(infoCommand);
        canvas.addCommand(helpCommand);
        canvas.addCommand(exitCommand);
        canvas.setCommandListener(this);
    }

    public void startApp()
    {
        display.setCurrent(canvas);
    }

    public void pauseApp()
    {
    	//
    }

    public void destroyApp(boolean flag)
    {
        System.gc();
    }

    public void commandAction(Command command, Displayable displayable)
    {
        if(command == openCommand)
            executeshowCurrDir();
        else
        if(command == exitCommand)
        {
            destroyApp(true);
            notifyDestroyed();
        } else
        if(command == backCommand)
            Display.getDisplay(this).setCurrent(canvas);
        else
        if(command == infoCommand)
            showInfo();
        else
        if(command == helpCommand)
            showHelp();
        else
        if(command == viewCommand)
        {
            List list = (List)displayable;
            final String currFile = list.getString(list.getSelectedIndex());
            if(currFile.endsWith("/") || currFile.equals(".."))
            {
                (new Thread(new Runnable() {

                    public void run()
                    {
                        traverseDirectory(currFile);
                    }

                }
)).start();
            } else
            {
                alert.setString("Could not load manual");
                display.setCurrent(alert, canvas);
            }
        }
    }

    private void executeshowCurrDir()
    {
        (new Thread(new Runnable() {

            public void run()
            {
                showCurrDir();
            }

        }
)).start();
    }

    private void showInfo()
    {
        viewer.addCommand(backCommand);
        viewer.setCommandListener(this);
        viewer.setTitle("\u68CB\u8C31\u4FE1\u606F");
        viewer.setString("\u6807\u9898\uFF1A\u5355\u6DD8\u6C70\u7B2C\u4E00\u8F6E\u7B2C\u4E03\u53F0\n\u7EA2\u65B9\uFF1A\u8BB8\u949F\u94ED\n\u9ED1\u65B9\uFF1A\u9093\u6E90\u57CE\n\u7ED3\u679C\uFF1A\u9ED1\u80DC\n\u8BB2\u8BC4\uFF1A\n\u5F55\u5165\uFF1A\u674E\u8FDC\u65B9");
        Display.getDisplay(this).setCurrent(viewer);
    }

    private void showHelp()
    {
        viewer.addCommand(backCommand);
        viewer.setCommandListener(this);
        viewer.setTitle("\u5E2E\u52A9");
        viewer.setString("[1]\uFF1A\u4E0A\u4E00\u6B65\n[3]\uFF1A\u4E0B\u4E00\u6B65\n[4]\uFF1A\u4E0A\u4E00\u53D8\u62DB\n[6]\uFF1A\u4E0B\u4E00\u53D8\u62DB\n[2]\uFF1A\u4E0A\u4E00\u9875\u6CE8\u89E3\n[5]\uFF1A\u4E0B\u4E00\u9875\u6CE8\u89E3");
        Display.getDisplay(this).setCurrent(viewer);
    }

    void showCurrDir()
    {
        FileConnection fileconnection = null;
        try
        {
            Enumeration enumeration;
            List list;
            if("/".equals(currDirName))
            {
                enumeration = FileSystemRegistry.listRoots();
                list = new List("\u9009\u62E9\u68CB\u8C31", 3);
            } else
            {
                fileconnection = (FileConnection)Connector.open("file://localhost/" + currDirName);
                enumeration = fileconnection.list();
                list = new List("\u9009\u62E9\u68CB\u8C31", 3);
                list.append("..", dirIcon);
            }
            while(enumeration.hasMoreElements()) 
            {
                String s = (String)enumeration.nextElement();
                if(s.charAt(s.length() - 1) == '/')
                    list.append(s, dirIcon);
                else
                    list.append(s, fileIcon);
            }
            list.setSelectCommand(viewCommand);
            list.addCommand(backCommand);
            list.setCommandListener(this);
            if(fileconnection != null)
                fileconnection.close();
            Display.getDisplay(this).setCurrent(list);
        }
        catch(IOException ioexception)
        {
            ioexception.printStackTrace();
        }
    }

    void traverseDirectory(String s)
    {
        if(currDirName.equals("/"))
        {
            if(s.equals(".."))
                return;
            currDirName = s;
        } else
        if(s.equals(".."))
        {
            int i = currDirName.lastIndexOf('/', currDirName.length() - 2);
            if(i != -1)
                currDirName = currDirName.substring(0, i + 1);
            else
                currDirName = "/";
        } else
        {
            currDirName = currDirName + s;
        }
        showCurrDir();
    }

    Display display;
    private ChessManualCanvas canvas;
    private Alert alert;
    private Command openCommand;
    private Command infoCommand;
    private Command viewCommand;
    private Command exitCommand;
    private Command backCommand;
    private Command helpCommand;
    private TextBox viewer;
    private String currDirName;
    private Image dirIcon;
    private Image fileIcon;
}
