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
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.Mail;
import cn.net.sunrise.su.tool.ResultBody;
import cn.net.sunrise.su.tool.UserCheck;
import cn.net.sunrise.su.tool.VerCode;

@Controller
@RequestMapping(value="/security", method=RequestMethod.POST)
public class SecurityChangeMailPostController extends BaseController {
	
	@Autowired
	private PassportService ps;
	
	@RequestMapping(value="/change-mail/", method=RequestMethod.POST)
	@ResponseBody
	public String changeMain_01(HttpSession session) {
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		return ResultBody.result(PassportKey.OK);
	}

	@RequestMapping(value="/change-mail/step1/", method=RequestMethod.POST)
	@ResponseBody
	public String changeMail_03(@RequestParam("mail") String mail,
								@RequestParam("vercode") String vercode,
								HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		
		if (vercode==null || vercode.length()==0) {
			return ResultBody.result(PassportKey.VERCODE_EMPTY);
		}
		if (!AppCheck.checkVercode(vercode)) {
			return ResultBody.result(PassportKey.VERCODE_NOT_ACCEPT);
		}
		// 取得session中的user并校验数据
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.CHANGE_MAIL_NEW_MAIL.key);
		if (usb==null || usb.getAccount()==null) {
			return ResultBody.result(PassportKey.ACCOUNT_EMPTY);
		}
		if (!usb.getAccount().equals(mail)) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_ACCEPT);
		}
		// 写入数据
		PassportStatusBean psb = this.ps.doChangeMailStep2(usb);
		if (psb.getCode() != PassportKey.OK.code) {
			return ResultBody.result(psb);
		}
		// 移除标记并重新设置sessionuser
		session.removeAttribute(AttributeKey.CHANGE_MAIL_NEW_MAIL.key);
		session.removeAttribute(AttributeKey.CHANGE_MAIL_VERCODE.key);
		session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		return ResultBody.result(psb);
	}

	
	@RequestMapping(value="/change-mail/vercode/", method=RequestMethod.POST)
	@ResponseBody
	public String register_vercode(@RequestParam("mail") String mailStr, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		
		// 判断数据合法性
		if (mailStr==null || mailStr.length()==0) {
			return ResultBody.result(PassportKey.ACCOUNT_EMPTY);
		}
		if (!UserCheck.checkAccount(mailStr)) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_ACCEPT);
		}
		// 生成副本对象
		UserBean usb = new UserBean((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key));
		usb.setAccount(mailStr);
		// 判断用户是否存在
		PassportStatusBean psb = this.ps.doChangeMailStep1(usb);
		if (psb.getCode() != PassportKey.OK.code) {
			return ResultBody.result(psb);
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
			return ResultBody.result(PassportKey.OK);
		} else {
			return ResultBody.result(PassportKey.SERVER_EXCEPTION);
		}
	}
}
