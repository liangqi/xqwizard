package xqwlight;

import java.applet.Applet;
import java.applet.AudioClip;
import java.awt.Button;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.net.URL;

public class XQWLApplet extends Applet {
	private static final long serialVersionUID = 1L;

	private static final int RESP_CLICK = 0;
	private static final int RESP_ILLEGAL = 1;
	private static final int RESP_MOVE = 2;
	// private static final int RESP_MOVE2 = 3;
	private static final int RESP_CAPTURE = 4;
	// private static final int RESP_CAPTURE2 = 5;
	private static final int RESP_CHECK = 6;
	// private static final int RESP_CHECK2 = 7;
	// private static final int RESP_WIN = 8;
	// private static final int RESP_DRAW = 9;
	// private static final int RESP_LOSS = 10;
	private static final int PIECE_MARGIN = 8;
	private static final int SQUARE_SIZE = 56;

	private static final String CODE_BASE = "http://www.elephantbase.net/xqwlight/";

	private static final String[] PIECE_NAME = {
		null, null, null, null, null, null, null, null,
		"rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
		"bk", "ba", "bb", "bn", "br", "bc", "bp", null,
	};

	private static final String[] BOARD_NAME = {
		"wood", "green", "white", "sheet", "canvas", "drops", "qianhong"
	};

	private static final String[] PIECES_NAME = {
		"wood", "delicate", "polish"
	};

	private static final String[] SOUND_NAME = {
		"click", "illegal", "move", "move2", "capture", "capture2",
		"check", "check2", "win", "draw", "loss",
	};

	private static final String[] MUSIC_NAME = {
		"express", "funny", "classic", "mozart1", "mozart4", "furelise",
		"lovdream", "waltz", "humour", "pal", "cmusic"
	};

	static final URL[][] urlPieces = new URL[PIECES_NAME.length][PIECE_NAME.length];
	static final URL[] urlSelecteds = new URL[PIECES_NAME.length];
	static final URL[] urlBoards = new URL[BOARD_NAME.length];
	static final URL[] urlSounds = new URL[SOUND_NAME.length];
	static final URL[] urlMusics = new URL[MUSIC_NAME.length];

