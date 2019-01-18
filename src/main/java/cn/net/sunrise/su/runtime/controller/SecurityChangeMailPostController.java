package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

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
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.Mail;
import cn.net.sunrise.su.tool.UserCheck;
import cn.net.sunrise.su.tool.VerCode;

@RestController
@RequestMapping(value="/security", method=RequestMethod.POST)
public class SecurityChangeMailPostController extends BaseController {
	
	@Autowired
	private PassportService ps;
	
	@PostMapping("/change-mail/")
	public PassportKey changeMain_01(HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		return PassportKey.OK;
	}

	@PostMapping("/change-mail/step1/")
	public PassportKey changeMail_03(@RequestParam("mail") String mail,
								@RequestParam("vercode") String vercode,
								HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (vercode==null || vercode.length()==0) {
			return PassportKey.VERCODE_EMPTY;
		}
		if (!AppCheck.checkVercode(vercode)) {
			return PassportKey.VERCODE_NOT_ACCEPT;
		}
		// 取得session中的user并校验数据
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.CHANGE_MAIL_NEW_MAIL.key);
		if (usb==null || usb.getAccount()==null) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		if (!usb.getAccount().equals(mail)) {
			return PassportKey.ACCOUNT_NOT_ACCEPT;
		}
		// 写入数据
		PassportKey key = this.ps.doChangeMailStep2(usb);
		if (key != PassportKey.OK) {
			return key;
		}
		// 移除标记并重新设置sessionuser
		session.removeAttribute(AttributeKey.CHANGE_MAIL_NEW_MAIL.key);
		session.removeAttribute(AttributeKey.CHANGE_MAIL_VERCODE.key);
		session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		return key;
	}

	
	@PostMapping("/change-mail/vercode/")
	public PassportKey register_vercode(@RequestParam("mail") String mailStr, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		// 判断数据合法性
		if (mailStr==null || mailStr.length()==0) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		if (!UserCheck.checkAccount(mailStr)) {
			return PassportKey.ACCOUNT_NOT_ACCEPT;
		}
		// 生成副本对象
		UserBean usb = ((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).clone();
		usb.setAccount(mailStr);
		// 判断用户是否存在
		PassportKey key = this.ps.doChangeMailStep1(usb);
		if (key != PassportKey.OK) {
			return key;
		}
		////////////////////////////////////////////////
		String code = VerCode.vercode();
		Mail mail = Mail.getMail();
		// 发送邮件
		if (mail.send(usb.getAccount(), usb.getLast_name()+usb.getFirst_name(),
				mail.SubjectMessage, mail.RegisterMessage + code)) {
			// 写入副本对象和验证码
			session.setAttribute(AttributeKey.CHANGE_MAIL_NEW_MAIL.key, usb);
			session.setAttribute(AttributeKey.CHANGE_MAIL_VERCODE.key, code);
			return PassportKey.OK;
		} else {
			return PassportKey.SERVER_EXCEPTION;
		}
	}
}
