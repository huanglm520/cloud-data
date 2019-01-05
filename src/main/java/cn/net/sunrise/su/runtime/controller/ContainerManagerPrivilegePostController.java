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

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.PassportService;
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.ResultBody;

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
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		if (account==null || account.length()==0) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_ACCEPT);
		}
		UserBean userBean = new UserBean();
		userBean.setAccount(account);
		userBean.encodeAccount();
		List<UserBean> list = this.ps.selectUserByAccount(userBean);
		if (list==null || list.isEmpty()) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_EXISTS);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", PassportKey.OK.code);
		userBean = list.get(0);
		userBean.decode();
		userBean.decodeAccount();
		map.put("obj", new Gson().toJson(userBean));
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value="/add/", method=RequestMethod.POST)
	@ResponseBody
	public String add_privilege_01(@RequestParam("cid") String cid, @RequestParam("uid") String uid,
								   @RequestParam("privilege") String privilege, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		if (cid==null || !AppCheck.checkId(cid)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		if (uid==null || !AppCheck.checkId(uid)) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_EXISTS);
		}
		int privilegeCode = -1;
		switch(privilege) {
			case "admin": privilegeCode = ContainerPrivilegeKey.ADMIN.key;break;
			case "guest": privilegeCode = ContainerPrivilegeKey.GUEST.key;break;
		}
		if (privilegeCode == -1) {
			return ResultBody.result(ContainerKey.UNKNOWN_PRIVILEGE);
		}
		
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		UserBean sUserBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		containerBean.setUid(sUserBean.getId());
		if (!this.cs.isOwner(containerBean)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		UserBean userBean = new UserBean();
		userBean.setId(Integer.parseInt(uid));
		if (!this.ps.existsById(userBean)) {
			return ResultBody.result(PassportKey.ACCOUNT_NOT_EXISTS);
		}
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		containerPrivilegeBean.setUid(userBean.getId());
		containerPrivilegeBean.setPrivilege(privilegeCode);
		if (this.cs.existsPrivilege(containerPrivilegeBean)) {
			return ResultBody.result(ContainerKey.PRIVILEGE_ALREADY_EXISTS);
		}
		this.cs.addPrivilege(containerPrivilegeBean);
		return ResultBody.result(ContainerKey.OK);
	}
	
	@RequestMapping(value="/delete/", method=RequestMethod.POST)
	@ResponseBody
	public String delete_privilege_01(@RequestParam("pid") String pid, HttpSession session) {
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		if (pid==null || !AppCheck.checkId(pid)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setId(Integer.parseInt(pid));
		List<ContainerPrivilegeBean> list = this.cs.selectPrivilegeById(containerPrivilegeBean);
		if (list==null || list.isEmpty()) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		containerPrivilegeBean = list.get(0);
		if (containerPrivilegeBean.getPrivilege() == ContainerPrivilegeKey.OWNER.key) {
			return ResultBody.result(ContainerKey.OWNER_NOT_ALLOW_DELETE);
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(containerPrivilegeBean.getCid());
		if (!this.cs.isOwner(containerBean)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		this.cs.deletePrivilegeById(containerPrivilegeBean);
		return ResultBody.result(ContainerKey.OK);
	}
}
