import xqphd.GBLineInputStream;
import xqphd.PgnFile;

public class Test {
	public static void main(String[] args) {
		GBLineInputStream in = new GBLineInputStream(Test.class.getResourceAsStream("/xqphd/SAMPLE_S.PGN"));
		PgnFile pgn = new PgnFile(in);
	}
}