	static {
		try {
			for (int i = 0; i < PIECES_NAME.length; i ++) {
				for (int j = 0; j < PIECE_NAME.length; j ++) {
					urlPieces[i][j] = (PIECE_NAME[j] == null ? null :
							new URL(CODE_BASE + "pieces/" + PIECES_NAME[i] + "/" + PIECE_NAME[j] + ".gif"));
				}
			}
			for (int i = 0; i < PIECES_NAME.length; i ++) {
				urlSelecteds[i] = new URL(CODE_BASE + "pieces/" + PIECES_NAME[i] + "/oos.gif");
			}
			for (int i = 0; i < BOARD_NAME.length; i ++) {
				urlBoards[i] = new URL(CODE_BASE + "boards/" + BOARD_NAME[i] + ".gif");
			}
			for (int i = 0; i < SOUND_NAME.length; i ++) {
				urlSounds[i] = new URL(CODE_BASE + "sounds/" + SOUND_NAME[i] + ".wav");
			}
			for (int i = 0; i < MUSIC_NAME.length; i ++) {
				urlMusics[i] = new URL(CODE_BASE + "musics/" + MUSIC_NAME[i] + ".mid");
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	Image[] imgPieces = new Image[PIECE_NAME.length];
	Image imgSelected, imgBoard;
	AudioClip audioClip;

	Panel panel = new Panel() {
		private static final long serialVersionUID = 1L;

		public void paint(Graphics g) {
			g.drawImage(imgBoard, 0, 0, this);
			for (int x = Position.FILE_LEFT; x <= Position.FILE_RIGHT; x ++) {
				for (int y = Position.RANK_TOP; y <= Position.RANK_BOTTOM; y ++) {
					int sq = Position.COORD_XY(x, y);
					int xx = PIECE_MARGIN + (x - Position.FILE_LEFT) * SQUARE_SIZE;
					int yy = PIECE_MARGIN + (y - Position.RANK_TOP) * SQUARE_SIZE;
					int pc = pos.squares[sq];
					if (pc > 0) {
						g.drawImage(imgPieces[pc], xx, yy, this);
					}
					if (sq == sqSelected || sq == Position.SRC(mvLast) || sq == Position.DST(mvLast)) {
						g.drawImage(imgSelected, xx, yy, this);
					}
				}
			}
		}
	};
	Button btnRestart = new Button("Restart");
	Button btnRetract = new Button("Retract");

	Position pos = new Position();
	String cookieFen = Position.STARTUP_FEN[0], retractFen;
	int sqSelected, mvLast;

	boolean flipped = false;
	int level = 0, board = 0, pieces = 0, music = 8;

	{
		panel.addMouseListener(new MouseListener() {
			public void mouseClicked(MouseEvent e) {
				// Do Nothing
			}

			public void mouseEntered(MouseEvent e) {
				// Do Nothing
			}

			public void mouseExited(MouseEvent e) {
				// Do Nothing
			}

			public void mousePressed(MouseEvent e) {
				int x = Util.MIN_MAX(0, (e.getX() - PIECE_MARGIN) / SQUARE_SIZE, 8);
				int y = Util.MIN_MAX(0, (e.getY() - PIECE_MARGIN) / SQUARE_SIZE, 9);
				clickSquare(Position.COORD_XY(x + Position.FILE_LEFT, y + Position.RANK_TOP));
			}

			public void mouseReleased(MouseEvent e) {
				// Do Nothing
			}
		});
		panel.setBounds(0, 0, 521, 577);

		btnRestart.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Restart!");
			}
		});
		btnRestart.setBounds(0, 577, 260, 20);
		btnRetract.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Retract!");
			}
		});
		btnRetract.setBounds(261, 577, 260, 20);
	}

	public void init() {
		setLayout(null);
		add(panel);
		add(btnRestart);
		add(btnRetract);
		audioClip = getAudioClip(urlMusics[music]);
		audioClip.loop();
		restart();
	}

	public void destroy() {
		remove(panel);
		remove(btnRestart);
		remove(btnRetract);
	}

	void clickSquare(int sq_) {
		int sq = sq_;
		if (flipped) {
			sq = Position.SQUARE_FLIP(sq);
		}
		int pc = pos.squares[sq];
		if ((pc & Position.SIDE_TAG(pos.sdPlayer)) != 0) {
			if (sqSelected > 0) {
				drawSquare(sqSelected);
			}
			if (mvLast > 0) {
				drawMove(mvLast);
				mvLast = 0;
			}
			sqSelected = sq;
			drawSquare(sq);
			playSound(RESP_CLICK);
		} else if (sqSelected > 0) {
			mvLast = Position.MOVE(sqSelected, sq);
			if (!pos.legalMove(mvLast)) {
				return;
			}
			pc = pos.squares[sqSelected];
			if (!pos.makeMove(mvLast)) {
				playSound(RESP_ILLEGAL);
				return;
			}
			int response = pos.inCheck() ? RESP_CHECK :
					pos.captured() ? RESP_CAPTURE : RESP_MOVE;
			if (pos.captured()) {
				pos.setIrrev();
			}
			sqSelected = 0;
			drawMove(mvLast);
			playSound(response);
//			if (getResult(board)) {
//				addCookieValue("fen", null);
//			} else {
//				thinking(target);
//			}
		}
	}

	private void drawSquare(int sq) {
		int x = PIECE_MARGIN + (Position.FILE_X(sq) - Position.FILE_LEFT) * SQUARE_SIZE;
		int y = PIECE_MARGIN + (Position.RANK_Y(sq) - Position.RANK_TOP) * SQUARE_SIZE;
		panel.repaint(x, y, SQUARE_SIZE, SQUARE_SIZE);
	}

	private void drawMove(int mv) {
		drawSquare(Position.SRC(mv));
		drawSquare(Position.DST(mv));
	}

	private void playSound(int response) {
		play(urlSounds[response]);
	}

	private void restart() {
		for (int i = 0; i < PIECE_NAME.length; i ++) {
			imgPieces[i] = (urlPieces[0][i] == null ? null : getImage(urlPieces[0][i]));
		}
		imgSelected = getImage(urlSelecteds[0]);
		imgBoard = getImage(urlBoards[0]);

		pos.fromFen(cookieFen);
		retractFen = cookieFen;
		sqSelected = mvLast = 0;
	}
}