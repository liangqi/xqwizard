package net.elephantbase.util;

import java.io.FileInputStream;
import java.util.Properties;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggerFactory {
	private static Logger logger = getLogger(LoggerFactory.class);

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

	public static Logger getLogger(Class<?> clazz) {
		return Logger.getLogger(clazz.getClassLoader().toString());		
	}

	public static Logger getLogger() {
		return logger;
	}
}