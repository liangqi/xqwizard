import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.TargetDataLine;
import javax.sound.sampled.DataLine.Info;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

class ByteArrayQueue {
	private byte[] array;
	private int offset = 0;
	private int length = 0;

	public ByteArrayQueue() {
		this(32);
	}

	public ByteArrayQueue(int capacity) {
		array = new byte[capacity];
	}

	public byte[] array() {
		return array;
	}

	public int offset() {
		return offset;
	}

	public int length() {
		return length;
	}

	public void clear() {
		offset = 0;
		length = 0;
	}

	public void setCapacity(int capacity) {
		byte[] newArray = new byte[capacity];
		System.arraycopy(array, offset, newArray, 0, length);
		array = newArray;
		offset = 0;
	}

	public void add(byte[] b) {
		add(b, 0, b.length);
	}

	public void add(byte[] b, int off, int len) {
		int newLength = length + len;
		if (newLength > array.length) {
			setCapacity(Math.max(array.length << 1, newLength));
		} else if (offset + newLength > array.length) {
			System.arraycopy(array, offset, array, 0, length);
			offset = 0;
		}
		System.arraycopy(b, off, array, offset + length, len);
		length = newLength;
	}

	public OutputStream getOutputStream() {
		return new OutputStream() {
			@Override
			public void write(int b) throws IOException {
				write(new byte[] {(byte) b});				
			}

			@Override
			public void write(byte[] b, int off, int len) throws IOException {
				add(b, off, len);
			}
		};
	}

	public void remove(byte[] b) {
		remove(b, 0, b.length);
	}

	public void remove(byte[] b, int off, int len) {
		System.arraycopy(array, offset, b, off, len);
		remove(len);
	}

	public void remove(int len) {
		offset += len;
		length -= len;
	}

	public InputStream getInputStream() {
		return new InputStream() {
			@Override
			public int read() throws IOException {
				byte[] b = new byte[1];
				if (read(b) <= 0) {
					return -1;
				}
				return b[0] & 0xff;
			}

			@Override
			public int read(byte[] b, int off, int len) throws IOException {
				int bytesToRead = Math.min(len, length());
				remove(b, off, bytesToRead);
				return bytesToRead;
			}
		};
	}

	@Override
	public String toString() {
		return new String(array, offset, length);
	}

	public String toString(String charSet) throws UnsupportedEncodingException {
		return new String(array, offset, length, charSet);
	}
}

public class Echo {
	private static final int BUFFER_SIZE = 32768;

	static volatile boolean running = false;
	static int delay = 0;

	public static void main(String[] args) throws Exception {
		final ByteArrayQueue baq = new ByteArrayQueue();
		final AudioFormat af = new AudioFormat(44100, 16, 2, true, false);
		final Runnable input = new Runnable() {
			@Override
			public void run() {
				byte[] b = new byte[BUFFER_SIZE];
				TargetDataLine target;
				try {
					target = (TargetDataLine) AudioSystem.getLine(new Info(TargetDataLine.class, af));
					target.open();
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				target.start();
				while (running) {
					int bytesRead = target.read(b, 0, BUFFER_SIZE);
					synchronized (baq) {
						baq.add(b, 0, bytesRead);
					}
				}
				target.stop();
				target.close();
				synchronized (baq) {
					baq.clear();
				}
			}
		};
		final Runnable output = new Runnable() {			
			@Override
			public void run() {
				byte[] b = new byte[BUFFER_SIZE];
				SourceDataLine source;
				try {
					source = (SourceDataLine) AudioSystem.getLine(new Info(SourceDataLine.class, af));
					source.open();
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				source.start();
				while (running) {
					int bytesRead = 0;
					synchronized (baq) {
						if (baq.length() > BUFFER_SIZE * 5 * delay) {
							bytesRead = Math.min(baq.length(), BUFFER_SIZE);
							baq.remove(b, 0, BUFFER_SIZE);
						}
					}
					if (bytesRead == 0) {
						try {
							Thread.sleep(10);
						} catch (InterruptedException e) {/**/}
					} else {
						source.write(b, 0, bytesRead);
					}
				}
				source.stop();
				source.close();
			}
		};

		final JLabel label = new JLabel("Delay 1 Second(s)");

		final JSlider slider = new JSlider(0, 8, 0);
		slider.setSnapToTicks(true);
		slider.addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				delay = slider.getValue();
				label.setText("Delay " + (delay + 1) + " Second(s)");
			}
		});

		final JButton button = new JButton("Start");
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				running = !running;
				if (running) {
					new Thread(input).start();
					new Thread(output).start();
					button.setText("Stop");
				} else {
					button.setText("Start");
				}
				slider.setEnabled(!running);
			}
		});

		JPanel layout = new JPanel();
		layout.setLayout(new BorderLayout());
		layout.add(slider, BorderLayout.WEST);
		layout.add(label, BorderLayout.CENTER);
		layout.add(button, BorderLayout.EAST);

		JPanel panel = new JPanel();
		panel.add(layout);
        final JFrame frame = new JFrame("Echo");
        frame.setResizable(false);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(panel);
		frame.pack();
		frame.setVisible(true);
	}
}