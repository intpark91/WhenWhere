package com.whenwhere.main.cont;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.main.service.SearchService;
import com.whenwhere.util.WeatherService;

@Controller
@RequestMapping("/home")
public class MainController {

	@Autowired
	private SearchService searchService;
	@Autowired
	private WeatherService weatherService;

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("userid", null);
		model.addAttribute("locationSubList", searchService.getSubLocationList());
		return "home/main";
	}

	@RequestMapping(value = "/weather")
	@ResponseBody
	public String getWeather(@RequestParam String locName) {
		return weatherService.getWeatherInfo(locName);
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
		model.addAttribute("locationList", searchService.getAllLocationList());
		model.addAttribute("locationSubList", searchService.getSubLocationList());
		return "home/search";
	}

	@ResponseBody
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request) {
		return searchService.getSearchList(request);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getEventList")
	public String getEventList(HttpServletRequest request) {
		return searchService.getEventList(request);
	}

	@RequestMapping(value = "/chat")
	public String chat() {
		return "chat/main";
	}

	@RequestMapping(value = "/admin")
	public String admin() {
		return "admin/manage";
	}
}
