package net.elephantbase.util;

public interface Orderable<E extends Enum<?>> {
	void sort(E order, boolean desc);
}