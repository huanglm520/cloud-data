package cn.net.sunrise.su.runtime.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.ContainerQueryTimeBean;
import cn.net.sunrise.su.beans.UserBean;
import cn.net.sunrise.su.enums.AttributeKey;
import cn.net.sunrise.su.enums.PassportKey;
import cn.net.sunrise.su.service.ContainerService;

@RestController
@RequestMapping(value = "/container/statistics")
public class ContainerStatisticsPostController extends BaseController {
	
	@Autowired
	ContainerService containerService;

	@PostMapping("/query/")
	public Object query_01(HttpSession session) throws ParseException {
		if (!super.checkLogin(session)) {
			return PassportKey.NOT_LOGIN;
		}
		UserBean userBean = (UserBean) session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
		ContainerQueryTimeBean containerQueryTimeBean = new ContainerQueryTimeBean();
		containerQueryTimeBean.setUid(userBean.getId());
		Date date = new Date();
		String sDate = new SimpleDateFormat("yyyy-MM-dd").format(date)+" 00:00:00";
		long sTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sDate).getTime();
		long eTime = sTime + 24*60*60*1000*15L + 23*59*59*1000L + 999L;
		containerQueryTimeBean.setLeftTime(sTime);
		containerQueryTimeBean.setRightTime(eTime);
		Object object = this.containerService.selectQueryRecord(containerQueryTimeBean);
		return object;
	}
}
