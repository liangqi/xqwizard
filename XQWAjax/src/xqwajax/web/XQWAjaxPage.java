package xqwajax.web;

import javax.servlet.http.Cookie;

import org.apache.wicket.ResourceReference;
import org.apache.wicket.ajax.AbstractAjaxTimerBehavior;
import org.apache.wicket.ajax.AjaxEventBehavior;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.form.Form;
import org.apache.wicket.markup.html.form.RadioChoice;
import org.apache.wicket.markup.html.image.Image;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.Model;
import org.apache.wicket.protocol.http.WebRequest;
import org.apache.wicket.protocol.http.WebResponse;
import org.apache.wicket.util.time.Duration;

import xqwajax.util.wicket.AjaxPlayerPanel;
import xqwajax.util.wicket.RefreshPage;
import xqwajax.util.wicket.ResourceComponent;
import xqwlight.Position;
import xqwlight.Search;
import xqwlight.Util;

public class XQWAjaxPage extends WebPage {
	private static final long serialVersionUID = 1L;

	private static final int STATUS_READY = 0;
	private static final int STATUS_WIN = 1;
	private static final int STATUS_DRAW = 2;
	private static final int STATUS_LOSS = 3;
	private static final int STATUS_THINKING = 4;
	private static final int STATUS_TO_MOVE = 5;

	private static final int RESP_CLICK = 0;
	private static final int RESP_ILLEGAL = 1;
	private static final int RESP_MOVE = 2;
	private static final int RESP_MOVE2 = 3;
	private static final int RESP_CAPTURE = 4;
	private static final int RESP_CAPTURE2 = 5;
	private static final int RESP_CHECK = 6;
	private static final int RESP_CHECK2 = 7;
	private static final int RESP_WIN = 8;
	private static final int RESP_DRAW = 9;
	private static final int RESP_LOSS = 10;

	private static final String[] STATUS_NAME = {
		"ready", "win", "draw", "loss", "thinking"
	};

	private static final String[] PIECE_NAME = {
		null, null, null, null, null, null, null, null,
		"rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
		"bk", "ba", "bb", "bn", "br", "bc", "bp", null,
	};

	private static final String[] SOUND_NAME = {
		"click", "illegal", "move", "move2", "capture", "capture2",
		"check", "check2", "win", "draw", "loss",
	};

	private static ResourceReference createImage(String imageName) {
		return new ResourceReference(XQWAjaxPage.class, "images/" + imageName + ".gif");
	}

	private static ResourceReference createPiece(String pieceName) {
		return new ResourceReference(XQWAjaxPage.class, "pieces/wood/" + pieceName + ".gif");
	}

	private static ResourceReference createSound(String soundName) {
		return new ResourceReference(XQWAjaxPage.class, "sounds/" + soundName + ".wav");
	}

	static ResourceReference[] rrStatus = new ResourceReference[5];
	static ResourceReference[] rrPieces = new ResourceReference[24];
	static ResourceReference[] rrSelected = new ResourceReference[24];
	static ResourceReference[] rrSound = new ResourceReference[13];
	static ResourceReference rrMusic = new ResourceReference(XQWAjaxPage.class, "bg.mid");
	static ResourceReference rrStar0 = createImage("star0");
	static ResourceReference rrStar1 = createImage("star1");

	static {
		for (int i = 0; i < 5; i ++) {
			rrStatus[i] = createImage(STATUS_NAME[i]);
		}
		ResourceReference imgOo = createPiece("oo");
		ResourceReference imgOos = createPiece("oos");
		for (int i = 0; i < 24; i ++) {
			if (PIECE_NAME[i] == null) {
				rrPieces[i] = imgOo;
				rrSelected[i] = imgOos;
			} else {
				rrPieces[i] = createPiece(PIECE_NAME[i]);
				rrSelected[i] = createPiece(PIECE_NAME[i] + "s");
			}
		}
		for (int i = 0; i < 11; i ++) {
			rrSound[i] = createSound(SOUND_NAME[i]);
		}
	}

	static final String[] LEVEL_STRING = {
		"入门", "业余", "专业", "大师", "特级大师",
	};

	int status = STATUS_READY;
	Position pos = new Position();
	Search search = new Search(pos, 16);
	int level = getCookieValue("level", 0, 4, 0);
	String retractFen = null;
	int sqSelected = 0, mvLast = 0, mvResult = 0;

