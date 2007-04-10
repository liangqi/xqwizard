import java.applet.Applet;
import java.awt.Button;
import java.awt.Color;
import java.awt.Event;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Label;
import java.awt.Scrollbar;

public class JavaXQ extends Applet {
	private static final long serialVersionUID = 1L;

	private static final int X0 = 20;
	private static final int Y0 = 20;
	private static final int CX = 26;
	private static final int CY = 26;
	private static final int BOARD_WITDH = 247;
	private static final int BOARD_HEIGHT = 299;
	private static final Color FORE_COLOR = Color.white;
	private static final Color BACK_COLOR = new Color(153, 204, 153);
	private static final String PIECE_NAME = "RNBAKABNRCCPPPPPrnbakabnrccppppp";
	private static final int MAX_STEPS = 1024;

	private int stepNo = 0;
	private int stepNum = 0;
	private int pieceInitXY[] = new int[32];
	private int pieceCurrXY[] = new int[32];
	private int stepListXYFrom[] = new int[MAX_STEPS];
	private int stepListXYTo[] = new int[MAX_STEPS];
	private boolean isPaintBusy = false;

	private Scrollbar hsbStepNo;
	private Button btnSwitchSide;
	private Label lblStepNo;
	private Button btnNext;
	private Button btnBack;
	private boolean isRedAtBottom;
	private Image offScreen;
	private Graphics offGraphics;

	@Override
	public void init() {
		setLayout(null);
		setBackground(BACK_COLOR);
		isRedAtBottom = true;
		btnSwitchSide = new Button("@");
		hsbStepNo = new Scrollbar(0, 0, 1, 0, 30);
		lblStepNo = new Label("0/0");
		btnBack = new Button("<");
		btnNext = new Button(">");
		add(btnSwitchSide);
		add(hsbStepNo);
		add(lblStepNo);
		add(btnBack);
		add(btnNext);
		int i = ((Y0 + CY * 10) - CY / 2) + 4;
		btnSwitchSide.setBounds(14, i, 15, 19);
		hsbStepNo.setBounds(50, i, 100, 19);
		lblStepNo.setBounds(153, i, 45, 19);
		lblStepNo.setAlignment(1);
		btnBack.setBounds(201, i, 15, 19);
		btnNext.setBounds(219, i, 15, 19);
		String s;
		if ((s = getParameter("Position")) == null) {
			s = "I0,H0,G0,F0,E0,D0,C0,B0,A0,H2,B2,I3,G3,E3,C3,A3|A9,B9,C9,D9,E9,F9,G9,H9,I9,B7,H7,A6,C6,E6,G6,I6";
		}
		for (int j = 0; j < 32; j ++) {
			pieceInitXY[j] = 100;
			if (s.charAt(j * 3) >= 'A' && s.charAt(j * 3) <= 'I') {
				pieceInitXY[j] = (s.charAt(j * 3) - 65) * 10 + (s.charAt(j * 3 + 1) - 48);
			}
		}
		if ((s = getParameter("MoveList")) != null) {
			int k = 0;
			for (int l = 0; l < s.length(); l += 6) {
				stepListXYFrom[k] = (s.charAt(l) - 65) * 10 + (s.charAt(l + 1) - 48);
				stepListXYTo[k] = (s.charAt(l + 3) - 65) * 10 + (s.charAt(l + 4) - 48);
				k++;
			}
			stepNum = k;
			hsbStepNo.setValues(hsbStepNo.getValue(), 1, hsbStepNo.getMinimum(), stepNum + 1);
			hsbStepNo.setBlockIncrement(stepNum >= 5 ? stepNum / 5 : 1);
		}
		if ((s = getParameter("Step")) != null) {
			stepNo = Integer.parseInt(s);
			hsbStepNo.setValue(stepNo);
		}
	}

	@Override
	public void paint(Graphics g) {
		if (isPaintBusy) {
			return;
		}
		isPaintBusy = true;
		if (offScreen == null) {
			offScreen = createImage(CX * 12, CY * 15);
			offGraphics = offScreen.getGraphics();
			offGraphics.setFont(getFont());
			offGraphics.setColor(getBackground());
		}
		drawBoard(offGraphics);
		drawPosition(offGraphics);
		g.drawImage(offScreen, 0, 0, null);
		lblStepNo.setText(stepNo + "/" + stepNum);
		isPaintBusy = false;
	}

