package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.PassportService;

@RestController
@RequestMapping(value="/security", method=RequestMethod.POST)
public class SecurityChangePasswordPostController extends BaseController {

	@Autowired
	private PassportService ps;
	
	@PostMapping("/change-password/")
	public PassportKey changePassword_01(HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		return PassportKey.OK;
	}
	
	@PostMapping("/change-password/step1/")
	public PassportKey changePassword_02(@RequestParam("oldpass") String oldPassword,
									@RequestParam("newpass") String newPassword,
									HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword)) {
			return PassportKey.PASSWORD_EMPTY;
		}
		// 获取session中的user
		UserBean sessionUser = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		// 复制user信息，生成验证对象
		UserBean usb = sessionUser.clone();
		// 验证旧密码
		usb.setPassword(oldPassword);
		usb.encodePassword();
		if (!sessionUser.getPassword().equals(usb.getPassword())) {
			return PassportKey.PASSWORD_WRONG;
		}
		
		// 设置新密码
		usb.setPassword(newPassword);
		PassportKey key = this.ps.doChangePasswordStep1(usb);
		if (key == PassportKey.OK) {
			sessionUser.setPassword(usb.getPassword());
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, sessionUser);
		}
		return key;
	}
}
