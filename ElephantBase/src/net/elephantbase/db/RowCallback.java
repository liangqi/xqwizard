package net.elephantbase.db;

public interface RowCallback {
	Object onRow(Object[] row);
}