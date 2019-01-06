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
import cn.net.sunrise.su.tool.UserCheck;

@Controller
@RequestMapping(value="/account", method=RequestMethod.POST)
public class AccountPostController extends BaseController {
	
	@Autowired
	private PassportService ps;

	@RequestMapping(value="/change-name/", method=RequestMethod.POST)
	@ResponseBody
	public String changeName_01(@RequestParam("first_name") String firstname,
								@RequestParam("last_name") String lastname,
								HttpSession session) {
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		
		// 校验数据
		if (firstname == null || !UserCheck.checkFirst_Name(firstname)) {
			return ResultBody.result(PassportKey.FIRST_NAME_NOT_ACCEPT);
		}
		if (lastname == null || !UserCheck.checkLast_name(lastname)) {
			return ResultBody.result(PassportKey.LAST_NAME_NOT_ACCEPT);
		}
		// 克隆session对象
		UserBean usb = ((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).clone();
		// 设置更新数据
		usb.setFirst_name(firstname);
		usb.setLast_name(lastname);
		PassportStatusBean psb = this.ps.updateName(usb);
		if (psb.getCode() == PassportKey.OK.code) {
			// 写入成功，刷新session数据
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		}
		return ResultBody.result(psb);
	}
	
	@RequestMapping(value="/change-company/", method=RequestMethod.POST)
	@ResponseBody
	public String changeCompany_01(@RequestParam("company") String company, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		
		if (company == null || !UserCheck.checkCompany(company)) {
			return ResultBody.result(PassportKey.COMPANY_NOT_ACCEPT);
		}
		
		UserBean usb = ((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).clone();
		usb.setCompany(company);
		PassportStatusBean psb = this.ps.updateCompany(usb);
		if (psb.getCode() == PassportKey.OK.code) {
			// 写入成功，刷新session数据
			session.setAttribute(AttributeKey.SESSION_ACCOUNT.key, usb);
		}
		return ResultBody.result(psb);
	}
}
