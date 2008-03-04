package xqwajax.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Streams {
	private static final int BUFFER_SIZE = 8192;

	public static void copy(InputStream in, OutputStream out) throws IOException {
		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = in.read(buffer);
		while (bytesRead > 0) {
			out.write(buffer, 0, bytesRead);
			bytesRead = in.read(buffer);
		}
	}
}