package net.elephantbase.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Row {
	public static final Row ERROR = new Row(), EMPTY = new Row();

	private Object[] data;

	private Row() {
		//
	}

	public Row(ResultSet rs, int columns) throws SQLException {
		data = new Object[columns];
		for (int i = 0; i < columns; i ++) {
			data[i] = rs.getObject(i + 1);
		}
	}

	public boolean error() {
		return this == ERROR;
	}

	public boolean empty() {
		return this == EMPTY;
	}

	public boolean valid() {
		return !error() && !empty();
	}

	public Object get(int column) {
		return data[column - 1];
	}

	public int getInt(int column, int defaultValue) {
		return valid() ? getInt(column) : defaultValue;
	}

	public int getInt(int column) {
		Number n = (Number) get(column);
		return n == null ? 0 : n.intValue();
	}

	public String getString(int column, String defaultValue) {
		return valid() ? getString(column) : defaultValue;
	}

	public String getString(int column) {
		return (String) get(column);
	}
}