package cn.net.sunrise.su.runtime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.PassportService;

@Controller
public class SecurityGetController extends BaseController {

	@Autowired
	private PassportService ps;
	
	@GetMapping("/security")
	public String security_01(HttpSession session, HttpServletRequest request) {
		// 判断是否登录
		if (session.getAttribute(AttributeKey.IS_LOGIN.key) == null ||
			session.getAttribute(AttributeKey.SESSION_ACCOUNT.key) == null) {
			return "login-out";
		}
		// 如果已登录
		// 获取session中的user
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		// 查询登录记录
		LoginRecordTimeBean lrtb = new LoginRecordTimeBean();
		lrtb.setUid(usb.getId());
		lrtb.setLeft(0);
		lrtb.setRight(10);
		List <LoginRecordBean> list = ps.selectLoginRecordLimit(lrtb);
		LoginRecordBean[] beans = new LoginRecordBean[list.size()];
		int len = 0;
		for (LoginRecordBean l : list) {
			beans[len] = l;
			beans[len].decode();
			beans[len].encryptIpAddress();
			len++;
		}
		request.setAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key, new Gson().toJson(beans));
		return "security";
	}
}
