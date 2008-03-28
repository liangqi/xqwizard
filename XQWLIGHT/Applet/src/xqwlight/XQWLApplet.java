package xqwlight;

import java.applet.Applet;
import java.awt.Button;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class XQWLApplet extends Applet {
	private static final long serialVersionUID = 1L;

	{
		Button b = new Button("OK");
		b.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Clicked!");
			}
		});
		add(b);

		MouseListener listener = new MouseListener() {
			public void mouseClicked(MouseEvent e) {
				e.consume();
				System.out.println("Clicked12345!");
			}

			public void mouseEntered(MouseEvent e) {
				// Do Nothing			
			}

			public void mouseExited(MouseEvent e) {
				// Do Nothing			
			}

			public void mousePressed(MouseEvent e) {
				// Do Nothing			
			}

			public void mouseReleased(MouseEvent e) {
				// e.consume();
				// text = "(" + e.getPoint().x + "," + e.getPoint().y;
				// repaint();
			}
		};

		Panel p = new Panel() {
			private static final long serialVersionUID = 1L;

			public void paint(Graphics g) {
				g.setColor(Color.black);
				g.drawRect(0, 0, 300, 300);
			}
		};

		p.addMouseListener(listener);
		p.setSize(300, 300);
		add(p);
	}
}