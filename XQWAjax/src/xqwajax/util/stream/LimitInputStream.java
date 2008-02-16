package xqwajax.util.stream;

import java.io.IOException;
import java.io.InputStream;

public class LimitInputStream extends InputStream {
	private InputStream in;
	private int limit;

	public LimitInputStream(InputStream in, int limit) {
		this.in = in;
		this.limit = limit;
	}

	@Override
	public int read() throws IOException {
		if (limit == 0) {
			return -1;
		}
		int b = in.read();
		if (b < 0) {
			return -1;
		}
		limit --;
		return b;
	}

	@Override
	public int read(byte[] b, int off, int len) throws IOException {
		int bytesRead = in.read(b, off, Math.min(limit, len));
		if (bytesRead > 0) {
			limit -= bytesRead;
		}
		return bytesRead;
	}

	@Override
	public int available() throws IOException {
		return limit;
	}

	@Override
	public void close() throws IOException {
		in.close();
	}
}