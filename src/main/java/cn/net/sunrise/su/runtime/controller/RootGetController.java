package cn.net.sunrise.su.runtime.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class RootGetController extends BaseController {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String root() {
		return "redirect:/passport/login";
	}
}
