package xqwlight;

import java.util.Random;

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Displayable;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;
import javax.microedition.lcdui.game.GameCanvas;

public class MainForm extends GameCanvas implements CommandListener {
	private XQWLight midlet;

	public MainForm(XQWLight midlet) {
		super(true);
		this.midlet = midlet;

		addCommand(new Command("ÍË³ö", Command.EXIT, 1));

		int i;

        // "global" variables
        gridw = 4;
        gridh = 4;

        font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, Font.SIZE_MEDIUM);

        // update when font metrics info gets implemented
        cellw = font.charWidth('M') + 7;
        cellh = font.getHeight() + 1;
        cellxoff = 3;
        cellyoff = 0;

        gridx = (getWidth() - (gridw * cellw) + 1) / 2;
        gridy = 10;

        cheated = false;
        rand = new Random();

        // create the grid arrays
        grid = new Piece[gridw][];

        for (i = 0; i < gridw; i++) {
            grid[i] = new Piece[gridh];
        }

        all = new Piece[gridw * gridh];

        for (i = 0; i < ((gridw * gridh) - 1); i++) {
            int x = i % gridw;
            int y = i / gridw;
            String s = letters.substring(i, i + 1);
            grid[x][y] = all[i] = new Piece(s, i, x, y, i < ((gridw * gridh) / 2));
        }

        // make the special blank piece
        blankp = new Piece(null, (gridw * gridh) - 1, gridw - 1, gridh - 1, false);
        grid[gridw - 1][gridh - 1] = blankp;
        all[(gridw * gridh) - 1] = blankp;

        // set up the listener
        setCommandListener(this);

        // set up options screen
        // options = new StartUp(dpy, this);

