package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

@Controller
public class ContainerManagerDeletePostController extends BaseController {
	
	@Autowired
	private ContainerService cs;

	@RequestMapping(value="/container/manager/delete-container/", method=RequestMethod.POST)
	@ResponseBody
	public String delete_01(HttpSession session, HttpServletRequest request) {
		if (!super.checkLogin(session)) {
			return new Gson().toJson(new PassportStatusBean(PassportKey.NOT_LOGIN));
		}
		String cid = request.getParameter("id");
		if (cid==null || !cid.matches("^[0-9]{1,10}$")) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.NO_PRIVILEGE));
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(userBean.getId());
		containerBean.setId(Integer.parseInt(cid));
		if (!this.cs.isOwner(containerBean)) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.NO_PRIVILEGE));
		}
		String name = request.getParameter("name");
		// 取得此容器信息
		containerBean = this.cs.selectContainer(containerBean).get(0);
		if (!containerBean.getName().equals(name)) {
			return new Gson().toJson(new ContainerStatusBean(ContainerKey.NO_PRIVILEGE));
		}
		// 验证通过，删除容器数据
		// 删除容器空间
		this.cs.dropContainer(containerBean);
		return new Gson().toJson(new ContainerStatusBean(ContainerKey.OK));
	}
}
