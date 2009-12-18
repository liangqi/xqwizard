package xqboss;

import java.io.InputStream;

class LineInputStream {
	private static char[] gbCharTab = new char[32768];
	private static char[] big5CharTab = new char[32768];

	static {
		try {
			Class clazz = new LineInputStream().getClass();
			InputStream in = clazz.getResourceAsStream("GB.DAT");
			for (int i = 0; i < 32768; i ++) {
				gbCharTab[i] = (char) (in.read() << 8 | in.read());
			}
			in.close();
			in = clazz.getResourceAsStream("BIG5.DAT");
			for (int i = 0; i < 32768; i ++) {
				gbCharTab[i] = (char) (in.read() << 8 | in.read());
			}
			in.close();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	private InputStream in;
	private char[] charTab;

	private LineInputStream() {
		// Do Nothing
	}

	LineInputStream(InputStream in, boolean big5) {
		this.in = in;
		charTab = big5 ? big5CharTab : gbCharTab;
	}

	String readLine() {
		StringBuffer sb = new StringBuffer();
		int b;
		try {
			b = in.read();
		} catch (Exception e) {
			return null;
		}
		while (b != -1) {
			if (b == '\n') {
				return sb.toString();
			} else if (b >= 128) {
				int b2;
				try {
					b2 = in.read();
				} catch (Exception e) {
					return null;
				}
				if (b2 == -1) {
					sb.append((char) b);
					break;
				}
				sb.append(charTab[((b - 128) << 8) + b2]);
			} else if (b != '\r') {
				sb.append((char) b);
			}
			try {
				b = in.read();
			} catch (Exception e) {
				return null;
			}
		}
		return sb.length() == 0 ? null : sb.toString();
	}

	void close() {
		try {
			in.close();
		} catch (Exception e) {
			// Ignored
		}
	}
}