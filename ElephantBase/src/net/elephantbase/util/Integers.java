package net.elephantbase.util;

public class Integers {
	public static int parseInt(String s) {
		return parseInt(s, 0);
	}

	public static int parseInt(String s, int i) {
		int n = i;
		try {
			n = Integer.parseInt(s);
		} catch (Exception e) {
			// Ignored
		}
		return n;
	}

	public static int minMax(int min, int mid, int max) {
		return mid < min ? min : mid > max ? max : mid;
	}
}