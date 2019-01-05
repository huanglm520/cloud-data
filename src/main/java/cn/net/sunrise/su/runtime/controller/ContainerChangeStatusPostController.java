package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.ContainerStatusKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.tool.AppCheck;
import cn.net.sunrise.su.tool.ResultBody;

@Controller
public class ContainerChangeStatusPostController extends BaseController {
	
	@Autowired
	private ContainerService cs;

	@RequestMapping(value="/container/manager/change-status/", method=RequestMethod.POST)
	@ResponseBody
	public String change_status(@RequestParam("status") String status,
								@RequestParam("cid") String cid,
								HttpSession session) {
		
		if (!super.checkLogin(session)) {
			return ResultBody.result(PassportKey.NOT_LOGIN);
		}
		if (cid == null || !AppCheck.checkId(cid)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
		}
		if (status == null || !status.matches("modify|running|stop")) {
			return ResultBody.result(ContainerKey.ERROR_STATUS);
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		containerBean.setUid(userBean.getId());
		if (!this.cs.hasPrivilege(containerBean)) {
			return ResultBody.result(ContainerKey.NO_PRIVILEGE);
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
		return ResultBody.result(ContainerKey.OK);
	}
}