package xqwlight;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Graphics;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.net.URL;

public class XQWLApplet extends Applet {
	private static final long serialVersionUID = 1L;

	static final URL urlBoard;

	static {
		try {
			urlBoard = new URL("http://www.elephantbase.net/xqwlight/boards/wood.gif");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	Position pos = new Position();
	Button button = new Button("OK");
	Panel panel = new Panel() {
		private static final long serialVersionUID = 1L;

		public void paint(Graphics g) {
			g.drawImage(getImage(urlBoard), 0, 0, this);
		}
	};

	{
		pos.fromFen(Position.STARTUP_FEN[0]);

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
				System.out.println("Clicked¡­¡­");
			}

			public void mouseReleased(MouseEvent e) {
				// Do Nothing
			}
		});
		panel.setBounds(0, 0, 500, 500);

		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Clicked!");
			}
		});
		button.setBounds(500, 50, 100, 100);
	}

	public void init() {
		setLayout(new BorderLayout());
		add(BorderLayout.CENTER, panel);
		add(BorderLayout.SOUTH, button);
	}

	public void destroy() {
		remove(panel);
		remove(button);
	}
}