	Label lblTitle = new Label("lblTitle", "就绪");
	Image imgTitle = new Image("imgTitle", rrStatus[STATUS_READY]);
	Image[] imgSquares = new Image[256];
	Image[] imgLevels = new Image[5];
	Label lblLevel = new Label("lblLevel", LEVEL_STRING[level]);
	AjaxPlayerPanel playerSound = new AjaxPlayerPanel("playerSound") {
		private static final long serialVersionUID = 1L;

		@Override
		protected void muteChanged(AjaxRequestTarget target) {
			setResourceReference(rrSound[RESP_CLICK]);
			super.muteChanged(target);
			addCookieValue("soundMute", Boolean.toString(getMute()));
		}

		@Override
		protected void volumeChanged(AjaxRequestTarget target) {
			setResourceReference(rrSound[RESP_CLICK]);
			super.volumeChanged(target);
			addCookieValue("soundVolume", Integer.toString(getVolume()));
		}
	};

	private class AjaxBoard {
		private AjaxRequestTarget target;

		AjaxBoard(AjaxRequestTarget target) {
			this.target = target;
		}

		void drawSquare(int sq) {
			if (sq == sqSelected || sq == Position.SRC(mvLast) || sq == Position.DST(mvLast)) {
				imgSquares[sq].setImageResourceReference(rrSelected[pos.squares[sq]]);
			} else {
				imgSquares[sq].setImageResourceReference(rrPieces[pos.squares[sq]]);
			}
			target.addComponent(imgSquares[sq]);
		}

		void drawMove(int mv) {
			drawSquare(Position.SRC(mv));
			drawSquare(Position.DST(mv));
		}

		void playSound(int response) {
			if (!playerSound.getMute()) {
				playerSound.setResourceReference(rrSound[response]);
				playerSound.refresh(target);
			}
		}

		void setMessage(String msg, int status) {
			lblTitle.setModelObject(msg);
			imgTitle.setImageResourceReference(rrStatus[status]);
			if (target != null) {
				target.addComponent(lblTitle);
				target.addComponent(imgTitle);
			}
			XQWAjaxPage.this.status = status;
		}
	}

	private int getCookieValue(String name, int min, int max, int defaultValue) {
		int value = defaultValue;
		Cookie cookie = ((WebRequest) getRequest()).getCookie(name);
		if (cookie != null) {
			try {
				value = Integer.parseInt(cookie.getValue());
			} catch (Exception e) {
				// Ignored;
			}
		}
		return Util.MIN_MAX(min, value, max);
	}

	private boolean getCookieValue(String name, boolean defaultValue) {
		boolean value = defaultValue;
		Cookie cookie = ((WebRequest) getRequest()).getCookie(name);
		if (cookie != null) {
			try {
				value = Boolean.parseBoolean(cookie.getValue());
			} catch (Exception e) {
				// Ignored;
			}
		}
		return value;
	}

	private String getCookieValue(String name) {
		Cookie cookie = ((WebRequest) getRequest()).getCookie(name);
		return (cookie == null ? null : cookie.getValue());
	}

