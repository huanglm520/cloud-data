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
import cn.net.sunrise.su.beans.container.ContainerNewBean;
import cn.net.sunrise.su.beans.container.ContainerPrivilegeBean;
import cn.net.sunrise.su.beans.container.FieldBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.PassportService;

@Controller
@RequestMapping(value="/container/manager", method=RequestMethod.GET)
public class ContainerManagerGetController extends BaseController {

	@Autowired
	private ContainerService cs;
	@Autowired
	private PassportService ps;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid==null || !cid.matches("^[0-9]{1,10}$")) {
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
		// 查询容器结构
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename(list.get(0).tableName());
		List<FieldBean> list3 = this.cs.queryContainerStruct(containerNewBean);
		request.setAttribute(SecurityKey.CONTAINER_MANAGER_FIELD.key, new Gson().toJson(list3));
		// 查询容器权限信息
		ContainerPrivilegeBean containerPrivilegeBean = new ContainerPrivilegeBean();
		containerPrivilegeBean.setCid(containerBean.getId());
		List<ContainerPrivilegeBean> list2 = this.cs.selectPrivilegeByCid(containerPrivilegeBean);
		for (ContainerPrivilegeBean c : list2) {
			c.privileges();
			UserBean usb = new UserBean();
			usb.setId(c.getUid());
			UserBean t = this.ps.selectUserById(userBean).get(0);
			t.decode();
			t.decodeAccount();
			c.setName(t.getLast_name()+t.getFirst_name());
			c.setAccount(t.getAccount());
		}
		request.setAttribute(SecurityKey.CONTAINER_MANAGER_PRIVILEGE.key, new Gson().toJson(list2));
		return "container-manager-main";
	}
}
