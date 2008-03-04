package xqwlight.util.wicket;

import xqwlight.util.Orderable;

public class OrderSwitch<T extends Enum<?>> {
	private Orderable<T> orderable;
	private T order;
	private boolean desc = false;

	public OrderSwitch(Orderable<T> orderable, T order) {
		this.orderable = orderable;
		this.order = order;
	}

	public void setOrder(T order) {
		if (this.order == order) {
			desc = !desc;
		} else {
			this.order = order;
			desc = false;
		}
		orderable.sort(this.order, desc);
	}
}