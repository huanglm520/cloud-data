package cn.net.sunrise.su.runtime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.passport.LoginRecordBean;
import cn.net.sunrise.su.beans.passport.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.PassportService;

@Controller
@RequestMapping(value="/security", method=RequestMethod.GET)
public class SecurityLoginRecordGetController extends BaseController {
	
	@Autowired
	private PassportService ps;

	@GetMapping("/login-record")
	public String record_01(HttpServletRequest request, HttpSession session) {
		// 判断是否登录
		if (!super.checkLogin(session)) {
			return "login-out";
		}
		
		// 检查数据
		Long sTime = null;
		Long eTime = null;
		
		String s = request.getParameter("s");
		String e = request.getParameter("e");
		
		try {
			sTime = Long.valueOf(s);
		} catch (NumberFormatException ex) {
			sTime = null;
		}
		
		try {
			eTime = Long.valueOf(e);
		} catch (NumberFormatException ex) {
			eTime = null;
		}
		
		if (sTime == null || eTime == null) {
			sTime = eTime = null;
		}
		
		if (sTime!=null && eTime!=null) {
			request.setAttribute(SecurityKey.LOGIN_RECORD_START_TIME.key, sTime);
			request.setAttribute(SecurityKey.LOGIN_RECORD_END_TIME.key, eTime);
			LoginRecordTimeBean lrtb = new LoginRecordTimeBean();
			UserBean usb = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
			lrtb.setUid(usb.getId());
			lrtb.setsTime(sTime);
			lrtb.seteTime(eTime);
			List <LoginRecordBean> list = ps.selectLoginRecord(lrtb);
			LoginRecordBean[] beans = new LoginRecordBean[list.size()];
			int len = 0;
			for (LoginRecordBean l : list) {
				beans[len] = l;
				beans[len].decode();
				beans[len].encryptIpAddress();
				len++;
			}
			request.setAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key, new Gson().toJson(beans));
			request.setAttribute(SecurityKey.QUERY_SUCCESS.key, AttributeKey.ATTRIBUTE_OBJECT);
		}
		
		return "login-record";
	}
}