	@Override
	@SuppressWarnings("deprecation")
	public boolean handleEvent(Event event) {
		if (event.target.equals(hsbStepNo)) {
			stepNo = hsbStepNo.getValue();
			paint(getGraphics());
		} else {
			return super.handleEvent(event);
		}
		return true;
	}

	@Override
	@SuppressWarnings("deprecation")
	public boolean action(Event event, Object obj) {
		if (obj.equals("@")) {
			isRedAtBottom = !isRedAtBottom;
			paint(getGraphics());
		} else if (obj.equals(">")) {
			if (stepNo < stepNum) {
				hsbStepNo.setValue(hsbStepNo.getValue() + 1);
				stepNo = hsbStepNo.getValue();
				paint(getGraphics());
			}
		} else {
			if (obj.equals("<") && stepNo > 0) {
				hsbStepNo.setValue(hsbStepNo.getValue() - 1);
				stepNo = hsbStepNo.getValue();
				paint(getGraphics());
			}
		}
		return super.action(event, obj);
	}

	/** 显示棋子 */
	private void drawPosition(Graphics g) {
		for (int i = 0; i < 32; i ++) {
			pieceCurrXY[i] = pieceInitXY[i];
		}
		for (int i = 0; i < stepNo; i++) {
			for (int j = 0; j < 32; j ++) {
				if (pieceCurrXY[j] == stepListXYTo[i]) {
					pieceCurrXY[j] = 100;
				}
				if (pieceCurrXY[j] == stepListXYFrom[i]) {
					pieceCurrXY[j] = stepListXYTo[i];
				}
			}
		}
		for (int i = 0; i < 32; i ++) {
			if (pieceCurrXY[i] <= 89) {
				drawPiece(g, PIECE_NAME.charAt(i), pieceCurrXY[i] / 10, pieceCurrXY[i] % 10);
			}
		}
	}

	/** 显示棋盘格线 */
	private void drawBoardLine(Graphics g, int i, int j, int k, int l) {
		g.drawLine(X0 + CX * i, Y0 + CY * j, X0 + CX * k, Y0 + CY * l);
	}

	/** 显示炮和兵卒布点 */
	private void drawCross(Graphics g, int i, int j) {
		byte byte0 = 4;
		int k = X0 + CX * i;
		int l = Y0 + CY * j;
		if (i > 0) {
			g.drawLine(k - 2, l - CY / byte0, k - 2, l - 2);
			g.drawLine(k - 2, l + CY / byte0, k - 2, l + 2);
			g.drawLine(k - CX / byte0, l - 2, k - 2, l - 2);
			g.drawLine(k - CX / byte0, l + 2, k - 2, l + 2);
		}
		if (i < 8) {
			g.drawLine(k + 2, l - CY / byte0, k + 2, l - 2);
			g.drawLine(k + 2, l + CY / byte0, k + 2, l + 2);
			g.drawLine(k + CX / byte0, l - 2, k + 2, l - 2);
			g.drawLine(k + CX / byte0, l + 2, k + 2, l + 2);
		}
	}

	/** 显示整个棋盘 */
	private void drawBoard(Graphics g) {
		g.setColor(BACK_COLOR);
		g.fillRect(0, 0, CX * 12, CY * 15);
		g.setColor(FORE_COLOR);
		g.setColor(Color.gray);
		g.drawRect(3, 3, BOARD_WITDH - 6, BOARD_HEIGHT - 6);
		g.setColor(Color.white);
		g.drawRect(4, 4, BOARD_WITDH - 6, BOARD_HEIGHT - 6);
		g.setColor(FORE_COLOR);
		for (int i = 0; i < 10; i ++) {
			drawBoardLine(g, 0, i, 8, i);
		}
		drawBoardLine(g, 0, 0, 0, 9);
		for (int i = 1; i < 8; i ++) {
			drawBoardLine(g, i, 0, i, 4);
			drawBoardLine(g, i, 5, i, 9);
		}
		drawBoardLine(g, 8, 0, 8, 9);
		drawCross(g, 1, 2);
		drawCross(g, 7, 2);
		for (int i = 0; i < 10; i += 2) {
			drawCross(g, i, 3);
			drawCross(g, i, 6);
		}
		drawCross(g, 1, 7);
		drawCross(g, 7, 7);
		drawBoardLine(g, 3, 0, 5, 2);
		drawBoardLine(g, 3, 2, 5, 0);
		drawBoardLine(g, 3, 9, 5, 7);
		drawBoardLine(g, 3, 7, 5, 9);
	}

