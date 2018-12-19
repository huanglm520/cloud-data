package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import cn.net.sunrise.su.enums.AttributeKey;

public class BaseController {
	
	public static final String LOGIN_OUT = "login-out";
	public static final String NO_PRIVILEGE = "no-privilege";

	protected String pageName(HttpSession session, String name) {
		if (!this.checkLogin(session)) {
			return LOGIN_OUT;
		}
		return name;
	}
	
	protected boolean checkLogin(HttpSession session) {
		return session.getAttribute(AttributeKey.IS_LOGIN.key) != null &&
			   session.getAttribute(AttributeKey.SESSION_ACCOUNT.key) != null;
	}
}
