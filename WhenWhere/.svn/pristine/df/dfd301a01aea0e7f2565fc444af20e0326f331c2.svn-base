package com.whenwhere.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class UserController {

	@RequestMapping(value="/main")
	public String main(){
		return "home/main";
	}
	
	@RequestMapping(value="/test")
	public String notice(){
		return "board/noticeBoard";
	}
}
