package xqwlight.util.stream;

import java.io.IOException;
import java.io.OutputStream;

public class DupOutputStream extends OutputStream {
	private OutputStream outs[];

	public DupOutputStream(OutputStream... outs) {
		this.outs = outs;
	}

	@Override
	public void write(int b) throws IOException {
		for (OutputStream out : outs) {
			out.write(b);
		}
	}

	@Override
	public void write(byte b[], int off, int len) throws IOException {
		for (OutputStream out : outs) {
			out.write(b, off, len);
		}
	}

	@Override
	public void flush() throws IOException {
		for (OutputStream out : outs) {
			out.flush();
		}
	}

	@Override
	public void close() throws IOException {
		for (OutputStream out : outs) {
			out.close();
		}
	}
}