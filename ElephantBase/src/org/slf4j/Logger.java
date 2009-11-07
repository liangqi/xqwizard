package org.slf4j;

public interface Logger {
	String getName();
	boolean isTraceEnabled();
	void trace(String s);
	void trace(String s, Object o);
	void trace(String s, Object o1, Object o2);
	void trace(String s, Object o[]);
	void trace(String s, Throwable t);
	boolean isDebugEnabled();
	void debug(String s);
	void debug(String s, Object o);
	void debug(String s, Object o1, Object o2);
	void debug(String s, Object o[]);
	void debug(String s, Throwable t);
	boolean isInfoEnabled();
	void info(String s);
	void info(String s, Object o);
	void info(String s, Object o1, Object o2);
	void info(String s, Object o[]);
	void info(String s, Throwable t);
	boolean isWarnEnabled();
	void warn(String s);
	void warn(String s, Object o);
	void warn(String s, Object o[]);
	void warn(String s, Object o1, Object o2);
	void warn(String s, Throwable t);
	boolean isErrorEnabled();
	void error(String s);
	void error(String s, Object o);
	void error(String s, Object o1, Object o2);
	void error(String s, Object o[]);
	void error(String s, Throwable t);
}