	public XQWAjaxPage() {
		// 1. Start-Up Position ...
		boolean flipped = getCookieValue("flipped", false);
		int handicap = getCookieValue("handicap", 0, 3, 0);
		retractFen = getCookieValue("fen");
		retractFen = (retractFen == null ? Position.STARTUP_FEN[handicap] : retractFen);
		pos.fromFen(retractFen);
		// 2. Title ...
		add(lblTitle.setOutputMarkupId(true));
		add(imgTitle.setOutputMarkupId(true));
		// 3. Board ...
		for (int i = 0; i < 256; i ++) {
			final int sq = i;
			if (!Position.IN_BOARD(sq)) {
				continue;
			}
			int sqFlipped = flipped ? Position.SQUARE_FLIP(sq) : sq;
			String sqName = "" + (char) ('a' + Position.FILE_X(sqFlipped) - Position.FILE_LEFT) +
					(char) ('9' - Position.RANK_Y(sqFlipped) + Position.RANK_TOP);
			imgSquares[sq] = new Image(sqName, rrPieces[pos.squares[sq]]);
			imgSquares[sq].add(new AjaxEventBehavior("onClick") {
				private static final long serialVersionUID = 1L;

				@Override
				protected void onEvent(AjaxRequestTarget target) {
					if (status != STATUS_READY) {
						return;
					}
					AjaxBoard board = new AjaxBoard(target);
					int pc = pos.squares[sq];
					if ((pc & Position.SIDE_TAG(pos.sdPlayer)) != 0) {
						if (sqSelected > 0) {
							int sqLast = sqSelected;
							sqSelected = 0;
							board.drawSquare(sqLast);
						}
						sqSelected = sq;
						board.drawSquare(sq);
						if (mvLast > 0) {
							int mv = mvLast;
							mvLast = 0;
							board.drawMove(mv);
						}
						board.drawSquare(sq);
						board.playSound(RESP_CLICK);
					} else if (sqSelected > 0) {
						int mv = Position.MOVE(sqSelected, sq);
						if (!pos.legalMove(mv)) {
							return;
						}
						pc = pos.squares[sqSelected];
						if (!pos.makeMove(mv)) {
							board.playSound(RESP_ILLEGAL);
							return;
						}
						int response = pos.inCheck() ? RESP_CHECK :
								pos.captured() ? RESP_CAPTURE : RESP_MOVE;
						if (pos.captured()) {
							pos.setIrrev();
						}
						int sqLast = sqSelected;
						sqSelected = 0;
						board.drawSquare(sqLast);
						mvLast = mv;
						board.drawMove(mv);
						board.playSound(response);
						if (getResult(board)) {
							addCookieValue("fen", null);
						} else {
							thinking(target);
						}
					}
				}
			});
			add(imgSquares[sq].setOutputMarkupId(true));
		}
		// 4. Form ...
		// 4.1. Player Moves ...
		final RadioChoice selFlipped = new RadioChoice("selFlipped",
				new Model(flipped ? Choices.FLIPPED_TRUE : Choices.FLIPPED_FALSE),
				Choices.getFlippedTypes());
		// selFlipped.setModelValue(new String[] {Integer.toString(flipped ? 1 : 0)});
		// 4.2. Handicap ...
		final RadioChoice selHandicap = new RadioChoice("selHandicap",
				new Model(Choices.getHandicapTypes().get(handicap)), Choices.getHandicapTypes());
		// selHandicap.setModelValue(new String[] {Integer.toString(handicap)});
		// 4.3. New Game ...
		Form frm = new Form("frm") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onSubmit() {
				if (status != STATUS_THINKING) {
					addCookieValue("fen", null);
					addCookieValue("flipped", Boolean.toString(selFlipped.
							getModelObjectAsString().equals(Choices.FLIPPED_TRUE)));
					addCookieValue("handicap", selHandicap.getModelValue());
					setResponsePage(RefreshPage.class);
				}
			}
		};
		frm.add(selFlipped);
		frm.add(selHandicap);
		add(frm);
		// 4.4. Board ...
		final RadioChoice selBoard = new RadioChoice("selBoard");
		// 4.5. Pieces ...
		final RadioChoice selPieces = new RadioChoice("selPieces");
		// 4.6. Musics ...
		final RadioChoice selMusic = new RadioChoice("selMusic");
		// 4.7. Apply ...
		Form frmGui = new Form("frmGui") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void onSubmit() {
				// TODO
			}
		};
		frmGui.add(selBoard);
		frmGui.add(selPieces);
		frmGui.add(selMusic);
		add(frmGui);
		// 5. Retract and Cookies ...
		add(new Link("lnkRetract") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				if (status != STATUS_THINKING) {
					addCookieValue("fen", retractFen);
					setResponsePage(RefreshPage.class);
				}
			}
		});
		add(new Link("lnkCookies") {
			private static final long serialVersionUID = 1L;

			@Override
			public void onClick() {
				if (status != STATUS_THINKING) {
					setResponsePage(new CookiesPage("Ajax Chess"));
				}
			}
		}.setVisible(getApplication().getConfigurationType().equalsIgnoreCase("DEVELOPMENT")));
		// 6. Level ...
		for (int i = 0; i < 5; i ++) {
			final int currLevel = i;
			imgLevels[i] = new Image("imgLevel" + i, i > level ? rrStar0 : rrStar1);
			imgLevels[i].add(new AjaxEventBehavior("onClick") {
				private static final long serialVersionUID = 1L;

				@Override
				protected void onEvent(AjaxRequestTarget target) {
					level = currLevel;
					for (int j = 1; j < 5; j ++) {
						imgLevels[j].setImageResourceReference(j > level ? rrStar0 : rrStar1);
						target.addComponent(imgLevels[j]);
					}
					lblLevel.setModelObject(LEVEL_STRING[level]);
					target.addComponent(lblLevel);
					addCookieValue("level", Integer.toString(level));
				}
			});
			add(imgLevels[i].setOutputMarkupId(true));
		}
		add(lblLevel.setOutputMarkupId(true));
		// 7. Sounds ...
		ResourceComponent embedSound = new ResourceComponent("embedSound");
		add(embedSound);
		playerSound.setEmbed(embedSound);
		playerSound.setMute(getCookieValue("soundMute", false));
		playerSound.setVolume(getCookieValue("soundVolume", 1, 5, 3));
		add(playerSound);
		// 8. Musics ...
		ResourceComponent embedMusic = new ResourceComponent("embedMusic", rrMusic);
		add(embedMusic);
		AjaxPlayerPanel playerMusic = new AjaxPlayerPanel("playerMusic") {
			private static final long serialVersionUID = 1L;

			@Override
			protected void muteChanged(AjaxRequestTarget target) {
				super.muteChanged(target);
				addCookieValue("musicMute", Boolean.toString(getMute()));
			}

			@Override
			protected void volumeChanged(AjaxRequestTarget target) {
				super.volumeChanged(target);
				addCookieValue("musicVolume", Integer.toString(getVolume()));
			}
		};
		playerMusic.setEmbed(embedMusic);
		playerMusic.setMute(getCookieValue("musicMute", false));
		playerMusic.setVolume(getCookieValue("musicVolume", 1, 5, 2));
		playerMusic.setLoop(true);
		add(playerMusic);
		// 9. Thinking Response ...
		add(new AbstractAjaxTimerBehavior(Duration.seconds(1)) {
			private static final long serialVersionUID = 1L;

			private String cookieFen = retractFen;

			@Override
			protected void onTimer(AjaxRequestTarget target) {
				AjaxBoard board = new AjaxBoard(target);
				if (status != STATUS_TO_MOVE) {
					return;
				}
				if (sqSelected > 0) {
					int sq = sqSelected;
					sqSelected = 0;
					board.drawSquare(sq);
				}
				if (mvLast > 0) {
					int mv = mvLast;
					mvLast = 0;
					board.drawMove(mv);
				}
				mvLast = mvResult;
				pos.makeMove(mvLast);
				board.drawMove(mvLast);
				int response = pos.inCheck() ? RESP_CHECK2 :
						pos.captured() ? RESP_CAPTURE2 : RESP_MOVE2;
				if (pos.captured()) {
					pos.setIrrev();
				}
				if (getResult(board, response)) {
					addCookieValue("fen", null);
				} else {
					board.playSound(response);
					board.setMessage("就绪", STATUS_READY);
					status = STATUS_READY;
					retractFen = cookieFen;
					cookieFen = pos.toFen();
					addCookieValue("fen", cookieFen);
				}
			}
		});
		// 10. Computer Moves First ...
		if ((pos.sdPlayer == 0 ? flipped : !flipped) && !pos.isMate()) {
			thinking(null);
		}
	}

	void addCookieValue(String name, String value) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(365 * 86400);
		if (value == null) {
			((WebResponse) getResponse()).clearCookie(cookie);
		} else {
			((WebResponse) getResponse()).addCookie(cookie);
		}
	}

	void thinking(AjaxRequestTarget target) {
		new AjaxBoard(target).setMessage("思考中……", STATUS_THINKING);
		new Thread() {
			@Override
			public void run() {
				mvResult = search.searchMain(100 << (level << 1));
				status = STATUS_TO_MOVE;
			}
		}.start();
	}

	boolean getResult(AjaxBoard board) {
		return getResult(board, -1);
	}

	boolean getResult(AjaxBoard board, int response) {
		if (pos.isMate()) {
			if (response < 0) {
				board.playSound(response < 0 ? RESP_WIN : RESP_LOSS);
				board.setMessage("祝贺你取得胜利！", STATUS_WIN);
			} else {
				board.playSound(RESP_LOSS);
				board.setMessage("请再接再厉！", STATUS_LOSS);
			}
			return true;
		}
		int vlRep = pos.repStatus(3);
		if (vlRep > 0) {
			vlRep = (response < 0 ? pos.repValue(vlRep) : -pos.repValue(vlRep));
			if (vlRep > Position.WIN_VALUE) {
				board.playSound(RESP_LOSS);
				board.setMessage("长打作负，请不要气馁！" , STATUS_LOSS);
			} else if (vlRep < -Position.WIN_VALUE) {
				board.playSound(RESP_WIN);
				board.setMessage("电脑长打作负，祝贺你取得胜利！" , STATUS_WIN);
			} else {
				board.playSound(RESP_DRAW);
				board.setMessage("双方不变作和，辛苦了！" , STATUS_DRAW);
			}
			return true;
		}
		if (pos.moveNum > 100) {
			board.playSound(RESP_DRAW);
			board.setMessage("超过自然限着作和，辛苦了！", STATUS_DRAW);
			return true;
		}
		return false;
	}
}