	/** 显示棋子 */
	private void drawPiece(Graphics g, char c, int i, int j) {
		if (isRedAtBottom) {
			j = 9 - j;
		} else {
			i = 8 - i;
		}
		int ii = ((X0 + CX * i) - CX / 2) + 1;
		int jj = ((Y0 + CY * j) - CY / 2) + 1;
		boolean bBlack = Character.isLowerCase(c);
		g.setColor(bBlack ? Color.blue : Color.red);
		g.fillOval(ii, jj, CX - 2, CY - 2);
		g.setColor(Color.white);
		c = Character.toUpperCase(c);
		switch (c) {
		case 'K':
			if (bBlack) {
				drawKingBlack(ii, jj, g);
			} else {
				drawKingRed(ii, jj, g);
			}
			break;
		case 'A':
			if (bBlack) {
				drawAdvisorBlack(ii, jj, g);
			} else {
				drawAdvisorRed(ii, jj, g);
			}
			break;
		case 'B':
			if (bBlack) {
				drawBishopBlack(ii, jj, g);
			} else {
				drawBishopRed(ii, jj, g);
			}
			break;
		case 'N':
			drawKnight(ii, jj, g);
			break;
		case 'R':
			drawRook(ii, jj, g);
			break;
		case 'C':
			drawCannon(ii, jj, g);
			break;
		case 'P':
			if (bBlack) {
				drawPawnBlack(ii, jj, g);
			} else {
				drawPawnRed(ii, jj, g);
			}
			break;
		}
	}

	/** 显示“帅” */
	private void drawKingRed(int i, int j, Graphics g) {
		g.drawLine(i + 14, j + 4, i + 14, j + 19);
		g.drawLine(i + 15, j + 4, i + 15, j + 5);
		g.drawLine(i + 12, j + 8, i + 18, j + 8);
		g.drawLine(i + 11, j + 9, i + 11, j + 14);
		g.drawLine(i + 12, j + 9, i + 12, j + 10);
		g.drawLine(i + 17, j + 9, i + 18, j + 9);
		g.drawLine(i + 17, j + 10, i + 17, j + 15);
		g.drawLine(i + 15, j + 14, i + 16, j + 14);
		g.drawLine(i + 16, j + 15, i + 16, j + 15);
		g.drawLine(i + 8, j + 5, i + 9, j + 5);
		g.drawLine(i + 7, j + 6, i + 8, j + 6);
		g.drawLine(i + 6, j + 7, i + 7, j + 7);
		g.drawLine(i + 5, j + 8, i + 6, j + 8);
		g.drawLine(i + 9, j + 8, i + 10, j + 8);
		g.drawLine(i + 9, j + 9, i + 9, j + 9);
		g.drawLine(i + 5, j + 9, i + 5, j + 17);
		g.drawLine(i + 6, j + 10, i + 6, j + 10);
		g.drawLine(i + 8, j + 10, i + 9, j + 10);
		g.drawLine(i + 6, j + 11, i + 8, j + 11);
		g.drawLine(i + 6, j + 13, i + 10, j + 13);
		g.drawLine(i + 8, j + 14, i + 9, j + 14);
		g.drawLine(i + 7, j + 15, i + 9, j + 15);
		g.drawLine(i + 6, j + 16, i + 9, j + 16);
	}

