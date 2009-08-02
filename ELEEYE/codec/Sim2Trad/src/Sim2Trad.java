import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;

import com.google.api.translate.Language;
import com.google.api.translate.Translate;

public class Sim2Trad {
	public static void main(String[] args) throws Exception {
		Translate.setHttpReferrer("http://code.google.com/p/google-api-translate-java/");

		Font font = new Font("宋体", Font.PLAIN, 14);

		final JTextArea txtLeft = new JTextArea(20, 40);
		txtLeft.setFont(font);

		final JTextArea txtRight = new JTextArea(20, 40);
		txtRight.setFont(font);
		txtRight.setEditable(false);

		JButton btnTrad = new JButton("转换为繁体");
		JButton btnBig5 = new JButton("转换为BIG5");
		JButton btnTradBig5 = new JButton("转换为繁体BIG5");

		JPanel panel = new JPanel();
		panel.add(new JScrollPane(txtLeft,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS));

		JPanel panelButtons = new JPanel();
		panelButtons.setLayout(new BorderLayout());
		panelButtons.add(btnTrad, BorderLayout.NORTH);
		panelButtons.add(btnBig5, BorderLayout.CENTER);
		panelButtons.add(btnTradBig5, BorderLayout.SOUTH);
		panel.add(panelButtons);

		panel.add(new JScrollPane(txtRight,
				ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,
				ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS));

        final JFrame frame = new JFrame("简繁转换");
        frame.setResizable(false);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(panel);
		frame.pack();
		frame.setVisible(true);

		btnTrad.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					txtRight.setText(Translate.translate(txtLeft.getText(),
							Language.CHINESE_SIMPLIFIED, Language.CHINESE_TRADITIONAL));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});

		btnBig5.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					txtRight.setText(new String(txtLeft.getText().getBytes(), "BIG5"));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});

		btnTradBig5.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					String trad = Translate.translate(txtLeft.getText(),
							Language.CHINESE_SIMPLIFIED, Language.CHINESE_TRADITIONAL);
					txtRight.setText(new String(trad.getBytes(), "BIG5"));
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(frame, ex, frame.getTitle(),
							JOptionPane.WARNING_MESSAGE);
				}
			}
		});
	}
}