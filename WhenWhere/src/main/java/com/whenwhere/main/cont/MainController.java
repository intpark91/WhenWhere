package com.whenwhere.main.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/home")
public class MainController {

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("userid", null);
		return "home/main";
	}
	
	@RequestMapping(value = "/joinForm")
	public String join(HttpSession session, HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		application.setAttribute(session.getId(), session);
		return "home/join";
	}
	
	@RequestMapping(value = "/loginForm")
	public String login() {
		return "home/login";
	}
	
	@RequestMapping(value = "/searchForm")
	public String search() {
		return "home/search";
	}
	
	@RequestMapping(value = "/chat")
	public String chat() {
		return "chat/main";
	}
}
