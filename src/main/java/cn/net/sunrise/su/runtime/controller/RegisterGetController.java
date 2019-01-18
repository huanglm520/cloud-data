package cn.net.sunrise.su.runtime.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping(value="/passport/register", method=RequestMethod.GET)
public class RegisterGetController extends BaseController {

	@GetMapping("")
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String register() {
		return "redirect:register/step1";
	}
	@GetMapping("/")
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String register_01() {
		return "redirect:step1";
	}
	@GetMapping("/step1")
	public String register_03() {
		return "register-step1";
	}
	
	@GetMapping("/step2")
	public String register_05() {
		return "register-step2";
	}
	
	@GetMapping("/step3")
	public String register_07() {
		return "register-step3";
	}
	
	@GetMapping("/step4")
	public String register_09() {
		return "register-step4";
	}
}
