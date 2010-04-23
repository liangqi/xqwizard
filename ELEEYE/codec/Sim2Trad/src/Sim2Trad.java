import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;
import javax.swing.UIManager;

import com.google.api.translate.Language;
import com.google.api.translate.Translate;

public class Sim2Trad {
	static String sim2Trad(String sim) throws Exception {
		String[] sims = sim.split("\n");
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < sims.length; i ++) {
			if (sims[i].length() > 0) {
				sb.append(Translate.translate(sims[i],
						Language.CHINESE_SIMPLIFIED, Language.CHINESE_TRADITIONAL));
			}
			sb.append('\n');
		}
		return sb.toString();
	}

	static String gb2Big5(String gb) throws Exception {
		return new String(gb.getBytes("BIG5"));
	}

	public static void main(String[] args) throws Exception {
		Translate.setHttpReferrer("http://code.google.com/p/google-api-translate-java/");
		UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());

        final JFrame frame = new JFrame("简繁转换");
		frame.setSize(320, 240);
        frame.setResizable(false);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		Font font = new Font("宋体", Font.PLAIN, 12);
		KeyAdapter ka = new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
					frame.dispose();
				}
			}
		};

		final JTextArea txtLeft = new JTextArea();
		txtLeft.setFont(font);
		txtLeft.addKeyListener(ka);
		JScrollPane spLeft = new JScrollPane(txtLeft,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		spLeft.setBounds(10, 10, 100, 200);

		final JTextArea txtRight = new JTextArea();
		txtRight.setFont(font);
		txtRight.setEditable(false);
		txtRight.addKeyListener(ka);
		JScrollPane spRight = new JScrollPane(txtRight,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		spRight.setBounds(210, 10, 100, 200);

		JButton btnTrad = new JButton("繁体");
		btnTrad.setMargin(new Insets(0, 0, 0, 0));
		btnTrad.setBounds(120, 10, 80, 30);
		btnTrad.setFont(font);
		btnTrad.addKeyListener(ka);
		btnTrad.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					txtRight.setText(sim2Trad(txtLeft.getText()));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});

		JButton btnBig5 = new JButton("BIG5");
		btnBig5.setMargin(new Insets(0, 0, 0, 0));
		btnBig5.setBounds(120, 50, 80, 30);
		btnBig5.setFont(font);
		btnBig5.addKeyListener(ka);
		btnBig5.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					txtRight.setText(gb2Big5(txtLeft.getText()));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});

		JButton btnTradBig5 = new JButton("繁体BIG5");
		btnTradBig5.setMargin(new Insets(0, 0, 0, 0));
		btnTradBig5.setFont(font);
		btnTradBig5.setBounds(120, 90, 80, 30);
		btnTradBig5.addKeyListener(ka);
		btnTradBig5.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					txtRight.setText(gb2Big5(sim2Trad(txtLeft.getText())));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});

		JButton btnExit = new JButton("退出");
		btnExit.setMargin(new Insets(0, 0, 0, 0));
		btnExit.setFont(font);
		btnExit.setBounds(120, 180, 80, 30);
		btnExit.addKeyListener(ka);
		btnExit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				frame.dispose();
			}
		});
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.add(spLeft);
		panel.add(spRight);
		panel.add(btnTrad);
		panel.add(btnBig5);
		panel.add(btnTradBig5);
		panel.add(btnExit);

		frame.setContentPane(panel);
		frame.setVisible(true);
	}
}