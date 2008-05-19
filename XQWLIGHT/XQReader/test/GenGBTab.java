import java.io.FileOutputStream;

public class GenGBTab {
	public static void main(String[] args) throws Exception {
		FileOutputStream fos = new FileOutputStream("GB.DAT");
		byte[] b = new byte[2];
		for (int i = 128; i < 256; i ++) {
			b[0] = (byte) i;
			for (int j = 0; j < 256; j ++) {
				b[1] = (byte) j;
				char c = new String(b).charAt(0);
				fos.write((c >>> 8) & 0xff);
				fos.write(c & 0xff);
			}
		}
		fos.close();
	}
}