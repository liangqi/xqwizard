package net.elephantbase.util;

import java.io.Serializable;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class EasyDate implements Serializable, Cloneable, Comparable<EasyDate> {
	private static final long serialVersionUID = 1L;

	public static final long SECOND = 1000;
	public static final long MINUTE = SECOND * 60;
	public static final long HOUR = MINUTE * 60;
	public static final long DAY = HOUR * 24;
	public static final long WEEK = DAY * 7;

	private static DateFormat dfDate = DateFormat.getDateInstance(DateFormat.MEDIUM);
	private static DateFormat dfTime = DateFormat.getTimeInstance(DateFormat.MEDIUM);
	private static int timeZoneOffset = TimeZone.getDefault().getRawOffset();

	private static long parseTime(String strTime) {
		try {
			return dfTime.parse(strTime).getTime();
		} catch (Exception e) {
			return -timeZoneOffset;
		}
	}

	private static long parseDate(String strDate) {
		try {
			return dfDate.parse(strDate).getTime();
		} catch (Exception e) {
			return -timeZoneOffset;
		}
	}

	public static int currTimeSec() {
		return (int) (System.currentTimeMillis() / 1000);
	}

	public static String toDateString(long millis) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(millis);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return String.format("%04d-%02d-%02d", Integer.valueOf(year),
				Integer.valueOf(month), Integer.valueOf(day));
	}

	public static String toTimeString(long millis) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(millis);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		return String.format("%02d:%02d:%02d", Integer.valueOf(hour),
				Integer.valueOf(minute), Integer.valueOf(second));
	}

	public static String toString(long millis) {
		return toDateString(millis) + " " + toTimeString(millis);
	}

	public static String toDateStringSec(int sec) {
		return toDateString((long) sec * 1000);
	}

	public static String toTimeStringSec(int sec) {
		return toTimeString((long) sec * 1000);
	}

	public static String toStringSec(int sec) {
		return toString((long) sec * 1000);
	}

	private long time;

	public EasyDate() {
		time = System.currentTimeMillis();
	}

	public EasyDate(long time) {
		this.time = time;
	}

	public EasyDate(Date date) {
		time = date.getTime();
	}

	public EasyDate(String strDate, String strTime) {
		time = parseDate(strDate) + parseTime(strTime) + timeZoneOffset;
	}

	public int getTimeSec() {
		return (int) (time / 1000);
	}

	public long getTime() {
		return time;
	}

	public Date getDate() {
		return new Date(time);
	}

	public String toDateString() {
		return toDateString(time);
	}

	public String toTimeString() {
		return toTimeString(time);
	}

	@Override
	public String toString() {
		return toString(time);
	}

	@Override
	public EasyDate clone() {
		return new EasyDate(time);
	}

	@Override
	public int compareTo(EasyDate o) {
		return time < o.time ? -1 : time > o.time ? 1 : 0;
	}

	public EasyDate add(long timeToAdd) {
		return new EasyDate(time + timeToAdd);
	}

	public EasyDate substract(long timeToSub) {
		return new EasyDate(time - timeToSub);
	}

	public long substract(EasyDate date) {
		return time - date.time;
	}

	public EasyDate nextMidnightPlus(long timeToAdd) {
		long newTime = (time + timeZoneOffset) / DAY * DAY - timeZoneOffset;
		newTime += timeToAdd;
		if (newTime < time) {
			newTime += DAY;
		}
		return new EasyDate(newTime);
	}

	public EasyDate lastMidnight() {
		return nextMidnightPlus(0).substract(DAY);
	}

	public EasyDate nextThursdayMidnightPlus(long timeToAdd) {
		long newTime = (time + timeZoneOffset) / WEEK * WEEK - timeZoneOffset;
		newTime += timeToAdd;
		if (newTime < time) {
			newTime += WEEK;
		}
		return new EasyDate(newTime);
	}
}