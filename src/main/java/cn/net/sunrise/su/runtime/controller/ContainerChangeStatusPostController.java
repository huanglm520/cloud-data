package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.runtime.check.AppCheck;
import cn.net.sunrise.su.service.ContainerService;

@RestController
public class ContainerChangeStatusPostController extends BaseController {
	
	@Autowired
	private ContainerService cs;

	@PostMapping("/container/manager/change-status/")
	public Object change_status(@RequestParam("status") String status,
								@RequestParam("cid") String cid,
								HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (StringUtils.isBlank(cid) || !AppCheck.checkId(cid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		if (StringUtils.isBlank(status) || !status.matches("modify|running|stop")) {
			return ContainerKey.ERROR_STATUS;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		containerBean.setUid(userBean.getId());
		if (!this.cs.hasPrivilege(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		
		// 修改状态
		// 先读取该容器状态
		containerBean = this.cs.selectContainerById(containerBean).get(0);
		if (status.equals("modify")) {
			containerBean.setStatus(ContainerStatusKey.MODIFYING.key);
		}
		if (status.equals("running")) {
			containerBean.setStatus(ContainerStatusKey.RUNNING.key);
		}
		if (status.equals("stop")) {
			containerBean.setStatus(ContainerStatusKey.STOPING.key);
		}
		// 回写数据库状态
		this.cs.updateContainer(containerBean);
		return ContainerKey.OK;
	}
}
