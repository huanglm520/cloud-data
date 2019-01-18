package cn.net.sunrise.su.runtime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.PassportService;

@Controller
public class AccountGetController extends BaseController {
	
	@Autowired
	private PassportService ps;
	
	@GetMapping("/account")
	public String account_01(HttpSession session) {
		return super.pageName(session, "account");
	}
	
	@GetMapping("/account/view")
	public String account_view(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String uid = request.getParameter("uid");
		if (uid==null || !uid.matches("^[0-9]{1,10}$")) {
			return BaseController.USER_NOT_EXISTS;
		}
		UserBean userBean = new UserBean();
		userBean.setId(Integer.parseInt(uid));
		List<UserBean> list = this.ps.selectUserById(userBean);
		if (list==null || list.isEmpty()) {
			return BaseController.USER_NOT_EXISTS;
		}
		userBean = list.get(0);
		userBean.decode();
		userBean.decodeAccount();
		request.setAttribute(SecurityKey.VIEW_USER.key, userBean);
		return "account-view";
	}
}
