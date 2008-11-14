package xqwlight;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class LineInputStream {
	private InputStream in;

	public LineInputStream(InputStream in) {
		this.in = in;
	}

	public String readLine() throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int b = in.read();
		while (b != -1) {
			if (b == '\n') {
				return baos.toString();
			} else if (b != '\r') {
				baos.write(b);
			}
			b = in.read();
		}
		return baos.size() == 0 ? null : baos.toString();
	}

	public void close() throws IOException {
		in.close();
	}
}