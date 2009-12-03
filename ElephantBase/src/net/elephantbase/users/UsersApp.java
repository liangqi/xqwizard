package net.elephantbase.users;

import java.util.Timer;

import net.elephantbase.users.biz.BaseSession;
import net.elephantbase.users.biz.DailyTask;
import net.elephantbase.users.web.UsersPage;
import net.elephantbase.util.EasyDate;
import net.elephantbase.util.Logger;

import org.apache.wicket.Request;
import org.apache.wicket.Response;
import org.apache.wicket.Session;
import org.apache.wicket.protocol.http.WebApplication;

public class UsersApp extends WebApplication {
	private Timer timer;

	@Override
	public Class<? extends UsersPage> getHomePage() {
		return UsersPage.class;
	}

	@Override
	protected void init() {
		getApplicationSettings().setPageExpiredErrorPage(UsersPage.class);
		timer = new Timer();
		// Do DailyTask at 4:00 everyday
		timer.scheduleAtFixedRate(new DailyTask(), new EasyDate().
				nextMidnightPlus(EasyDate.HOUR * 4).getDate(), EasyDate.DAY);
	}

	@Override
	protected void onDestroy() {
		timer.cancel();
		Logger.close();
	}

	@Override
	public Session newSession(Request request, Response response) {
		return new BaseSession(request);
	}
}