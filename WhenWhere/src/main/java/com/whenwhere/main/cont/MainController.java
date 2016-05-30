package com.whenwhere.main.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class MainController {

	@RequestMapping(value = "/main")
	public String main() {
		return "home/main";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "home/home_join";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "home/home_login";
	}
}
