package xqwajax.util;

public interface Orderable<E extends Enum<?>> {
	public void sort(E order, boolean desc);
}