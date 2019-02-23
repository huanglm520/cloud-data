package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.PassportService;

@RestController
@RequestMapping(value="/passport/login", method=RequestMethod.POST)
public class LoginPostController extends BaseController {
	
	@Autowired
	private PassportService ps;

	@PostMapping("/")
	public PassportKey login_01(@RequestParam("account") String account, 
						   @RequestParam("password") String password,
						   @RequestParam("address") String address,
						   @RequestParam("position") String position,
						   HttpSession session) {
		UserBean usb = new UserBean();
		usb.setAccount(account);
		usb.setPassword(password);
		
		if (StringUtils.isBlank(usb.getAccount())) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		
		if (StringUtils.isBlank(usb.getPassword())) {
			return PassportKey.PASSWORD_EMPTY;
		}
		
		usb.encode();
		usb.encodeAccount();
		
		UserBean sessionUser = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		// 如果session中不存在user，则需要跳过此步
		if (sessionUser == null) {
			// empty
		} else if (!usb.getAccount().equals(sessionUser.getAccount())) {
			// 如果账号不同，则刷新sessionUser
			sessionUser = null;
			session.removeAttribute(AttributeKey.SESSION_ACCOUNT.key);
		}
		// 创建临时存储区
		UserBean[] sessionUserArr = new UserBean[] {sessionUser};
		PassportKey key = this.ps.doLogin(usb, sessionUserArr);
		if (sessionUserArr[0] != null) {
			// 已查询到数据
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, sessionUserArr[0]);
		}
		
		if (key == null) {
			return PassportKey.SERVER_EXCEPTION;
		}
		
		// 如果用户验证通过
		if (key == PassportKey.OK) {

			usb = sessionUserArr[0];
			// 反编译用户信息
			usb.decode();
			usb.decodeAccount();
			// 写入session
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
			
			// 写入登录记录
			LoginRecordBean lrb = new LoginRecordBean();
			lrb.setId(0);
			lrb.setUid(usb.getId());
			lrb.setAddress(StringUtils.isBlank(address) ? "unknown" : address);
			lrb.setTime(System.currentTimeMillis());
			lrb.setPosition(StringUtils.isBlank(position) ? "unknown" : position);
			lrb.encode();
			ps.insertLoginRecord(lrb);
			
			// 设置LOGIN标识
			session.setAttribute(AttributeKey.IS_LOGIN.key, true);
		}
		
		return key;
	}
}
