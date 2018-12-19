package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountGetController extends BaseController {
	
	@RequestMapping(value="/account", method=RequestMethod.GET)
	public String account_01(HttpSession session) {
		return super.pageName(session, "account");
	}
}
