package xqwlight.util.wicket;

import org.apache.wicket.markup.html.link.Link;

public class OrderLink<E extends Enum<?>> extends Link {
	private static final long serialVersionUID = 1L;

	private E column;
	private OrderSwitch<E> orderSwitch;

	public OrderLink(String id, E column, OrderSwitch<E> orderSwitch) {
		super(id);
		this.column = column;
		this.orderSwitch = orderSwitch;
	}

	@Override
	public void onClick() {
		orderSwitch.setOrder(column);
	}
}