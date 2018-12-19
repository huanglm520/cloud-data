package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.container.ContainerBean;
import cn.net.sunrise.su.beans.container.ContainerStatusBean;
import cn.net.sunrise.su.beans.passport.PassportStatusBean;
import cn.net.sunrise.su.beans.passport.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.tool.ContainerCheck;

@Controller
@RequestMapping(value="/container", method=RequestMethod.POST)
public class ContainerAddPostController extends BaseController {
	
	@Autowired
	private ContainerService ca;

	@RequestMapping(value="/add/", method=RequestMethod.POST)
	@ResponseBody
	public String add_01(@RequestParam("containerName") String containerName,
						 @RequestParam("apiName") String apiName,
						 HttpSession session) {
		if (!super.checkLogin(session)) {
			return new Gson().toJson(new PassportStatusBean(PassportKey.NOT_LOGIN));
		}
		
		if (containerName==null || containerName.length()==0) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.CONTAINER_NAME_EMPTY));
		}
		if (containerName.length() > 16) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.CONTAINER_NAME_TOO_LONG));
		}
		if (!ContainerCheck.checkContainerName(containerName)) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.CONTAINER_NAME_NOT_ACCEPT));
		}
		if (apiName==null || apiName.length()==0) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.API_NAME_EMPTY));
		}
		if (apiName.length() > 32) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.API_NAME_TOO_LONG));
		}
		if (!ContainerCheck.checkApiName(apiName)) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.API_NAME_NOT_ACCEPT));
		}
		ContainerBean containerBean = new ContainerBean();
		containerBean.setName(containerName);
		containerBean.setApi(apiName);
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		containerBean.setUid(userBean.getId());
		ContainerStatusBean csb = this.ca.addContainer(containerBean);
		return new Gson().toJson(csb);
	}
}
