package cn.net.sunrise.su.runtime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.tool.AppCheck;

@Controller
@RequestMapping(value="/container/manager/privilege", method=RequestMethod.GET)
public class ContainerManagerPrivilegeGetController extends BaseController {
	
	@Autowired
	private ContainerService cs;

	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		containerBean.setUid(userBean.getId());
		if (!this.cs.isOwner(containerBean)) {
			return BaseController.NOT_OWNER;
		}
		return "container-manager-privilege-add";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String pid = request.getParameter("pid");
		if (pid==null || !AppCheck.checkId(pid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setId(Integer.parseInt(pid));
		List<ContainerPrivilegeBean> list = this.cs.selectPrivilegeById(containerPrivilegeBean);
		if (list==null || list.isEmpty()) {
			return BaseController.NO_PRIVILEGE;
		}
		containerPrivilegeBean = list.get(0);
		// 检查是否是OWNER条目
		if (containerPrivilegeBean.getPrivilege() == ContainerPrivilegeKey.OWNER.key) {
			return BaseController.OWNER_NOT_DELETE;
		}
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(containerPrivilegeBean.getCid());
		if (!this.cs.isOwner(containerBean)) {
			return BaseController.NOT_OWNER;
		}
		containerBean = this.cs.selectContainerById(containerBean).get(0);
		containerPrivilegeBean.decodeAccount();
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, containerBean.getName());
		request.setAttribute(SecurityKey.USER_ACCOUNT.key, containerPrivilegeBean.getAccount());
		request.setAttribute(SecurityKey.PRIVILEGE_NAME.key, ContainerPrivilegeKey.privilegeName(containerPrivilegeBean.getPrivilege()));
		return "container-manager-privilege-delete";
	}
}
