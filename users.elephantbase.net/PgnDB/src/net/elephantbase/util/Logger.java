package net.elephantbase.util;

import java.io.FileInputStream;
import java.util.Properties;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.SimpleFormatter;

public class Logger {
	private static java.util.logging.Logger logger =
			java.util.logging.Logger.getLogger(Logger.class.getClassLoader().toString());

	static {
		try {
			FileInputStream in = new FileInputStream(ClassPath.
					getInstance().append("../etc/Logging.properties"));
			Properties p = new Properties();
			p.load(in);
			in.close();

			String pattern = ClassPath.getInstance().append("../log") +
					"/" + p.getProperty("pattern");
			int limit = Integer.parseInt(p.getProperty("limit"));
			int count = Integer.parseInt(p.getProperty("count"));
			FileHandler handler = new FileHandler(pattern, limit, count, true);
			handler.setFormatter(new SimpleFormatter());

			logger.setLevel(Level.parse(p.getProperty("level")));
			logger.addHandler(handler);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private static StackTraceElement getStackTraceElement() {
		return new Throwable().getStackTrace()[3];
	}

	private static void log(Level l, String s) {
		StackTraceElement ste = getStackTraceElement();
		logger.logp(l, ste.getClassName(), ste.getMethodName(), s);
	}

	private static void log(Level l, String s, Throwable t) {
		StackTraceElement ste = getStackTraceElement();
		logger.logp(l, ste.getClassName(), ste.getMethodName(), s, t);
	}

	public static void info(String s) {
		log(Level.INFO, s);
	}

	public static void info(Throwable t) {
		info("", t);
	}

	public static void info(String s, Throwable t) {
		log(Level.INFO, s, t);
	}

	public static void warning(String s) {
		log(Level.WARNING, s);
	}

	public static void warning(Throwable t) {
		warning("", t);
	}

	public static void warning(String s, Throwable t) {
		log(Level.WARNING, s, t);
	}

	public static void severe(String s) {
		log(Level.SEVERE, s);
	}

	public static void severe(Throwable t) {
		severe("", t);
	}

	public static void severe(String s, Throwable t) {
		log(Level.SEVERE, s, t);
	}
}