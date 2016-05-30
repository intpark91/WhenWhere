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
}
