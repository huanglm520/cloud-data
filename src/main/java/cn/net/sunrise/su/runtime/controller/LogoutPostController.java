package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;

@Controller
@RequestMapping(value="/passport", method=RequestMethod.POST)
public class LogoutPostController extends BaseController {

	@RequestMapping(value="/logout/", method=RequestMethod.POST)
	@ResponseBody
	public String logout_01(HttpSession session) {
		// 移除session状态
		session.removeAttribute(AttributeKey.IS_LOGIN.key);
		session.removeAttribute(AttributeKey.SESSION_ACCOUNT.key);
		return new Gson().toJson(new PassportStatusBean(PassportKey.OK.code,
				PassportKey.OK.message));
	}
}
