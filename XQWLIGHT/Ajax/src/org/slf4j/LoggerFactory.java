package org.slf4j;

public class LoggerFactory {
	private static Logger instance = new Logger() {
		public void debug(String s) {
			// Do Nothing
		}

		public void debug(String s, Object o) {
			// Do Nothing
		}

		public void debug(String s, Object o1, Object o2) {
			// Do Nothing
		}

		public void debug(String s, Object[] o) {
			// Do Nothing
		}

		public void debug(String s, Throwable t) {
			// Do Nothing
		}

		public void error(String s) {
			// Do Nothing
		}

		public void error(String s, Object o) {
			// Do Nothing
		}

		public void error(String s, Object o1, Object o2) {
			// Do Nothing
		}

		public void error(String s, Object[] o) {
			// Do Nothing
		}

		public void error(String s, Throwable t) {
			// Do Nothing
		}

		public String getName() {
			return null;
		}

		public void info(String s) {
			// Do Nothing
		}

		public void info(String s, Object o) {
			// Do Nothing
		}

		public void info(String s, Object o1, Object o2) {
			// Do Nothing
		}

		public void info(String s, Object[] o) {
			// Do Nothing
		}

		public void info(String s, Throwable t) {
			// Do Nothing
		}

		public boolean isDebugEnabled() {
			return false;
		}

		public boolean isErrorEnabled() {
			return false;
		}

		public boolean isInfoEnabled() {
			return false;
		}

		public boolean isTraceEnabled() {
			return false;
		}

		public boolean isWarnEnabled() {
			return false;
		}

		public void trace(String s) {
			// Do Nothing
		}

		public void trace(String s, Object o) {
			// Do Nothing
		}

		public void trace(String s, Object o1, Object o2) {
			// Do Nothing
		}

		public void trace(String s, Object[] o) {
			// Do Nothing
		}

		public void trace(String s, Throwable t) {
			// Do Nothing
		}

		public void warn(String s) {
			// Do Nothing
		}

		public void warn(String s, Object o) {
			// Do Nothing
		}

		public void warn(String s, Object[] o) {
			// Do Nothing
		}

		public void warn(String s, Object o1, Object o2) {
			// Do Nothing
		}

		public void warn(String s, Throwable t) {
			// Do Nothing
		}
	};

	/** @param clazz - Unused */
	public static Logger getLogger(Class<?> clazz) {
		return instance;
	}
}