	/** 显示“将” */
	private void drawKingBlack(int i, int j, Graphics g) {
		g.drawLine(i + 6, j + 7, i + 6, j + 9);
		g.drawLine(i + 7, j + 6, i + 7, j + 7);
		g.drawLine(i + 7, j + 9, i + 10, j + 9);
		g.drawLine(i + 5, j + 10, i + 7, j + 10);
		g.drawLine(i + 5, j + 12, i + 5, j + 13);
		g.drawLine(i + 6, j + 12, i + 13, j + 12);
		g.drawLine(i + 6, j + 13, i + 6, j + 16);
		g.drawLine(i + 5, j + 16, i + 5, j + 17);
		g.drawLine(i + 9, j + 5, i + 10, j + 5);
		g.drawLine(i + 9, j + 6, i + 9, j + 18);
		g.drawLine(i + 8, j + 11, i + 8, j + 11);
		g.drawLine(i + 14, j + 4, i + 14, j + 5);
		g.drawLine(i + 12, j + 6, i + 13, j + 6);
		g.drawLine(i + 16, j + 6, i + 17, j + 6);
		g.drawLine(i + 12, j + 7, i + 16, j + 7);
		g.drawLine(i + 11, j + 8, i + 12, j + 8);
		g.drawLine(i + 15, j + 8, i + 15, j + 8);
		g.drawLine(i + 12, j + 9, i + 14, j + 9);
		g.drawLine(i + 13, j + 10, i + 13, j + 10);
		g.drawLine(i + 11, j + 11, i + 19, j + 11);
		g.drawLine(i + 16, j + 9, i + 16, j + 20);
		g.drawLine(i + 18, j + 12, i + 19, j + 12);
		g.drawLine(i + 11, j + 14, i + 12, j + 14);
		g.drawLine(i + 11, j + 15, i + 13, j + 15);
		g.drawLine(i + 13, j + 18, i + 13, j + 18);
		g.drawLine(i + 14, j + 19, i + 15, j + 19);
	}

	/** 显示“仕” */
	private void drawAdvisorRed(int i, int j, Graphics g) {
		g.drawLine(i + 13, j + 5, i + 13, j + 5);
		g.fillRect(i + 14, j + 6, 2, 10);
		g.fillRect(i + 16, j + 10, 3, 2);
		g.fillRect(i + 11, j + 16, 8, 2);
		g.drawLine(i + 10, j + 11, i + 13, j + 11);
		g.drawLine(i + 10, j + 12, i + 10, j + 12);
		g.drawLine(i + 10, j + 17, i + 10, j + 17);
		g.drawLine(i + 9, j + 6, i + 10, j + 6);
		g.fillRect(i + 8, j + 7, 2, 2);
		g.drawLine(i + 7, j + 9, i + 8, j + 9);
		g.drawLine(i + 7, j + 10, i + 7, j + 10);
		g.drawLine(i + 6, j + 11, i + 7, j + 11);
		g.drawLine(i + 5, j + 12, i + 8, j + 12);
		g.drawLine(i + 5, j + 13, i + 5, j + 13);
		g.drawLine(i + 7, j + 13, i + 8, j + 13);
		g.drawLine(i + 4, j + 14, i + 4, j + 14);
		g.drawLine(i + 8, j + 14, i + 8, j + 15);
		g.drawLine(i + 8, j + 17, i + 8, j + 17);
		g.drawLine(i + 7, j + 18, i + 8, j + 18);
	}

	/** 显示“士” */
	private void drawAdvisorBlack(int i, int j, Graphics g) {
		g.drawLine(i + 12, j + 5, i + 12, j + 5);
		g.drawLine(i + 11, j + 6, i + 11, j + 16);
		g.drawLine(i + 12, j + 6, i + 12, j + 16);
		g.drawLine(i + 13, j + 6, i + 13, j + 7);
		g.drawLine(i + 13, j + 9, i + 13, j + 10);
		g.drawLine(i + 13, j + 11, i + 18, j + 11);
		g.drawLine(i + 7, j + 12, i + 19, j + 12);
		g.drawLine(i + 5, j + 13, i + 9, j + 13);
		g.drawLine(i + 19, j + 13, i + 19, j + 13);
		g.drawLine(i + 9, j + 17, i + 16, j + 17);
		g.drawLine(i + 7, j + 18, i + 8, j + 18);
		g.drawLine(i + 17, j + 18, i + 17, j + 18);
	}

