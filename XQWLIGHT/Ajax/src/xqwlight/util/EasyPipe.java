package xqwlight.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;

public class EasyPipe {
	private static final int LINE_INPUT_MAX_CHAR = 4096;
	private int nReadEnd = 0;
	private InputStream in = null;
	private PrintStream out = null;
	private byte[] buffer = new byte[LINE_INPUT_MAX_CHAR];

	public void open(String strCommand) throws IOException {
		if (strCommand == null) {
			in = System.in;
			out = System.out;
		} else {
			String[] str = {strCommand};
			ProcessBuilder pb = new ProcessBuilder(str);
			pb.redirectErrorStream(true);
			Process p = pb.start();
			in = p.getInputStream();
			out = new PrintStream(p.getOutputStream());
		}
	}

	public void close() throws IOException {
		nReadEnd = 0;
		in.close();
		out.close();
	}

	public void lineOutput(String str) {
		out.println(str);
		out.flush();
	}

	public String lineInput() throws IOException {
		String str = getBuffer();
		if (str == null && in.available() > 0) {
			nReadEnd += in.read(buffer, nReadEnd, LINE_INPUT_MAX_CHAR - nReadEnd);
			str = getBuffer();
			if (str == null && nReadEnd == LINE_INPUT_MAX_CHAR) {
				str = new String(buffer, 0, LINE_INPUT_MAX_CHAR - 1);
				buffer[0] = buffer[LINE_INPUT_MAX_CHAR - 1];
				nReadEnd = 1;
			}
		}
		return str;
	}

	private String getBuffer() {
		String str = null;
		int nFeedEnd;
		for (nFeedEnd = 0; nFeedEnd < nReadEnd; nFeedEnd ++) {
			if (buffer[nFeedEnd] == '\n') {
				break;
			}
		}
		if (nFeedEnd < nReadEnd) {
			str = new String(buffer, 0, nFeedEnd);
			int nStrChr = str.indexOf('\r');
			if (nStrChr >= 0) {
				str = str.substring(0, nStrChr);
			}
			nFeedEnd ++;
			nReadEnd -= nFeedEnd;
			System.arraycopy(buffer, nFeedEnd, buffer, 0, nReadEnd);
		}
		return str;
	}
}