package com.whenwhere.main.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class MainController {

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("userid", "username");
		return "home/main";
	}
	
	@RequestMapping(value = "/join")
	public String join(HttpSession session, HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		application.setAttribute(session.getId(), session);
		return "home/join";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		
		return "home/login";
	}
	
	@RequestMapping(value = "/search")
	public String search() {
		
		return "home/search";
	}
}