	/** 显示“相” */
	private void drawBishopRed(int i, int j, Graphics g) {
		g.drawLine(i + 9, j + 3, i + 9, j + 3);
		g.drawLine(i + 10, j + 4, i + 10, j + 4);
		g.drawLine(i + 9, j + 5, i + 9, j + 7);
		g.drawLine(i + 8, j + 8, i + 11, j + 8);
		g.fillRect(i + 5, j + 9, 5, 2);
		g.drawLine(i + 10, j + 9, i + 10, j + 9);
		g.fillRect(i + 8, j + 11, 2, 9);
		g.drawLine(i + 10, j + 11, i + 10, j + 12);
		g.drawLine(i + 7, j + 12, i + 7, j + 13);
		g.drawLine(i + 6, j + 14, i + 6, j + 14);
		g.drawLine(i + 5, j + 15, i + 5, j + 15);
		g.drawLine(i + 4, j + 16, i + 4, j + 16);
		g.fillRect(i + 12, j + 9, 2, 6);
		g.drawLine(i + 12, j + 15, i + 12, j + 16);
		g.drawLine(i + 14, j + 8, i + 16, j + 8);
		g.fillRect(i + 17, j + 8, 2, 11);
		g.drawLine(i + 15, j + 10, i + 15, j + 10);
		g.drawLine(i + 14, j + 11, i + 15, j + 11);
		g.drawLine(i + 14, j + 13, i + 15, j + 13);
		g.drawLine(i + 13, j + 16, i + 15, j + 16);
		g.drawLine(i + 16, j + 17, i + 16, j + 17);
		g.drawLine(i + 18, j + 18, i + 18, j + 18);
	}

	/** 显示“象” */
	private void drawBishopBlack(int i, int j, Graphics g) {
		g.drawLine(i + 11, j + 3, i + 12, j + 3);
		g.drawLine(i + 10, j + 4, i + 14, j + 4);
		g.drawLine(i + 9, j + 5, i + 10, j + 5);
		g.drawLine(i + 13, j + 5, i + 14, j + 5);
		g.drawLine(i + 8, j + 6, i + 8, j + 6);
		g.drawLine(i + 12, j + 6, i + 12, j + 6);
		g.drawLine(i + 6, j + 7, i + 7, j + 7);
		g.drawLine(i + 11, j + 7, i + 15, j + 7);
		g.drawLine(i + 5, j + 8, i + 5, j + 8);
		g.drawLine(i + 7, j + 8, i + 12, j + 8);
		g.drawLine(i + 14, j + 8, i + 16, j + 8);
		g.drawLine(i + 7, j + 9, i + 8, j + 9);
		g.drawLine(i + 11, j + 9, i + 11, j + 9);
		g.drawLine(i + 14, j + 9, i + 15, j + 9);
		g.drawLine(i + 8, j + 10, i + 8, j + 10);
		g.drawLine(i + 11, j + 10, i + 14, j + 10);
		g.drawLine(i + 9, j + 11, i + 14, j + 11);
		g.drawLine(i + 16, j + 11, i + 16, j + 11);
		g.drawLine(i + 10, j + 12, i + 10, j + 12);
		g.drawLine(i + 15, j + 12, i + 16, j + 12);
		g.drawLine(i + 8, j + 13, i + 14, j + 13);
		g.drawLine(i + 7, j + 14, i + 7, j + 14);
		g.drawLine(i + 10, j + 14, i + 13, j + 14);
		g.drawLine(i + 6, j + 15, i + 6, j + 15);
		g.drawLine(i + 9, j + 15, i + 9, j + 15);
		g.drawLine(i + 11, j + 15, i + 14, j + 15);
		g.drawLine(i + 7, j + 16, i + 8, j + 16);
		g.drawLine(i + 10, j + 16, i + 12, j + 16);
		g.drawLine(i + 15, j + 16, i + 16, j + 16);
		g.drawLine(i + 6, j + 17, i + 6, j + 17);
		g.drawLine(i + 9, j + 17, i + 9, j + 17);
		g.drawLine(i + 12, j + 17, i + 12, j + 19);
		g.drawLine(i + 16, j + 17, i + 18, j + 17);
		g.drawLine(i + 6, j + 18, i + 7, j + 18);
		g.drawLine(i + 11, j + 18, i + 11, j + 21);
		g.drawLine(i + 9, j + 20, i + 10, j + 20);
	}

