package net.elephantbase.util;

import java.io.FileInputStream;
import java.util.Properties;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.SimpleFormatter;

import org.slf4j.Logger;

public class LoggerImpl implements Logger {
	static {
		java.util.logging.Logger logger = java.util.logging.Logger.
				getLogger(LoggerImpl.class.getClassLoader().toString());

		try {
			Properties p = new Properties();
			FileInputStream in = new FileInputStream(ClassPath.
					getInstance().append("../etc/Logging.properties"));
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

	java.util.logging.Logger logger;

	public LoggerImpl(java.util.logging.Logger logger) {
		this.logger = logger;
	}

	@Override
	public String getName() {
		return logger.getName();
	}

	@Override
	public boolean isTraceEnabled() {
		return logger.isLoggable(Level.FINE);
	}

	@Override
	public boolean isDebugEnabled() {
		return logger.isLoggable(Level.CONFIG);
	}

	@Override
	public boolean isInfoEnabled() {
		return logger.isLoggable(Level.INFO);
	}

	@Override
	public boolean isWarnEnabled() {
		return logger.isLoggable(Level.WARNING);
	}

	@Override
	public boolean isErrorEnabled() {
		return logger.isLoggable(Level.SEVERE);
	}

	@Override
	public void trace(String s) {
		logger.log(Level.FINE, s);
	}

	@Override
	public void trace(String s, Object o) {
		logger.log(Level.FINE, s, o);
	}

	@Override
	public void trace(String s, Object o1, Object o2) {
		logger.log(Level.FINE, s, new Object[] {o1, o2});
	}

	@Override
	public void trace(String s, Object[] o) {
		logger.log(Level.FINE, s, o);
	}

	@Override
	public void trace(String s, Throwable t) {
		logger.log(Level.FINE, s, t);
	}

	@Override
	public void debug(String s) {
		logger.log(Level.CONFIG, s);
	}

	@Override
	public void debug(String s, Object o) {
		logger.log(Level.CONFIG, s, o);
	}

	@Override
	public void debug(String s, Object o1, Object o2) {
		logger.log(Level.CONFIG, s, new Object[] {o1, o2});
	}

	@Override
	public void debug(String s, Object[] o) {
		logger.log(Level.CONFIG, s, o);
	}

	@Override
	public void debug(String s, Throwable t) {
		logger.log(Level.CONFIG, s, t);
	}

	@Override
	public void info(String s) {
		logger.log(Level.INFO, s);
	}

	@Override
	public void info(String s, Object o) {
		logger.log(Level.INFO, s, o);
	}

	@Override
	public void info(String s, Object o1, Object o2) {
		logger.log(Level.INFO, s, new Object[] {o1, o2});
	}

	@Override
	public void info(String s, Object[] o) {
		logger.log(Level.INFO, s, o);
	}

	@Override
	public void info(String s, Throwable t) {
		logger.log(Level.INFO, s, t);
	}

	@Override
	public void warn(String s) {
		logger.log(Level.WARNING, s);
	}

	@Override
	public void warn(String s, Object o) {
		logger.log(Level.WARNING, s, o);
	}

	@Override
	public void warn(String s, Object o1, Object o2) {
		logger.log(Level.WARNING, s, new Object[] {o1, o2});
	}

	@Override
	public void warn(String s, Object[] o) {
		logger.log(Level.WARNING, s, o);
	}

	@Override
	public void warn(String s, Throwable t) {
		logger.log(Level.WARNING, s, t);
	}

	@Override
	public void error(String s) {
		logger.log(Level.SEVERE, s);
	}

	@Override
	public void error(String s, Object o) {
		logger.log(Level.SEVERE, s, o);
	}

	@Override
	public void error(String s, Object o1, Object o2) {
		logger.log(Level.SEVERE, s, new Object[] {o1, o2});
	}

	@Override
	public void error(String s, Object[] o) {
		logger.log(Level.SEVERE, s, o);
	}

	@Override
	public void error(String s, Throwable t) {
		logger.log(Level.SEVERE, s, t);
	}
}