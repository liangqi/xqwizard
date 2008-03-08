package xqwlight.util;

import java.text.DateFormat;
import java.util.Date;
import java.util.TimeZone;

public class EasyDate extends Date {
	private static final long serialVersionUID = 1L;

	private static final long ONE_DAY_TIME = 86400000L;

	private static DateFormat dfDate = DateFormat.getDateInstance(DateFormat.MEDIUM);
	private static DateFormat dfTime = DateFormat.getTimeInstance(DateFormat.MEDIUM);
	private static long timeZoneOffset = -TimeZone.getDefault().getRawOffset();

	private static long parseTime(String strTime) {
		try {
			return dfTime.parse(strTime).getTime();
		} catch (Exception e) {
			return timeZoneOffset;
		}
	}

	private static long parseDate(String strDate) {
		try {
			return dfDate.parse(strDate).getTime();
		} catch (Exception e) {
			return timeZoneOffset;
		}
	}

	public EasyDate() {
		super();
	}

	public EasyDate(long date) {
		super(date);
	}

	public EasyDate(Date date) {
		super(date.getTime());
	}

	public EasyDate(String strDate, String strTime) {
		super(parseDate(strDate) + parseTime(strTime) - timeZoneOffset);
	}

	@Override
	public EasyDate clone() {
		return new EasyDate((Date) super.clone());
	}

	public String toDateString() {
		return dfDate.format(this);
	}

	public String toTimeString() {
		return dfTime.format(this);
	}

	public EasyDate add(long time) {
		return new EasyDate(getTime() + time);
	}

	public EasyDate substract(long time) {
		return new EasyDate(getTime() - time);
	}

	public long substract(EasyDate date) {
		return getTime() - date.getTime();
	}

	public EasyDate addDays(int days) {
		return add(ONE_DAY_TIME * days);
	}

	public EasyDate substractDays(int days) {
		return substract(ONE_DAY_TIME * days);
	}

	public int substractDays(EasyDate date) {
		return (int) (substract(date) / ONE_DAY_TIME);
	}

	public EasyDate lastMidnight() {
		return new EasyDate((getTime() - timeZoneOffset) / ONE_DAY_TIME * ONE_DAY_TIME + timeZoneOffset);
	}

	public EasyDate nextMidnight() {
		return lastMidnight().addDays(1);
	}
}