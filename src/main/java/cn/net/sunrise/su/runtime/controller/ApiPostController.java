package cn.net.sunrise.su.runtime.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.net.sunrise.su.beans.api.ApiClockBean;
import cn.net.sunrise.su.tool.ResultBody;

@Controller
@RequestMapping(value="/api", method=RequestMethod.POST)
public class ApiPostController {
	
	@RequestMapping(value="/current-time/", method=RequestMethod.POST)
	@ResponseBody
	public String clock() {
		return ResultBody.gson.toJson(new ApiClockBean(new Date()));
	}
}
