package xqwlight.util.stream;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DupInputStream extends InputStream {
	private InputStream in;
	private OutputStream outs[];

	public DupInputStream(InputStream in, OutputStream... outs) {
		this.in = in;
		this.outs = outs;
	}

	@Override
	public int read() throws IOException {
		int b = in.read();
		if (b != -1) {
			for (OutputStream out : outs) {
				out.write(b);
			}
		}
		return b;
	}

	@Override
	public int read(byte b[], int off, int len) throws IOException {
		int nBytesRead = in.read(b, off, len);
		if (nBytesRead > 0) {
			for (OutputStream out : outs) {
				out.write(b, off, nBytesRead);
			}
		}
		return nBytesRead;
	}

	@Override
	public int available() throws IOException {
		return in.available();
	}

	@Override
	public void close() throws IOException {
		in.close();
		for (OutputStream out : outs) {
			out.close();
		}
	}

	@Override
	public void mark(int readlimit) {
		in.mark(readlimit);
	}

	@Override
	public void reset() throws IOException {
		in.reset();
	}

	@Override
	public boolean markSupported() {
		return in.markSupported();
	}
}