package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.net.sunrise.su.enums.AttributeKey;

@Controller
@RequestMapping(value="/security/change-mail", method=RequestMethod.GET)
public class SecurityChangeMailGetController extends BaseController {
	
	@Override
	protected String pageName(HttpSession session, String name) {
		if (session.getAttribute(AttributeKey.IS_LOGIN.key)==null ||
			session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)==null) {
			return "not-login";
		}
		return name;
	}
	
	@GetMapping("/step1")
	public String changeMail_01(HttpSession session) {
		return this.pageName(session, "change-mail-step1");
	}
	
}
