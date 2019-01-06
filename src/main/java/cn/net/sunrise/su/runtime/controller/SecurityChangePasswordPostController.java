package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.PassportService;
import cn.net.sunrise.su.tool.ResultBody;

@Controller
@RequestMapping(value="/security", method=RequestMethod.POST)
public class SecurityChangePasswordPostController extends BaseController {

	@Autowired
	private PassportService ps;
	
	@RequestMapping(value="/change-password/", method=RequestMethod.POST)
	@ResponseBody
	public String changeMain_01(HttpSession session) {
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		return ResultBody.result(PassportKey.OK);
	}
	
	@RequestMapping(value="/change-password/step1/", method=RequestMethod.POST)
	@ResponseBody
	public String changePassword_02(@RequestParam("oldpass") String oldPassword,
									@RequestParam("newpass") String newPassword,
									HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		
		if (oldPassword==null || oldPassword.length()==0 || newPassword==null || newPassword.length()==0) {
			return ResultBody.result(PassportKey.PASSWORD_EMPTY);
		}
		// 获取session中的user
		UserBean sessionUser = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		// 复制user信息，生成验证对象
		UserBean usb = sessionUser.clone();
		// 验证旧密码
		usb.setPassword(oldPassword);
		usb.encodePassword();
		if (!sessionUser.getPassword().equals(usb.getPassword())) {
			return ResultBody.result(PassportKey.PASSWORD_WRONG);
		}
		
		// 设置新密码
		usb.setPassword(newPassword);
		PassportStatusBean psb = this.ps.doChangePasswordStep1(usb);
		if (psb.getCode() == PassportKey.OK.code) {
			sessionUser.setPassword(usb.getPassword());
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, sessionUser);
		}
		return ResultBody.result(psb);
	}
}
