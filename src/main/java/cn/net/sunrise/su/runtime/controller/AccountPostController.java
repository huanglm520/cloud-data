package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.runtime.check.UserCheck;
import cn.net.sunrise.su.service.PassportService;

@RestController
@RequestMapping(value="/account", method=RequestMethod.POST)
public class AccountPostController extends BaseController {
	
	@Autowired
	private PassportService ps;

	@PostMapping("/change-name/")
	public PassportKey changeName_01(@RequestParam("first_name") String firstname,
								@RequestParam("last_name") String lastname,
								HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		// 校验数据
		if (StringUtils.isBlank(firstname) || !UserCheck.checkFirstName(firstname)) {
			return PassportKey.FIRST_NAME_NOT_ACCEPT;
		}
		if (StringUtils.isBlank(lastname) || !UserCheck.checkLastName(lastname)) {
			return PassportKey.LAST_NAME_NOT_ACCEPT;
		}
		// 克隆session对象
		UserBean usb = ((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).clone();
		// 设置更新数据
		usb.setFirst_name(firstname);
		usb.setLast_name(lastname);
		PassportKey key = this.ps.updateName(usb);
		if (key == PassportKey.OK) {
			// 写入成功，刷新session数据
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		}
		return key;
	}
	
	@PostMapping("/change-company/")
	public PassportKey changeCompany_01(@RequestParam("company") String company, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (StringUtils.isBlank(company) || !UserCheck.checkCompany(company)) {
			return PassportKey.COMPANY_NOT_ACCEPT;
		}
		
		UserBean usb = ((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).clone();
		usb.setCompany(company);
		PassportKey key = this.ps.updateCompany(usb);
		if (key == PassportKey.OK) {
			// 写入成功，刷新session数据
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		}
		return key;
	}
}
