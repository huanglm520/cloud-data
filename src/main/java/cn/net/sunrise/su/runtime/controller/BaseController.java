package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import cn.net.sunrise.su.enums.AttributeKey;

public class BaseController {
	
	public static final String LOGIN_OUT = "login-out";
	public static final String NO_PRIVILEGE = "no-privilege";
	public static final String NOT_OWNER = "not-owner";
	public static final String NO_CHANGE = "no-change";
	public static final String USER_NOT_EXISTS = "user-not-exists";
	public static final String OWNER_NOT_DELETE = "owner-not-delete";

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
