package net.elephantbase.users.web;

public class ClosePanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public ClosePanel(String title) {
		this(title, DEFAULT_SUFFIX);
	}

	public ClosePanel(String title, String suffix) {
		super(title, suffix, NO_AUTH);
	}
}