	/** 显示“马” */
	private void drawKnight(int i, int j, Graphics g) {
		g.drawLine(i + 13, j + 4, i + 15, j + 4);
		g.drawLine(i + 8, j + 5, i + 15, j + 5);
		g.drawLine(i + 8, j + 6, i + 9, j + 6);
		g.drawLine(i + 11, j + 6, i + 11, j + 11);
		g.drawLine(i + 12, j + 6, i + 12, j + 11);
		g.drawLine(i + 8, j + 8, i + 8, j + 12);
		g.drawLine(i + 9, j + 8, i + 10, j + 8);
		g.drawLine(i + 9, j + 10, i + 10, j + 10);
		g.drawLine(i + 9, j + 11, i + 9, j + 11);
		g.drawLine(i + 13, j + 7, i + 14, j + 7);
		g.drawLine(i + 13, j + 9, i + 15, j + 9);
		g.drawLine(i + 13, j + 10, i + 14, j + 10);
		g.drawLine(i + 10, j + 12, i + 18, j + 12);
		g.drawLine(i + 7, j + 13, i + 10, j + 13);
		g.drawLine(i + 5, j + 16, i + 5, j + 16);
		g.drawLine(i + 6, j + 15, i + 6, j + 17);
		g.drawLine(i + 9, j + 14, i + 9, j + 15);
		g.drawLine(i + 9, j + 16, i + 10, j + 16);
		g.drawLine(i + 11, j + 14, i + 11, j + 14);
		g.drawLine(i + 11, j + 15, i + 12, j + 15);
		g.drawLine(i + 14, j + 14, i + 14, j + 14);
		g.drawLine(i + 14, j + 15, i + 15, j + 15);
		g.drawLine(i + 17, j + 13, i + 17, j + 18);
		g.drawLine(i + 18, j + 13, i + 18, j + 14);
		g.drawLine(i + 16, j + 17, i + 16, j + 17);
		g.drawLine(i + 14, j + 18, i + 16, j + 18);
		g.drawLine(i + 15, j + 19, i + 16, j + 19);
	}

	/** 显示“车” */
	private void drawRook(int i, int j, Graphics g) {
		g.drawLine(i + 9, j + 6, i + 14, j + 6);
		g.drawLine(i + 9, j + 7, i + 10, j + 7);
		g.drawLine(i + 8, j + 9, i + 8, j + 11);
		g.drawLine(i + 9, j + 9, i + 10, j + 9);
		g.drawLine(i + 9, j + 11, i + 10, j + 11);
		g.drawLine(i + 8, j + 12, i + 9, j + 12);
		g.drawLine(i + 9, j + 13, i + 11, j + 13);
		g.drawLine(i + 11, j + 8, i + 11, j + 13);
		g.drawLine(i + 13, j + 8, i + 16, j + 8);
		g.drawLine(i + 13, j + 10, i + 13, j + 10);
		g.drawLine(i + 13, j + 12, i + 14, j + 12);
		g.drawLine(i + 15, j + 9, i + 15, j + 13);
		g.drawLine(i + 16, j + 9, i + 16, j + 10);
		g.drawLine(i + 5, j + 15, i + 5, j + 15);
		g.drawLine(i + 13, j + 12, i + 14, j + 12);
		g.drawLine(i + 15, j + 9, i + 15, j + 13);
		g.drawLine(i + 16, j + 9, i + 16, j + 10);
		g.drawLine(i + 5, j + 15, i + 5, j + 15);
		g.drawLine(i + 5, j + 16, i + 6, j + 16);
		g.drawLine(i + 7, j + 15, i + 18, j + 15);
		g.drawLine(i + 17, j + 14, i + 17, j + 14);
		g.drawLine(i + 12, j + 3, i + 12, j + 19);
		g.drawLine(i + 11, j + 20, i + 12, j + 20);
	}

	/** 显示“炮” */
	private void drawCannon(int i, int j, Graphics g) {
		g.drawLine(i + 8, j + 5, i + 8, j + 10);
		g.drawLine(i + 7, j + 9, i + 7, j + 13);
		g.drawLine(i + 9, j + 9, i + 9, j + 9);
		g.drawLine(i + 5, j + 10, i + 5, j + 12);
		g.drawLine(i + 4, j + 11, i + 4, j + 12);
		g.drawLine(i + 6, j + 14, i + 6, j + 16);
		g.drawLine(i + 5, j + 16, i + 5, j + 16);
		g.drawLine(i + 4, j + 17, i + 4, j + 17);
		g.drawLine(i + 8, j + 13, i + 8, j + 14);
		g.drawLine(i + 9, j + 14, i + 9, j + 14);
		g.drawLine(i + 10, j + 8, i + 10, j + 8);
		g.drawLine(i + 10, j + 10, i + 10, j + 17);
		g.drawLine(i + 11, j + 11, i + 11, j + 14);
		g.drawLine(i + 14, j + 5, i + 15, j + 5);
		g.drawLine(i + 13, j + 6, i + 14, j + 6);
		g.drawLine(i + 13, j + 7, i + 13, j + 7);
		g.drawLine(i + 12, j + 8, i + 17, j + 8);
		g.drawLine(i + 11, j + 9, i + 12, j + 9);
		g.drawLine(i + 11, j + 11, i + 14, j + 11);
		g.drawLine(i + 13, j + 12, i + 13, j + 13);
		g.drawLine(i + 12, j + 13, i + 12, j + 14);
		g.drawLine(i + 16, j + 9, i + 16, j + 15);
		g.drawLine(i + 17, j + 9, i + 17, j + 12);
		g.drawLine(i + 15, j + 13, i + 15, j + 15);
		g.drawLine(i + 14, j + 14, i + 14, j + 14);
		g.drawLine(i + 11, j + 18, i + 18, j + 18);
		g.drawLine(i + 19, j + 14, i + 19, j + 18);
		g.drawLine(i + 12, j + 19, i + 18, j + 19);
	}

