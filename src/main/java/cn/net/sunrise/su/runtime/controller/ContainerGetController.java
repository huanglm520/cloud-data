package cn.net.sunrise.su.runtime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContainerGetController extends BaseController {

	@GetMapping("/container")
	public String container_01(HttpSession session) {
		return super.pageName(session, "container");
	}
}
