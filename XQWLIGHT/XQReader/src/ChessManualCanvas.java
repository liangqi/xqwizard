// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.game.GameCanvas;

public class ChessManualCanvas extends GameCanvas
    implements Runnable
{

    public ChessManualCanvas()
    {
        super(true);
        width = getWidth();
        height = getHeight();
        currentX = width / 2;
        currentY = height / 2;
        delay = 20L;
        x0 = 14;
        y0 = 22;
        cx = 17;
        cy = 17;
        boardW = 144;
        boardH = 161;
        foreColor = 0xffffff;
        backColor = 0x99cc99;
    }

    public void start()
    {
        isPlay = true;
        (new Thread(this)).start();
    }

    public void stop()
    {
        isPlay = false;
    }

    public void run()
    {
        Graphics g = getGraphics();
        while(isPlay) 
        {
            input();
            drawScreen(g);
            try
            {
                Thread.sleep(delay);
            }
            catch(InterruptedException interruptedexception) { }
        }
    }

    private void input()
    {
        int i = getKeyStates();
        if((i & 4) != 0)
            currentX = Math.max(0, currentX - 1);
        if((i & 0x20) != 0 && currentX + 5 < width)
            currentX = Math.min(width, currentX + 1);
        if((i & 2) != 0)
            currentY = Math.max(0, currentY - 1);
        if((i & 0x40) != 0 && currentY + 10 < height)
            currentY = Math.min(height, currentY + 1);
    }

    private void drawScreen(Graphics g)
    {
        g.setColor(0xffffff);
        g.fillRect(0, 0, getWidth(), getHeight());
        drawBoard(g);
        g.setColor(255);
        g.drawString("X", currentX, currentY, 20);
        flushGraphics();
    }

    public void drawBoard(Graphics g)
    {
        g.setColor(backColor);
        g.fillRect(0, 0, width, height);
        g.setColor(foreColor);
        g.setColor(0xffffff);
        g.drawRect(9, 17, boardW + 2, boardH + 2);
        g.drawRect(10, 18, boardW, boardH);
        g.fillRect(20 + boardW, 18, width - boardW - 30, boardH);
        g.setColor(0xff00ff);
        g.drawRect((20 + boardW) - 1, (36 + boardH) - 1, (width - boardW - 30) + 2, (height - 42 - boardH) + 2);
        g.setColor(0xf08004);
        g.fillRect(9, (36 + boardH) - 1, boardW + 2, (height - boardH - 42) + 2);
        g.setColor(0xffffff);
        g.fillRect(20 + boardW, 36 + boardH, width - boardW - 30, height - 42 - boardH);
        g.fillRect(10, 36 + boardH, boardW, height - boardH - 42);
        g.setColor(255);
        int i = 18;
        Font font = Font.getFont(0, 0, 8);
        g.setFont(font);
        do
        {
            g.drawString("\u70AE\u516B\u5E73\u4E94", 20 + boardW, i, 20);
            g.setStrokeStyle(1);
            g.setColor(0xff00ff);
            g.drawLine(20 + boardW, (i + font.getHeight()) - 4, 20 + boardW + font.stringWidth("\u70AE\u516B\u5E73\u4E94"), (i + font.getHeight()) - 4);
            g.setColor(0xf08004);
            g.drawLine(20 + boardW, (i + font.getHeight()) - 3, 20 + boardW + font.stringWidth("\u70AE\u516B\u5E73\u4E94"), (i + font.getHeight()) - 3);
            g.setStrokeStyle(0);
            i += font.getHeight();
            g.setColor(0);
        } while(i <= boardH);
        i = 36 + boardH;
        do
        {
            g.drawString("\u4E00\u4E8C\u4E09\u56DB\u4E94\u516D\u4E03\u516B\u4E5D", 12, i, 20);
            i += font.getHeight();
        } while(i < height - 7 - font.getHeight());
        g.setColor(foreColor);
        int j = 0;
        do
            drawBoardLine(g, 0, j, 8, j);
        while(++j < 10);
        drawBoardLine(g, 0, 0, 0, 9);
        j = 1;
        do
        {
            drawBoardLine(g, j, 0, j, 4);
            drawBoardLine(g, j, 5, j, 9);
        } while(++j < 8);
        drawBoardLine(g, 8, 0, 8, 9);
        drawX(g, 1, 2);
        drawX(g, 7, 2);
        j = 0;
        do
        {
            drawX(g, j, 3);
            drawX(g, j, 6);
        } while((j += 2) < 9);
        drawX(g, 1, 7);
        drawX(g, 7, 7);
        drawBoardLine(g, 3, 0, 5, 2);
        drawBoardLine(g, 3, 2, 5, 0);
        drawBoardLine(g, 3, 9, 5, 7);
        drawBoardLine(g, 3, 7, 5, 9);
    }

    public void drawBoardLine(Graphics g, int i, int j, int k, int l)
    {
        g.drawLine(x0 + cx * i, y0 + cy * j, x0 + cx * k, y0 + cy * l);
    }

    public void drawX(Graphics g, int i, int j)
    {
        byte byte0 = 4;
        int k = x0 + cx * i;
        int l = y0 + cy * j;
        if(i > 0)
        {
            g.drawLine(k - 2, l - cy / byte0, k - 2, l - 2);
            g.drawLine(k - 2, l + cy / byte0, k - 2, l + 2);
            g.drawLine(k - cx / byte0, l - 2, k - 2, l - 2);
            g.drawLine(k - cx / byte0, l + 2, k - 2, l + 2);
        }
        if(i < 8)
        {
            g.drawLine(k + 2, l - cy / byte0, k + 2, l - 2);
            g.drawLine(k + 2, l + cy / byte0, k + 2, l + 2);
            g.drawLine(k + cx / byte0, l - 2, k + 2, l - 2);
            g.drawLine(k + cx / byte0, l + 2, k + 2, l + 2);
        }
    }

    private boolean isPlay;
    private long delay;
    private int currentX;
    private int currentY;
    private int width;
    private int height;
    private int x0;
    private int y0;
    private int cx;
    private int cy;
    private int boardW;
    private int boardH;
    private int foreColor;
    private int backColor;
}
