import net.elephantbase.util.ClassPath;
import net.elephantbase.util.Integers;
import net.elephantbase.util.server.JettyServer;

public class Startup {
	private static final ClassPath DEFAULT_HOME = ClassPath.getInstance("../../../..");

	public static void main(String[] args) throws Exception {
		int port = (args.length == 0 ? 8080 : Integers.parseInt(args[0], 8080));
		JettyServer server = new JettyServer(DEFAULT_HOME, port);
		server.start();
		server.join();
	}
}