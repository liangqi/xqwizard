package net.elephantbase.users.web;

public class GetPasswordPanel2 extends BasePanel {
	private static final long serialVersionUID = 1L;

	public GetPasswordPanel2() {
		super("找回密码", UsersPage.SUFFIX, NO_AUTH);
		setInfo("找回密码的方法已经通过Email发送到您的信箱中");
	}
}