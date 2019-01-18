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
@RequestMapping(value="/passport/register", method=RequestMethod.POST)
public class RegisterPostController extends BaseController {

	@Autowired
	private PassportService ps;

	@PostMapping("/step1/")
	public PassportKey register_step1_01(@RequestParam("mail") String mail,
									@RequestParam("first_name") String first_name,
									@RequestParam("last_name") String last_name,
									@RequestParam("company") String company,
									HttpSession session) {

		// 检查数据
		if (mail==null || mail.length()==0) {
			return PassportKey.ACCOUNT_NOT_ACCEPT;
		}
		
		if (first_name==null || first_name.length()==0) {
			return PassportKey.FIRST_NAME_NOT_ACCEPT;
		}
		
		if (last_name==null || last_name.length()==0) {
			return PassportKey.LAST_NAME_NOT_ACCEPT;
		}
		
		if (company==null || company.length()==0) {
			return PassportKey.COMPANY_NOT_ACCEPT;
		}
		
		// 检查当前会话中是否存在User
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.REGISTER_ACCOUNT.key);
		if (usb == null) {
			// 如果不存在，则创建一个新的对象
			usb = new UserBean();
		}
		
		usb.setAccount(mail);
		usb.setFirst_name(first_name);
		usb.setLast_name(last_name);
		usb.setCompany(company);
		
		// 进入service检查
		PassportKey key = this.ps.doRegisterStep1(usb);
		
		if (key == null) {
			return PassportKey.SERVER_EXCEPTION;
		}
		
		if (key == PassportKey.OK) {
			// 检查通过则将user信息写入session临时保存
			session.setAttribute(AttributeKey.REGISTER_ACCOUNT.key, usb);
			// 同时添加完成记录
			session.setAttribute(AttributeKey.REGISTER_STEP1.key, AttributeKey.ATTRIBUTE_OBJECT);
		}
		
		return key;
	}

	@PostMapping("/step2/")
	public PassportKey register_step2_01(@RequestParam("password") String password, HttpSession session) {
		// 获取session中的user
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.REGISTER_ACCOUNT.key);
		if (usb == null) {
			usb = new UserBean();
		}
		
		if (password==null || password.length()==0) {
			return PassportKey.PASSWORD_NOT_ACCEPT;
		}
		
		usb.setPassword(password);
		
		PassportKey key = this.ps.doRegisterStep2(usb);
		
		// 测试成功，回写session数据
		if (key == PassportKey.OK) {
			session.setAttribute(AttributeKey.REGISTER_ACCOUNT.key, usb);
			// 添加完成记录
			session.setAttribute(AttributeKey.REGISTER_STEP2.key, AttributeKey.ATTRIBUTE_OBJECT);
		}
		
		return key;
	}

	@PostMapping("/step3/")
	public PassportKey register_step3_01(@RequestParam("vercode") String vercode, HttpSession session) {
		// 获取用户输入的验证码
		String uCode = vercode;
		if (uCode==null || uCode.length()==0) {
			return PassportKey.VERCODE_EMPTY;
		}
		
		if (!AppCheck.checkVercode(uCode)) {
			return PassportKey.VERCODE_NOT_ACCEPT;
		}
		
		// 获取session中的验证码
		String sCode = (String) session.getAttribute(AttributeKey.REGISTER_VERCODE.key);
		if (sCode==null || sCode.length()==0 || (!sCode.equals(uCode))) {
			return PassportKey.VERCODE_WRONG;
		}
		
		// 写入标记
		session.setAttribute(AttributeKey.REGISTER_STEP3.key, AttributeKey.ATTRIBUTE_OBJECT);
		
		return PassportKey.OK;
	}
	
	@PostMapping("/step4/")
	public PassportKey register_step4_01(HttpSession session) {
		// 写入数据信息
		if (session.getAttribute(AttributeKey.REGISTER_STEP1.key)!=null &&
			session.getAttribute(AttributeKey.REGISTER_STEP2.key)!=null &&
			session.getAttribute(AttributeKey.REGISTER_STEP3.key)!=null) {
			PassportKey key = this.ps.doRegisterStep4((UserBean) session.getAttribute(AttributeKey.REGISTER_ACCOUNT.key));
			if (key == PassportKey.OK) {
				// 如果操作成功，则此时数据已经写入数据库
				// 清除session中的临时数据
				session.removeAttribute(AttributeKey.REGISTER_VERCODE.key);
				session.removeAttribute(AttributeKey.REGISTER_ACCOUNT.key);
				session.removeAttribute(AttributeKey.REGISTER_STEP1.key);
				session.removeAttribute(AttributeKey.REGISTER_STEP2.key);
				session.removeAttribute(AttributeKey.REGISTER_STEP3.key);
			}
			
			return key;
		} else {
			// 信息不完整
			return PassportKey.INCOMPLETE_INFORMATION;
		}
	}
	
	@PostMapping("/vercode/")
	public PassportKey register_vercode(HttpSession session) {
		// 判断是否拥有足够的信息
		if (session.getAttribute(AttributeKey.REGISTER_STEP1.key) == null) {
			return PassportKey.ACCOUNT_EMPTY;
		}
		////////////////////////////////////////////////
		String code = VerCode.vercode();
		session.setAttribute(AttributeKey.REGISTER_VERCODE.key, code);
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.REGISTER_ACCOUNT.key);
		Mail mail = Mail.getMail();
		// 发送邮件
		if (mail.send(usb.getAccount(), usb.getLast_name()+usb.getFirst_name(),
				mail.SubjectMessage, mail.RegisterMessage + code)) {
			return PassportKey.OK;
		} else {
			return PassportKey.SERVER_EXCEPTION;
		}
	}
}