	/** 显示“兵” */
	private void drawPawnRed(int i, int j, Graphics g) {
		g.drawLine(i + 14, j + 4, i + 14, j + 4);
		g.drawLine(i + 12, j + 5, i + 15, j + 5);
		g.drawLine(i + 9, j + 6, i + 12, j + 6);
		g.drawLine(i + 9, j + 7, i + 9, j + 13);
		g.drawLine(i + 10, j + 7, i + 10, j + 13);
		g.drawLine(i + 16, j + 7, i + 17, j + 7);
		g.drawLine(i + 13, j + 8, i + 17, j + 8);
		g.drawLine(i + 11, j + 9, i + 15, j + 9);
		g.drawLine(i + 11, j + 10, i + 11, j + 10);
		g.drawLine(i + 13, j + 10, i + 15, j + 10);
		g.drawLine(i + 13, j + 11, i + 13, j + 12);
		g.drawLine(i + 14, j + 11, i + 14, j + 12);
		g.drawLine(i + 11, j + 13, i + 20, j + 13);
		g.drawLine(i + 3, j + 14, i + 20, j + 14);
		g.drawLine(i + 4, j + 15, i + 4, j + 15);
		g.drawLine(i + 20, j + 15, i + 20, j + 15);
		g.drawLine(i + 8, j + 16, i + 9, j + 16);
		g.drawLine(i + 14, j + 16, i + 15, j + 16);
		g.drawLine(i + 6, j + 17, i + 8, j + 17);
		g.drawLine(i + 15, j + 17, i + 17, j + 17);
		g.drawLine(i + 6, j + 18, i + 7, j + 18);
		g.drawLine(i + 16, j + 18, i + 17, j + 18);
		g.drawLine(i + 17, j + 19, i + 17, j + 19);
	}

	/** 显示“卒” */
	private void drawPawnBlack(int i, int j, Graphics g) {
		g.drawLine(i + 11, j + 4, i + 11, j + 5);
		g.drawLine(i + 12, j + 4, i + 12, j + 7);
		g.drawLine(i + 13, j + 7, i + 16, j + 7);
		g.drawLine(i + 7, j + 8, i + 14, j + 8);
		g.drawLine(i + 8, j + 9, i + 11, j + 9);
		g.drawLine(i + 14, j + 9, i + 15, j + 9);
		g.drawLine(i + 10, j + 10, i + 10, j + 10);
		g.drawLine(i + 13, j + 10, i + 14, j + 10);
		g.drawLine(i + 9, j + 11, i + 11, j + 11);
		g.drawLine(i + 13, j + 11, i + 16, j + 11);
		g.drawLine(i + 7, j + 12, i + 8, j + 12);
		g.drawLine(i + 11, j + 12, i + 12, j + 12);
		g.drawLine(i + 16, j + 12, i + 16, j + 12);
		g.drawLine(i + 11, j + 13, i + 18, j + 13);
		g.drawLine(i + 8, j + 14, i + 19, j + 14);
		g.drawLine(i + 4, j + 15, i + 7, j + 15);
		g.drawLine(i + 4, j + 16, i + 4, j + 16);
		g.drawLine(i + 12, j + 15, i + 12, j + 22);
		g.drawLine(i + 19, j + 15, i + 19, j + 15);
	}
}