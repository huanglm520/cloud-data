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

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.FieldService;
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.ResultBody;

@Controller
@RequestMapping(value="/container/manager", method=RequestMethod.GET)
public class ContainerManagerGetController extends BaseController {

	@Autowired
	private ContainerService cs;
	
	@Autowired
	private FieldService fs;
	
	@GetMapping("/main")
	public String main_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.hasPrivilege(containerBean)) {
			return BaseController.NO_PRIVILEGE;
		}
		// 查询容器信息
		List<ContainerBean> list = this.cs.selectContainerById(containerBean);
		list.get(0).state();
		request.setAttribute(SecurityKey.CONTAINER_MANAGER_INFO.key, new Gson().toJson(list));
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, "\""+list.get(0).getName()+"\"");
		return "container-manager-main";
	}
	
	@GetMapping("/delete")
	public String delete_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.isOwner(containerBean)) {
			return BaseController.NOT_OWNER;
		}
		// 提取此容器的信息
		containerBean = this.cs.selectContainer(containerBean).get(0);
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, containerBean.getName());
		return "container-manager-delete";
	}
	
	@GetMapping("/field")
	public String field_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.hasPrivilege(containerBean)) {
			return BaseController.NO_PRIVILEGE;
		}
		// 读取容器以及字段信息
		containerBean = this.cs.selectContainerById(containerBean).get(0);
		FieldBean fieldBean = new FieldBean();
		fieldBean.setCid(containerBean.getId());
		List<FieldBean> list = this.fs.selectFieldByCid(fieldBean);
		// 反编码字段信息
		for (FieldBean f: list) {
			f.decode();
		}
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, containerBean.getName());
		request.setAttribute(SecurityKey.FIELD_LIST.key, ResultBody.gson.toJson(list));
		return "container-manager-field";
	}
	
	@GetMapping("/privilege")
	public String privilege_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.isOwner(containerBean)) {
			return BaseController.NOT_OWNER;
		}
		containerBean = this.cs.selectContainerById(containerBean).get(0);
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		List<ContainerPrivilegeBean> list = this.cs.selectPrivilegeByCid(containerPrivilegeBean);
		for (ContainerPrivilegeBean c: list) {
			c.decodeAccount();
			c.privileges();
		}
		request.setAttribute(SecurityKey.CONTAINER_ID.key, containerBean.getId());
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, containerBean.getName());
		request.setAttribute(SecurityKey.CONTAINER_MANAGER_PRIVILEGE.key, ResultBody.gson.toJson(list));
		return "container-manager-privilege";
	}
}
