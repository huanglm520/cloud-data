package cn.net.sunrise.su.runtime.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

import cn.net.sunrise.su.beans.ContainerBean;
import cn.net.sunrise.su.beans.ContainerStatisticsBean;
import cn.net.sunrise.su.beans.LoginRecordStatisticsBean;
import cn.net.sunrise.su.beans.LoginRecordTimeBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.SecurityKey;
import cn.net.sunrise.su.service.ContainerService;
import cn.net.sunrise.su.service.PassportService;
import cn.net.sunrise.su.tool.DateTool;

@Controller
public class HomeGetController extends BaseController {
	
	@Autowired
	private PassportService ps;
	@Autowired
	private ContainerService cs;

	@GetMapping("/home")
	public String home(HttpSession session, HttpServletRequest request) {
		// 判断是否登录
		if (!super.checkLogin(session)) {
			return "login-out";
		}
		
		// 获取当前用户
		UserBean usb = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		// 查询用户登录记录
		LoginRecordTimeBean lrtb = new LoginRecordTimeBean();
		lrtb.setUid(usb.getId());
		DateTool.Section ds = DateTool.getMonthSectionMillis(new Date());
		lrtb.setsTime(ds.sTime);
		lrtb.seteTime(ds.eTime);
		List<LoginRecordStatisticsBean> list = this.ps.selectLoginRecordStatistics(lrtb);
		for (LoginRecordStatisticsBean b : list) {
			b.decode();
		}
		request.setAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key, new Gson().toJson(list));
		
		// 查询容器状态统计信息
		ContainerBean containerBean = new ContainerBean();
		containerBean.setUid(usb.getId());
		List<ContainerStatisticsBean> list2 = this.cs.selectContainerStatistics(containerBean);
		for (ContainerStatisticsBean c : list2) {
			c.getName();
		}
		request.setAttribute(SecurityKey.CONTAINER_STATISTICS.key, new Gson().toJson(list2));
		
		// 如果已登录
		return "home";
	}
}
