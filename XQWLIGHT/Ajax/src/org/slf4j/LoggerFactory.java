package org.slf4j;

import java.util.HashMap;
import java.util.logging.Level;

public class LoggerFactory {
	private static HashMap<String, Logger> loggerMap = new HashMap<String, Logger>();

	public static Logger getLogger(Class<?> clazz) {
		String name = clazz.getClassLoader().toString();
		Logger logger = loggerMap.get(name);
		if (logger != null) {
			return logger;
		}
		final java.util.logging.Logger _logger = java.util.logging.Logger.getLogger(name);
		logger = new Logger() {
			public String getName() {
				return _logger.getName();
			}

			public boolean isTraceEnabled() {
				return _logger.isLoggable(Level.FINE);
			}

			public boolean isDebugEnabled() {
				return _logger.isLoggable(Level.CONFIG);
			}

			public boolean isInfoEnabled() {
				return _logger.isLoggable(Level.INFO);
			}

			public boolean isWarnEnabled() {
				return _logger.isLoggable(Level.WARNING);
			}

			public boolean isErrorEnabled() {
				return _logger.isLoggable(Level.SEVERE);
			}

			public void trace(String s) {
				_logger.log(Level.FINE, s);
			}

			public void trace(String s, Object o) {
				_logger.log(Level.FINE, s, o);
			}

			public void trace(String s, Object o1, Object o2) {
				_logger.log(Level.FINE, s, new Object[] {o1, o2});
			}

			public void trace(String s, Object[] o) {
				_logger.log(Level.FINE, s, o);
			}

			public void trace(String s, Throwable t) {
				_logger.log(Level.FINE, s, t);
			}

			public void debug(String s) {
				_logger.log(Level.CONFIG, s);
			}

			public void debug(String s, Object o) {
				_logger.log(Level.CONFIG, s, o);
			}

			public void debug(String s, Object o1, Object o2) {
				_logger.log(Level.CONFIG, s, new Object[] {o1, o2});
			}

			public void debug(String s, Object[] o) {
				_logger.log(Level.CONFIG, s, o);
			}

			public void debug(String s, Throwable t) {
				_logger.log(Level.CONFIG, s, t);
			}

			public void info(String s) {
				_logger.log(Level.INFO, s);
			}

			public void info(String s, Object o) {
				_logger.log(Level.INFO, s, o);
			}

			public void info(String s, Object o1, Object o2) {
				_logger.log(Level.INFO, s, new Object[] {o1, o2});
			}

			public void info(String s, Object[] o) {
				_logger.log(Level.INFO, s, o);
			}

			public void info(String s, Throwable t) {
				_logger.log(Level.INFO, s, t);
			}

			public void warn(String s) {
				_logger.log(Level.WARNING, s);
			}

			public void warn(String s, Object o) {
				_logger.log(Level.WARNING, s, o);
			}

			public void warn(String s, Object o1, Object o2) {
				_logger.log(Level.WARNING, s, new Object[] {o1, o2});
			}

			public void warn(String s, Object[] o) {
				_logger.log(Level.WARNING, s, o);
			}

			public void warn(String s, Throwable t) {
				_logger.log(Level.WARNING, s, t);
			}

			public void error(String s) {
				_logger.log(Level.SEVERE, s);
			}

			public void error(String s, Object o) {
				_logger.log(Level.SEVERE, s, o);
			}

			public void error(String s, Object o1, Object o2) {
				_logger.log(Level.SEVERE, s, new Object[] {o1, o2});
			}

			public void error(String s, Object[] o) {
				_logger.log(Level.SEVERE, s, o);
			}

			public void error(String s, Throwable t) {
				_logger.log(Level.SEVERE, s, t);
			}
		};
		loggerMap.put(name, logger);
		return logger;
	}
}