        // set up initial state
	}

    void D(String s) {
        System.out.println(s);
    }

    void setGrid(Piece p, int x, int y) {
        grid[x][y] = p;
        p.setLocation(x, y);
    }

    // swap the piece at sx, sy with the blank piece
    // assumes that this is a legal move
    void moveBlank(int swapx, int swapy) {
        setGrid(grid[swapx][swapy], blankp.x, blankp.y);
        setGrid(blankp, swapx, swapy);
    }

    // swaps the pieces at (x1, y1) and (x2, y2)
    // no parity checking is done!    
    void swap(int x1, int y1, int x2, int y2) {
        Piece t = grid[x1][y1];
        setGrid(grid[x2][y2], x1, y1);
        setGrid(t, x2, y2);
    }

    boolean isSolved() {
        for (int i = 0; i < gridh; i++) {
            for (int j = 0; j < gridw; j++) {
                if (!grid[j][i].isHome()) {
                    return false;
                }
            }
        }

        return true;
    }

    // return a random integer in the range [0..n)
    int randRange(int n) {
        int r = rand.nextInt() % n;

        if (r < 0) {
            r += n;
        }

        return r;
    }

    // randomize by making random moves
    void randomize_by_moving() {
        int dx;
        int dy;
        int v;

        for (int i = 0; i < 100; i++) {
            dx = dy = 0;
            v = (rand.nextInt() & 2) - 1; // 1 or -1

            if ((rand.nextInt() & 1) == 0) {
                dx = v;
            } else {
                dy = v;
            }

            if ((blankp.x + dx) < 0) {
                dx = 1;
            }

            if ((blankp.x + dx) == gridw) {
                dx = -1;
            }

            if ((blankp.y + dy) < 0) {
                dy = 1;
            }

            if ((blankp.y + dy) == gridh) {
                dy = -1;
            }

            moveBlank(blankp.x + dx, blankp.y + dy);
        }

        // now move the blank tile to the lower right corner
        while (blankp.x != (gridw - 1))
            moveBlank(blankp.x + 1, blankp.y);

        while (blankp.y != (gridh - 1))
            moveBlank(blankp.x, blankp.y + 1);
    }

    // shuffle the tiles randomly and place the blank at the bottom right
    void shuffle() {
        int limit = (gridw * gridh) - 1;
        Piece[] ta = new Piece[limit];
        Piece temp;

        System.arraycopy(all, 0, ta, 0, limit);

        for (int i = 0; i < limit; i++) {
            int j = randRange(limit);
            temp = ta[j];
            ta[j] = ta[i];
            ta[i] = temp;
        }

        for (int i = 0; i < limit; i++) {
            setGrid(ta[i], i / gridw, i % gridw);
        }

        setGrid(blankp, gridw - 1, gridh - 1);
    }

    void randomize(boolean hard) {
        shuffle();

        int ra;
        int rb;
        int x;
        int y;

        if (hard) {
            ra = 7;
            rb = 0;
        } else {
            ra = 0;
            rb = 7;
        }

        x = rand.nextInt() & 1;
        y = rand.nextInt() & 1;

        if ((x == 1) && (y == 1)) {
            x = 2;
            y = 0;
        }

        swap(x, y, all[ra].x, all[ra].y);
        swap((rand.nextInt() & 1) + 1, 3, all[rb].x, all[rb].y);

        if ((displacement() & 1) == 1) {
            swap(1, 3, 2, 3);
        }
    }

    // Compute and return the displacement, that is, the number of
    // pairs of tiles that are out of order.  The blank tile *must*
    // be in the lower right corner.
    int displacement() {
        boolean[] temp = new boolean[(gridw * gridh) - 1]; // all false
        int n = 0;

        for (int i = 0; i < gridh; i++) {
            for (int j = 0; j < gridw; j++) {
                Piece p = grid[j][i];

                if (p == blankp) {
                    continue;
                }

                temp[p.serial] = true;

                for (int k = 0; k < p.serial; k++) {
                    if (!temp[k]) {
                        n++;
                    }
                }
            }
        }

        return n;
    }

    void resetGrid() {
        Piece[] temp = new Piece[gridw * gridh];
        int k = 0;

        for (int i = 0; i < gridw; i++) {
            for (int j = 0; j < gridh; j++) {
                temp[k++] = grid[i][j];
            }
        }

        for (k = 0; k < temp.length; k++) {
            temp[k].goHome();
        }
    }

    void rearrangeFunnily(boolean hard) {
        resetGrid();

        if (hard) {
            // RATE YOUR MIDP LAN
            swap(0, 0, 3, 1);
            swap(2, 2, 3, 2);
            swap(3, 2, 0, 3);
            swap(0, 3, 2, 3);
        } else {
            // RATE YOUR MIDP NAL
            swap(2, 2, 3, 2);
            swap(3, 2, 0, 3);
        }
    }

	public void commandAction(Command c, Displayable d) {
		Display.getDisplay(midlet).setCurrent(midlet.getStartUp());
	}
