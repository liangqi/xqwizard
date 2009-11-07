import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

import net.elephantbase.util.EasyDate;

public class Test {
	public static void main(String[] args) throws Exception {
		String url = "http://mirror.elephantbase.net/xqwizard/counter.php";
		// String url = "http://mirror.elephantbase.net:8080/pgndb/test/";
		Random random = new Random();
		System.out.println(url);
		while (true) {
			try {
				long l = System.currentTimeMillis();
				URLConnection conn = new URL(url + "?random=" + random.nextInt()).openConnection();
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String s = in.readLine();				
				in.close();
				System.out.println(new EasyDate() + " -> " + s + " [" + (System.currentTimeMillis() - l) + "ms]");
			} catch (Exception e) {
				e.printStackTrace();
			}
			Thread.sleep(60000);
		}
	}
}
