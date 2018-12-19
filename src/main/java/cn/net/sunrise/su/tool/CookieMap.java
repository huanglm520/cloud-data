package cn.net.sunrise.su.tool;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieMap {
	
	private Map<String, Cookie> cookies;
	
	private CookieMap() {
		this.cookies = new HashMap<>();
	}
	
	public static CookieMap loadCookies(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			CookieMap cookieMap = new CookieMap();
			for (Cookie ck : cookie) {
				cookieMap.cookies.put(ck.getName(), ck);
			}
			return cookieMap;
		}
		return null;
	}
	
	public Cookie getCookie(String name) {
		return this.cookies.get(name);
	}
}
