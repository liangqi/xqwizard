import java.io.File;

import xqwlight.util.ClassPath;
import xqwlight.util.server.JettyServer;

public class Startup {
	private static final File DEFAULT_HOME = ClassPath.getInstance("../../../..");

	public static void main(String[] args) throws Exception {
		int port = 80;
		if (args.length > 0) {
			try {
				port = Integer.parseInt(args[0]);
			} catch (Exception e) {
				// Ignored if "port" cannot be parsed
			}
		}
		JettyServer server = new JettyServer(DEFAULT_HOME, port);
		server.start();
		server.join();
	}
}