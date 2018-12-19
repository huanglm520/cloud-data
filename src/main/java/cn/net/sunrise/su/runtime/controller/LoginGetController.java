package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/passport", method=RequestMethod.GET)
public class LoginGetController extends BaseController {
	
	@Override
	protected String pageName(HttpSession session, String name) {
		if (super.checkLogin(session)) {
			return "login2";
		}
		return name;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login_01(HttpSession session) {
		return this.pageName(session, "login");
	}
}
