package com.whenwhere.main.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whenwhere.main.service.SearchService;

@Controller
@RequestMapping("/home")
public class MainController {

	@Autowired
	private SearchService searchSerive;
	
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
	public String searchForm(Model model) {
		model.addAttribute("locationList", searchSerive.getAllLocationList());
		return "home/search";
	}
	
	@RequestMapping(value = "/chat")
	public String chat() {
		return "chat/main";
	}
}
