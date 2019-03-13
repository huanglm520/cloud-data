package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.ContainerNewBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.ContainerKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.runtime.check.AppCheck;
import cn.net.sunrise.su.service.ContainerQueryService;
import cn.net.sunrise.su.service.ContainerService;

@RestController
@RequestMapping(value="/container/transmission", method=RequestMethod.POST)
public class TransmissionPostController extends BaseController {
	
	@Autowired
	private ContainerService containerService;
	@Autowired
	private ContainerQueryService containerQueryService;

	@PostMapping("/query/")
	public Object query_01(@RequestParam("csql") String csql, @RequestParam("cid")String cid, HttpSession session) {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		if (StringUtils.isBlank(cid) || !AppCheck.checkId(cid)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerBean containerBean = new ContainerBean();
		containerBean.setId(Integer.parseInt(cid));
		containerBean.setUid(userBean.getId());
		if (!this.containerService.hasGuest(containerBean)) {
			return ContainerKey.NO_PRIVILEGE;
		}
		containerBean = this.containerService.selectContainerById(containerBean).get(0);
		Object object = containerQueryService.queryByCSQL(csql, containerBean);
		// 修改数据量
		ContainerNewBean containerNewBean = new ContainerNewBean();
		containerNewBean.setTablename(containerBean.tableName());
		int count = this.containerService.containerDataCount(containerNewBean);
		containerBean.setData(count);
		this.containerService.updateContainer(containerBean);
		return object;
	}
}
