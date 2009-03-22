package org.slf4j;

import java.util.logging.Level;

public class LoggerFactory {
	static java.util.logging.Logger log = java.util.logging.Logger.getAnonymousLogger();

	private static Logger instance = new Logger() {
		public String getName() {
			return null;
		}

		public boolean isTraceEnabled() {
			return true;
		}

		public boolean isDebugEnabled() {
			return true;
		}

		public boolean isInfoEnabled() {
			return true;
		}

		public boolean isWarnEnabled() {
			return true;
		}

		public boolean isErrorEnabled() {
			return true;
		}

		public void trace(String s) {
			log.log(Level.FINE, s);
		}

		public void trace(String s, Object o) {
			log.log(Level.FINE, s, o);
		}

		public void trace(String s, Object o1, Object o2) {
			log.log(Level.FINE, s, new Object[] {o1, o2});
		}

		public void trace(String s, Object[] o) {
			log.log(Level.FINE, s, o);
		}

		public void trace(String s, Throwable t) {
			log.log(Level.FINE, s, t);
		}

		public void debug(String s) {
			log.log(Level.CONFIG, s);
		}

		public void debug(String s, Object o) {
			log.log(Level.CONFIG, s, o);
		}

		public void debug(String s, Object o1, Object o2) {
			log.log(Level.CONFIG, s, new Object[] {o1, o2});
		}

		public void debug(String s, Object[] o) {
			log.log(Level.CONFIG, s, o);
		}

		public void debug(String s, Throwable t) {
			log.log(Level.CONFIG, s, t);
		}

		public void info(String s) {
			log.log(Level.INFO, s);
		}

		public void info(String s, Object o) {
			log.log(Level.INFO, s, o);
		}

		public void info(String s, Object o1, Object o2) {
			log.log(Level.INFO, s, new Object[] {o1, o2});
		}

		public void info(String s, Object[] o) {
			log.log(Level.INFO, s, o);
		}

		public void info(String s, Throwable t) {
			log.log(Level.INFO, s, t);
		}

		public void warn(String s) {
			log.log(Level.WARNING, s);
		}

		public void warn(String s, Object o) {
			log.log(Level.WARNING, s, o);
		}

		public void warn(String s, Object o1, Object o2) {
			log.log(Level.WARNING, s, new Object[] {o1, o2});
		}

		public void warn(String s, Object[] o) {
			log.log(Level.WARNING, s, o);
		}

		public void warn(String s, Throwable t) {
			log.log(Level.WARNING, s, t);
		}

		public void error(String s) {
			log.log(Level.SEVERE, s);
		}

		public void error(String s, Object o) {
			log.log(Level.SEVERE, s, o);
		}

		public void error(String s, Object o1, Object o2) {
			log.log(Level.SEVERE, s, new Object[] {o1, o2});
		}

		public void error(String s, Object[] o) {
			log.log(Level.SEVERE, s, o);
		}

		public void error(String s, Throwable t) {
			log.log(Level.SEVERE, s, t);
		}
	};

	/** @param clazz - Unused */
	public static Logger getLogger(Class<?> clazz) {
		return instance;
	}
}