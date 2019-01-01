package cn.net.sunrise.su.runtime.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.PassportService;

@Controller
@RequestMapping(value="/container/manager/privilege", method=RequestMethod.POST)
public class ContainerManagerPrivilegePostController extends BaseController {

	@Autowired
	private PassportService ps;
	@Autowired
	private ContainerService cs;
	
	@RequestMapping(value="/add/search-user/", method=RequestMethod.POST)
	@ResponseBody
	public String search_user_01(@RequestParam("account") String account, HttpSession session) {
		if (!super.checkLogin(session)) {
			return new Gson().toJson(new PassportStatusBean(PassportKey.NOT_LOGIN));
		}
		if (account==null || account.length()==0) {
			return new Gson().toJson(new PassportStatusBean(PassportKey.ACCOUNT_NOT_ACCEPT));
		}
		UserBean userBean = new UserBean();
		userBean.setAccount(account);
		userBean.encodeAccount();
		List<UserBean> list = this.ps.selectUserByAccount(userBean);
		if (list==null || list.isEmpty()) {
			return new Gson().toJson(new PassportStatusBean(PassportKey.ACCOUNT_NOT_EXISTS));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", PassportKey.OK.code);
		map.put("obj", new Gson().toJson(list.get(0)));
		return new Gson().toJson(map);
	}
}
