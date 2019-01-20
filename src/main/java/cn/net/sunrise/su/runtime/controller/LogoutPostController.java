package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.enums.PassportKey;

@RestController
@RequestMapping(value="/passport", method=RequestMethod.POST)
public class LogoutPostController extends BaseController {

	@PostMapping("/logout/")
	public PassportKey logout_01(HttpSession session) {
		// 移除session状态
		if (session != null) {
			session.invalidate();
		}
		return PassportKey.OK;
	}
}
