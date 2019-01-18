package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.tool.AppCheck;

@Controller
@RequestMapping(value="/container/manager/field", method=RequestMethod.GET)
public class ContainerManagerFieldGetController extends BaseController {
	
	@Autowired
	private ContainerService containerService;

	@GetMapping("/add")
	public String add_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return BaseController.LOGIN_OUT;
		}
		String cid = request.getParameter("cid");
		if (cid == null || !AppCheck.checkId(cid)) {
			return BaseController.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.containerService.hasPrivilege(containerBean)) {
			return BaseController.NO_PRIVILEGE;
		}
		
		containerBean = this.containerService.selectContainerById(containerBean).get(0);
		request.setAttribute(SecurityKey.CONTAINER_NAME.key, containerBean.getName());
		return "container-manager-field-add";
	}
}
