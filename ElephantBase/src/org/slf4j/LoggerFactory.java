package org.slf4j;

import java.util.HashMap;
import java.util.logging.Level;

public class LoggerFactory {
	private static HashMap<String, Logger> loggerMap = new HashMap<String, Logger>();

	public static synchronized Logger getLogger(String name) {
		Logger logger = loggerMap.get(name);
		if (logger != null) {
			return logger;
		}
		final java.util.logging.Logger _logger = java.util.logging.Logger.getLogger(name);
		logger = new Logger() {
			private StackTraceElement getStackTraceElement() {
				return new Throwable().getStackTrace()[3];
			}

			private void log(Level l, String s) {
				StackTraceElement ste = getStackTraceElement();
				_logger.logp(l, ste.getClassName(), ste.getMethodName(), s);
			}

			private void log(Level l, String s, Object o) {
				StackTraceElement ste = getStackTraceElement();
				_logger.logp(l, ste.getClassName(), ste.getMethodName(), s, o);
			}

			private void log(Level l, String s, Object[] o) {
				StackTraceElement ste = getStackTraceElement();
				_logger.logp(l, ste.getClassName(), ste.getMethodName(), s, o);
			}

			private void log(Level l, String s, Throwable t) {
				StackTraceElement ste = getStackTraceElement();
				_logger.logp(l, ste.getClassName(), ste.getMethodName(), s, t);
			}

			@Override
			public String getName() {
				return _logger.getName();
			}

			@Override
			public boolean isTraceEnabled() {
				return _logger.isLoggable(Level.FINE);
			}

			@Override
			public boolean isDebugEnabled() {
				return _logger.isLoggable(Level.CONFIG);
			}

			@Override
			public boolean isInfoEnabled() {
				return _logger.isLoggable(Level.INFO);
			}

			@Override
			public boolean isWarnEnabled() {
				return _logger.isLoggable(Level.WARNING);
			}

			@Override
			public boolean isErrorEnabled() {
				return _logger.isLoggable(Level.SEVERE);
			}

			@Override
			public void trace(String s) {
				log(Level.FINE, s);
			}

			@Override
			public void trace(String s, Object o) {
				log(Level.FINE, s, o);
			}

			@Override
			public void trace(String s, Object o1, Object o2) {
				log(Level.FINE, s, new Object[] {o1, o2});
			}

			@Override
			public void trace(String s, Object[] o) {
				log(Level.FINE, s, o);
			}

			@Override
			public void trace(String s, Throwable t) {
				log(Level.FINE, s, t);
			}

			@Override
			public void debug(String s) {
				log(Level.CONFIG, s);
			}

			@Override
			public void debug(String s, Object o) {
				log(Level.CONFIG, s, o);
			}

			@Override
			public void debug(String s, Object o1, Object o2) {
				log(Level.CONFIG, s, new Object[] {o1, o2});
			}

			@Override
			public void debug(String s, Object[] o) {
				log(Level.CONFIG, s, o);
			}

			@Override
			public void debug(String s, Throwable t) {
				log(Level.CONFIG, s, t);
			}

			@Override
			public void info(String s) {
				log(Level.INFO, s);
			}

			@Override
			public void info(String s, Object o) {
				log(Level.INFO, s, o);
			}

			@Override
			public void info(String s, Object o1, Object o2) {
				log(Level.INFO, s, new Object[] {o1, o2});
			}

			@Override
			public void info(String s, Object[] o) {
				log(Level.INFO, s, o);
			}

			@Override
			public void info(String s, Throwable t) {
				log(Level.INFO, s, t);
			}

			@Override
			public void warn(String s) {
				log(Level.WARNING, s);
			}

			@Override
			public void warn(String s, Object o) {
				log(Level.WARNING, s, o);
			}

			@Override
			public void warn(String s, Object o1, Object o2) {
				log(Level.WARNING, s, new Object[] {o1, o2});
			}

			@Override
			public void warn(String s, Object[] o) {
				log(Level.WARNING, s, o);
			}

			@Override
			public void warn(String s, Throwable t) {
				log(Level.WARNING, s, t);
			}

			@Override
			public void error(String s) {
				log(Level.SEVERE, s);
			}

			@Override
			public void error(String s, Object o) {
				log(Level.SEVERE, s, o);
			}

			@Override
			public void error(String s, Object o1, Object o2) {
				log(Level.SEVERE, s, new Object[] {o1, o2});
			}

			@Override
			public void error(String s, Object[] o) {
				log(Level.SEVERE, s, o);
			}

			@Override
			public void error(String s, Throwable t) {
				log(Level.SEVERE, s, t);
			}
		};
		loggerMap.put(name, logger);
		return logger;
	}

	public static Logger getLogger(Class<?> clazz) {
		return getLogger(clazz.getClassLoader().toString());
	}
}