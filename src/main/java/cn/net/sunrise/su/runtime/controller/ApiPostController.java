package cn.net.sunrise.su.runtime.controller;

import java.util.Date;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.net.sunrise.su.beans.api.ApiClockBean;
import cn.net.sunrise.su.tool.ResultBody;

@RestController
@RequestMapping(value="/api", method=RequestMethod.POST)
public class ApiPostController {
	
	@PostMapping("/current-time/")
	public String clock() {
		return ResultBody.gson.toJson(new ApiClockBean(new Date()));
	}
}
