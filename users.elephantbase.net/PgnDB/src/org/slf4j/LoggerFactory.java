package org.slf4j;

import java.util.HashMap;

import net.elephantbase.util.LoggerImpl;

public class LoggerFactory {
	private static HashMap<String, Logger> loggerMap = new HashMap<String, Logger>();

	public static synchronized Logger getLogger(String name) {
		Logger logger = loggerMap.get(name);
		if (logger != null) {
			return logger;
		}
		logger = new LoggerImpl(java.util.logging.Logger.getLogger(name));
		loggerMap.put(name, logger);
		return logger;
	}

	public static Logger getLogger(Class<?> clazz) {
		return getLogger(clazz.getClassLoader().toString());
	}
}