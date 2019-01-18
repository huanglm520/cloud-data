package cn.net.sunrise.su.runtime.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class RootGetController extends BaseController {
	
	@GetMapping("/")
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String root() {
		return "redirect:/passport/login";
	}
}
