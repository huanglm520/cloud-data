package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.tool.ResultBody;

@Controller
@RequestMapping(value="/passport", method=RequestMethod.POST)
public class LogoutPostController extends BaseController {

	@RequestMapping(value="/logout/", method=RequestMethod.POST)
	@ResponseBody
	public String logout_01(HttpSession session) {
		// 移除session状态
		session.invalidate();
		return ResultBody.result(PassportKey.OK);
	}
}
