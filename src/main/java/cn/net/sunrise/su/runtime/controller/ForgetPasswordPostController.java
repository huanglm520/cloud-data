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
import cn.net.sunrise.su.tool.VerCode;

@Controller
@RequestMapping(value="/passport/forget-password", method=RequestMethod.POST)
public class ForgetPasswordPostController extends BaseController {
	
	@Autowired
	private PassportService ps;
	
	@RequestMapping(value="/step1/", method=RequestMethod.POST)
	@ResponseBody
	public String forgetPassword_01(@RequestParam("mail") String mail, HttpSession session) {
		if (mail==null || mail.length()==0) {
			return ResultBody.result(PassportKey.ACCOUNT_EMPTY);
		}
		
		// 生成账号主体
		UserBean usb = new UserBean();
		usb.setAccount(mail);
		
		PassportStatusBean psb = this.ps.doForgetPasswordStep1(usb);
		if (psb.getCode() != PassportKey.OK.code) {
			// 查找失败
			return ResultBody.result(psb);
		}
		
		// 将数据写入session
		session.setAttribute(AttributeKey.FORGET_ACCOUNT.key, usb);
		// 写入记录键
		session.setAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key, AttributeKey.ATTRIBUTE_OBJECT);
		
		return ResultBody.result(psb);
	}

	@RequestMapping(value="/step2/", method=RequestMethod.POST)
	@ResponseBody
	public String forgetPassword_03(@RequestParam("vercode") String vercode, HttpSession session) {
		if (vercode==null || vercode.length()==0) {
			return ResultBody.result(PassportKey.VERCODE_EMPTY);
		}
		
		if (!AppCheck.checkVercode(vercode)) {
			return ResultBody.result(PassportKey.VERCODE_NOT_ACCEPT);
		}
		
		// 取得session中的验证码
		String sVercode = (String) session.getAttribute(AttributeKey.FORGET_VERCODE.key);
		if (!vercode.equals(sVercode)) {
			return ResultBody.result(PassportKey.VERCODE_WRONG);
		}
		
		session.setAttribute(AttributeKey.FORGET_PASSWORD_STEP2.key, AttributeKey.ATTRIBUTE_OBJECT);
		
		return ResultBody.result(PassportKey.OK);
	}

	@RequestMapping(value="/step3/", method=RequestMethod.POST)
	@ResponseBody
	public String forgetPassword_05(@RequestParam("password") String password, HttpSession session) {
		
		if (password==null || password.length()==0) {
			return ResultBody.result(PassportKey.PASSWORD_EMPTY);
		}
		
		// 取得session中的user
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.FORGET_ACCOUNT.key);
		
		if (usb == null) {
			return ResultBody.result(PassportKey.INCOMPLETE_INFORMATION);
		}
		
		if (session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key) == null ||
				session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP2.key) == null) {
			return ResultBody.result(PassportKey.INCOMPLETE_INFORMATION);
		}
		
		// 验证通过
		usb.setPassword(password);
		PassportStatusBean psb = this.ps.doForgetPasswordStep3(usb);
		
		return ResultBody.result(psb);
	}
	
	@RequestMapping(value="/vercode/", method=RequestMethod.POST)
	@ResponseBody
	public String register_vercode(HttpSession session) {
		// 判断是否拥有足够的信息
		if (session.getAttribute(AttributeKey.FORGET_PASSWORD_STEP1.key) == null) {
			return ResultBody.result(PassportKey.ACCOUNT_EMPTY);
		}
		////////////////////////////////////////////////
		String code = VerCode.vercode();
		session.setAttribute(AttributeKey.FORGET_VERCODE.key, code);
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.FORGET_ACCOUNT.key);
		Mail mail = Mail.getMail();
		// 发送邮件
		if (mail.send(usb.getAccount(), usb.getLast_name()+usb.getFirst_name(),
				mail.SubjectMessage, mail.ForgetPasswordMessage + code)) {
			return ResultBody.result(PassportKey.OK);
		} else {
			return ResultBody.result(PassportKey.SERVER_EXCEPTION);
		}
	}
}
