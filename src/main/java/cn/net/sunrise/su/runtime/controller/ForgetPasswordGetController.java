package cn.net.sunrise.su.runtime.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping(value="/passport/forget-password", method=RequestMethod.GET)
public class ForgetPasswordGetController extends BaseController {
	
	@RequestMapping(value="", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String forgetPassword() {
		return "redirect:forget-password/step1";
	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	@ResponseStatus(value=HttpStatus.MOVED_PERMANENTLY)
	public String forgetPassword_01() {
		return "redirect:step1";
	}
	@RequestMapping(value="/step1", method=RequestMethod.GET)
	public String forgetPassword_03() {
		return "forget-password-step1";
	}
	@RequestMapping(value="/step2", method=RequestMethod.GET)
	public String forgetPassword_05() {
		return "forget-password-step2";
	}
	@RequestMapping(value="/step3", method=RequestMethod.GET)
	public String forgetPassword_07() {
		return "forget-password-step3";
	}
}
