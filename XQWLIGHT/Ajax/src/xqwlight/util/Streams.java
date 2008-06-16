package xqwlight.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Streams {
	private static final int BUFFER_SIZE = 2048;

	public static void copy(InputStream in, OutputStream out) throws IOException {
		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = in.read(buffer);
		while (bytesRead > 0) {
			out.write(buffer, 0, bytesRead);
			bytesRead = in.read(buffer);
		}
	}

	public static byte[] read(InputStream in, int len) throws IOException {
		byte[] buffer = new byte[len];
		int bytesRead = 0;
		while (bytesRead < len) {
			int n = in.read(buffer, bytesRead, len - bytesRead);
			if (n > 0) {
				bytesRead += n;
			} else {
				throw new IOException("EOF");
			}
		}
		return buffer;
	}
}