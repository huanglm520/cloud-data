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
import cn.net.sunrise.su.tool.VerCode;

@RestController
@RequestMapping(value="/passport/forget-password", method=RequestMethod.POST)
public class ForgetPasswordPostController extends BaseController {
	
	@Autowired
	private PassportService ps;
	
	@PostMapping("/step1/")
	public PassportKey forgetPassword_01(@RequestParam("mail") String mail, HttpSession session) {
		if (mail==null || mail.length()==0) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		
		// 生成账号主体
		UserBean usb = new UserBean();
		usb.setAccount(mail);
		
		PassportKey key = this.ps.doForgetPasswordStep1(usb);
		if (key != PassportKey.OK) {
			// 查找失败
			return key;
		}
		
		// 将数据写入session
		session.setAttribute(AttributeKey.FORGET_ACCOUNT.key, usb);
		// 写入记录键
		session.setAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key, AttributeKey.ATTRIBUTE_OBJECT);
		
		return key;
	}

	@PostMapping("/step2/")
	public PassportKey forgetPassword_03(@RequestParam("vercode") String vercode, HttpSession session) {
		if (vercode==null || vercode.length()==0) {
			return PassportKey.VERCODE_EMPTY;
		}
		
		if (!AppCheck.checkVercode(vercode)) {
			return PassportKey.VERCODE_NOT_ACCEPT;
		}
		
		// 取得session中的验证码
		String sVercode = (String) session.getAttribute(AttributeKey.FORGET_VERCODE.key);
		if (!vercode.equals(sVercode)) {
			return PassportKey.VERCODE_WRONG;
		}
		
		session.setAttribute(AttributeKey.FORGET_PASSWORD_STEP2.key, AttributeKey.ATTRIBUTE_OBJECT);
		
		return PassportKey.OK;
	}

	@PostMapping("/step3/")
	public PassportKey forgetPassword_05(@RequestParam("password") String password, HttpSession session) {
		
		if (password==null || password.length()==0) {
			return PassportKey.PASSWORD_EMPTY;
		}
		
		// 取得session中的user
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.FORGET_ACCOUNT.key);
		
		if (usb == null) {
			return PassportKey.INCOMPLETE_INFORMATION;
		}
		
		if (session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key) == null ||
				session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP2.key) == null) {
			return PassportKey.INCOMPLETE_INFORMATION;
		}
		
		// 验证通过
		usb.setPassword(password);
		PassportKey key = this.ps.doForgetPasswordStep3(usb);
		
		return key;
	}
	
	@PostMapping("/vercode/")
	public PassportKey register_vercode(HttpSession session) {
		// 判断是否拥有足够的信息
		if (session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key) == null) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		////////////////////////////////////////////////
		String code = VerCode.vercode();
		session.setAttribute(AttributeKey.FORGET_VERCODE.key, code);
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.FORGET_ACCOUNT.key);
		Mail mail = Mail.getMail();
		// 发送邮件
		if (mail.send(usb.getAccount(), usb.getLast_name()+usb.getFirst_name(),
				mail.SubjectMessage, mail.ForgetPasswordMessage + code)) {
			return PassportKey.OK;
		} else {
			return PassportKey.SERVER_EXCEPTION;
		}
	}
}
