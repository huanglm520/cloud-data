package cn.net.sunrise.su.runtime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerPrivilegeKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;

@Controller
@RequestMapping(value="/container", method=RequestMethod.GET)
public class ContainerDoubleGetController extends BaseController {
	
	@Autowired
	private ContainerService cs;
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add_02(HttpSession session) {
		return super.pageName(session, "container-add");
	}
	
	@RequestMapping(value="/manager", method=RequestMethod.GET)
	public String manager_02(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		
		String page = "container-manager";
		
		String status = request.getParameter("status");
		String privilege = request.getParameter("privilege");
		String keyword = request.getParameter("container_keyword");
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(((UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key)).getId());
		if ("running".equals(status)) {
			containerBean.setStatus(ContainerStatusKey.RUNNING.key);
		} else if ("stoping".equals(status)) {
			containerBean.setStatus(ContainerStatusKey.STOPING.key);
		} else if ("modifying".equals(status)) {
			containerBean.setStatus(ContainerStatusKey.MODIFYING.key);
		} else if ("creating".equals(status)) {
			containerBean.setStatus(ContainerStatusKey.CREATING.key);
		} else if ("all".equals(status)) {
			// Nothing to do
		} else {
			return page;
		}
		if ("owner".equals(privilege)) {
			containerBean.setPrivilege(ContainerPrivilegeKey.OWNER.key);
		} else if ("admin".equals(privilege)) {
			containerBean.setPrivilege(ContainerPrivilegeKey.ADMIN.key);
		} else if ("guest".equals(privilege)) {
			containerBean.setPrivilege(ContainerPrivilegeKey.GUEST.key);
		} else if ("all".equals(privilege)) {
			// Nothing to do
		} else {
			return page;
		}
		
		if (keyword != null) {
			containerBean.setName(keyword);
		}
		List<ContainerBean> list = this.cs.selectContainer(containerBean);
		for (ContainerBean containerBean2: list) {
			containerBean2.state();
			containerBean2.privileges();
		}
		request.setAttribute(SecurityKey.SECURITY_CONTAINER_LIST.key, new Gson().toJson(list));
		return page;
	}
	
	@RequestMapping(value="/export", method=RequestMethod.GET)
	public String export_02(HttpSession session) {
		return super.pageName(session, "container-export");
	}
	
	@RequestMapping(value="/import", method=RequestMethod.GET)
	public String import_02(HttpSession session) {
		return super.pageName(session, "container-import");
	}
}
