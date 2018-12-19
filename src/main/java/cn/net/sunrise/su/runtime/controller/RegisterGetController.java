package cn.net.sunrise.su.runtime.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping(value="/passport/register", method=RequestMethod.GET)
public class RegisterGetController extends BaseController {

	@RequestMapping(value="", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String register() {
		return "redirect:register/step1";
	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String register_01() {
		return "redirect:step1";
	}
	@RequestMapping(value="/step1", method=RequestMethod.GET)
	public String register_03() {
		return "register-step1";
	}
	
	@RequestMapping(value="/step2", method=RequestMethod.GET)
	public String register_05() {
		return "register-step2";
	}
	
	@RequestMapping(value="/step3", method=RequestMethod.GET)
	public String register_07() {
		return "register-step3";
	}
	
	@RequestMapping(value="/step4", method=RequestMethod.GET)
	public String register_09() {
		return "register-step4";
	}
}
