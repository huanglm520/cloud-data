package cn.net.sunrise.su.runtime.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

@RestController
@RequestMapping(value="/container/manager/privilege", method=RequestMethod.POST)
public class ContainerManagerPrivilegePostController extends BaseController {

	@Autowired
	private PassportService ps;
	@Autowired
	private ContainerService cs;
	
	@PostMapping("/add/search-user/")
	public Object search_user_01(@RequestParam("account") String account, HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (StringUtils.isBlank(account)) {
			return PassportKey.ACCOUNT_NOT_ACCEPT;
		}
		UserBean userBean = new UserBean();
		userBean.setAccount(account);
		userBean.encodeAccount();
		List<UserBean> list = this.ps.selectUserByAccount(userBean);
		if (list==null || list.isEmpty()) {
			return PassportKey.ACCOUNT_NOT_EXISTS;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", PassportKey.OK.code);
		userBean = list.get(0);
		userBean.decode();
		userBean.decodeAccount();
		map.put("obj", new Gson().toJson(userBean));
		return map;
	}
	
	@PostMapping("/add/")
	public Object add_privilege_01(@RequestParam("cid") String cid, @RequestParam("uid") String uid,
								   @RequestParam("privilege") String privilege, HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (StringUtils.isBlank(cid) || !AppCheck.checkId(cid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		if (StringUtils.isBlank(uid) || !AppCheck.checkId(uid)) {
			return PassportKey.ACCOUNT_NOT_EXISTS;
		}
		int privilegeCode = -1;
		switch(privilege) {
			case "admin": privilegeCode = ContainerPrivilegeKey.ADMIN.key;break;
			case "guest": privilegeCode = ContainerPrivilegeKey.GUEST.key;break;
		}
		if (privilegeCode == -1) {
			return ContainerKey.UNKNOWN_PRIVILEGE;
		}
		
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		UserBean sUserBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		containerBean.setUid(sUserBean.getId());
		if (!this.cs.isOwner(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		UserBean userBean = new UserBean();
		userBean.setId(Integer.parseInt(uid));
		if (!this.ps.existsById(userBean)) {
			return PassportKey.ACCOUNT_NOT_EXISTS;
		}
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		containerPrivilegeBean.setUid(userBean.getId());
		containerPrivilegeBean.setPrivilege(privilegeCode);
		if (this.cs.existsPrivilege(containerPrivilegeBean)) {
			return ContainerKey.PRIVILEGE_ALREADY_EXISTS;
		}
		this.cs.addPrivilege(containerPrivilegeBean);
		return ContainerKey.OK;
	}
	
	@PostMapping("/delete/")
	public Object delete_privilege_01(@RequestParam("pid") String pid, HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (StringUtils.isBlank(pid) || !AppCheck.checkId(pid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setId(Integer.parseInt(pid));
		List<ContainerPrivilegeBean> list = this.cs.selectPrivilegeById(containerPrivilegeBean);
		if (list==null || list.isEmpty()) {
			return ContainerKey.NO_PRIVILEGE;
		}
		containerPrivilegeBean = list.get(0);
		if (containerPrivilegeBean.getPrivilege() == ContainerPrivilegeKey.OWNER.key) {
			return ContainerKey.OWNER_NOT_ALLOW_DELETE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(containerPrivilegeBean.getCid());
		if (!this.cs.isOwner(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		this.cs.deletePrivilegeById(containerPrivilegeBean);
		return ContainerKey.OK;
	}
}
