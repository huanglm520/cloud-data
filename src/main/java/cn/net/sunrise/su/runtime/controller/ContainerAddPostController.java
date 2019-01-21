package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.tool.ContainerCheck;

@RestController
@RequestMapping(value="/container", method=RequestMethod.POST)
public class ContainerAddPostController extends BaseController {
	
	@Autowired
	private ContainerService ca;

	@PostMapping("/add/")
	public Object add_01(@RequestParam("containerName") String containerName,
						 @RequestParam("apiName") String apiName,
						 HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		
		if (StringUtils.isBlank(containerName)) {
			return ContainerKey.CONTAINER_NAME_EMPTY;
		}
		if (containerName.length() > 16) {
			return ContainerKey.CONTAINER_NAME_TOO_LONG;
		}
		if (!ContainerCheck.checkContainerName(containerName)) {
			return ContainerKey.CONTAINER_NAME_NOT_ACCEPT;
		}
		if (StringUtils.isBlank(apiName)) {
			return ContainerKey.API_NAME_EMPTY;
		}
		if (apiName.length() > 32) {
			return ContainerKey.API_NAME_TOO_LONG;
		}
		if (!ContainerCheck.checkApiName(apiName)) {
			return ContainerKey.API_NAME_NOT_ACCEPT;
		}
		ContainerBean containerBean = new ContainerBean();
		containerBean.setName(containerName);
		containerBean.setApi(apiName);
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		containerBean.setUid(userBean.getId());
		return this.ca.addContainer(containerBean);
	}
}
