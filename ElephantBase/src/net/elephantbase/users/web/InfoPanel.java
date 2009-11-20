package net.elephantbase.users.web;

public class InfoPanel extends BasePanel {
	private static final long serialVersionUID = 1L;

	public InfoPanel() {
		super("用户信息", UsersPage.SUFFIX, NEED_AUTH);
	}
}