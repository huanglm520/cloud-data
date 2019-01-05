package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
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
}
