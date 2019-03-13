package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.runtime.check.AppCheck;
import cn.net.sunrise.su.service.ContainerService;

@RestController
public class ContainerManagerDeletePostController extends BaseController {
	
	@Autowired
	private ContainerService cs;

	@PostMapping("/container/manager/delete-container/")
	public Object delete_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		String cid = request.getParameter("id");
		if (StringUtils.isBlank(cid) || !AppCheck.checkId(cid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.isOwner(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		String name = request.getParameter("name");
		// 取得此容器信息
		containerBean = this.cs.selectContainer(containerBean).get(0);
		if (!containerBean.getName().equals(name)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		// 验证通过，删除容器数据
		// 删除容器空间
		this.cs.dropContainer(containerBean);
		return ContainerKey.OK;
	}
}
