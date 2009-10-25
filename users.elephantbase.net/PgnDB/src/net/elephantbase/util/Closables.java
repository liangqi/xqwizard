package net.elephantbase.util;

import java.io.Closeable;

public class Closables {
	public static void close(Object o) {
		if (o == null) {
			return;
		}
		try {
			if (o instanceof Closeable) {
				((Closeable) o).close();
			} else {
				o.getClass().getMethod("close").invoke(o);
			}
		} catch (Exception e) {
			// Ignored
		}
	}
}