/*    	
        switch (((BoardCommand) c).tag) {
        case CMD_EXIT:
        	midlet.getStartUp().reset();
        	Display.getDisplay(midlet).setCurrent(midlet.getStartUp());
        	break;
            midlet.notifyDestroyed();
            break;
        case CMD_OPTIONS:
            dpy.setCurrent(options);
            break;
        case CMD_RESET:
            cheated = false;
            resetGrid();
            setState(INITIALIZED);
            repaint();

            break;

        case CMD_START:
            cheated = false;

            if (options.funny) {
                rearrangeFunnily(options.hard);
            } else {
                randomize(options.hard);
            }

            setState(PLAYING);
            repaint();

            break;

        case CMD_UNLOCK:
            cheated = true;
            setState(PLAYING);
            repaint();

            break;
*/
	private static Image imgBoard, imgBackground;

	static {
		try {
			imgBoard = Image.createImage("/images/board.gif");
			imgBackground = Image.createImage("/images/background.gif");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public void paint(Graphics g) {
		int widthScreen = getWidth();
		int heightScreen = getHeight();
		int widthBackground = imgBackground.getWidth();
		int heightBackground = imgBackground.getHeight();
		for (int x = 0; x < widthScreen; x += widthBackground) {
			for (int y = 0; y < heightScreen; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		int left = (getWidth() - 144) / 2;
		int top = (getHeight() - 160) / 2;
		g.drawImage(imgBoard, left, top, Graphics.LEFT + Graphics.TOP);
		try {
			g.drawImage(Image.createImage("/images/ba.gif"), left, top, Graphics.LEFT + Graphics.TOP);
		} catch (Exception e) {
			// Ignored
		}
/*
        g.setColor(0xFFFFFF);
        g.fillRect(0, 0, getWidth(), getHeight());

        g.translate(gridx, gridy);
        g.setColor(0);
        g.drawRect(-2, -2, (gridw * cellw) + 2, (gridh * cellh) + 2);

        for (int j = 0; j < gridw; j++) {
            for (int k = 0; k < gridh; k++) {
                grid[j][k].paint(g);
            }
        }
*/
	}

    public void keyPressed(int code) {
        int game = getGameAction(code);

        int swapx = blankp.x;
        int swapy = blankp.y;

        // int direction = (options.reversed ? (-1) : 1);
        int direction = 1;

        switch (game) {
        case Canvas.UP:
            swapy += direction;

            break;

        case Canvas.DOWN:
            swapy -= direction;

            break;

        case Canvas.LEFT:
            swapx += direction;

            break;

        case Canvas.RIGHT:
            swapx -= direction;

            break;

        default:
            return;
        }

        if ((swapx < 0) || (swapx >= gridw) || (swapy < 0) || (swapy >= gridh)) {
            return;
        }

        moveBlank(swapx, swapy);
        repaint();
    }

    class Piece {
        String label;
        boolean inv;
        int serial; // serial number for ordering
        int ix; // initial location in grid coordinates
        int iy; // initial location in grid coordinates
        int x; // current location in grid coordinates
        int y; // current location in grid coordinates

        Piece(String str, int ser, int nx, int ny, boolean v) {
            label = str;
            serial = ser;
            x = ix = nx;
            y = iy = ny;
            inv = v;
        }

        void setLocation(int nx, int ny) {
            x = nx;
            y = ny;
        }

        boolean isHome() {
            return (x == ix) && (y == iy);
        }

        void goHome() {
            setGrid(this, ix, iy);
        }

        // assumes background is white
        void paint(Graphics g) {
            int px = x * cellw;
            int py = y * cellh;

            if (label != null) {
                if (inv) {
                    // black outlined, white square with black writing
                    g.setColor(0);
                    g.setFont(font);
                    g.drawRect(px, py, cellw - 2, cellh - 2);
                    g.drawString(label, px + cellxoff, py + cellyoff, Graphics.TOP | Graphics.LEFT);
                } else {
                    // black square with white writing
                    g.setColor(0);
                    g.fillRect(px, py, cellw - 1, cellh - 1);
                    g.setColor(0xFFFFFF);
                    g.setFont(font);
                    g.drawString(label, px + cellxoff, py + cellyoff, Graphics.TOP | Graphics.LEFT);
                }
            }
        }
    }

    class BoardCommand extends Command {
        int tag;

        BoardCommand(String label, int type, int pri, int tag_) {
            super(label, type, pri);
            tag = tag_;
        }
    }
	// this string must be exactly 15 characters long
    String letters = "RATEYOURMINDPAL";
    Font font;
    Piece blankp;
    Piece[] all;
    Piece[][] grid;
    Random rand;

    // grid origin in pixels
    int gridx;
    int gridy;

    // grid width and height, in cells
    int gridw;
    int gridh;

    // cell geometry in pixels
    int cellw;
    int cellh;
    int cellyoff;
    int cellxoff;
    int gameState;
    boolean cheated;
}