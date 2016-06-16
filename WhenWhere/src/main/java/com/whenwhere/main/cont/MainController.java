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
import com.whenwhere.team.service.TeamService;
import com.whenwhere.util.WeatherService;

@Controller
@RequestMapping("/home")
public class MainController {

	@Autowired
	private SearchService searchService;
	@Autowired
	private WeatherService weatherService;
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/main")
	public String main(Model model) {
		model.addAttribute("userid", null);
		model.addAttribute("locationSubList", searchService.getSubLocationList());
		return "home/main";
	}

	@RequestMapping(value = "/weather")
	@ResponseBody
	public String getWeather(@RequestParam String locName) {
		return weatherService.getMidTermWeather(locName);
	}

	@RequestMapping(value = "/register")
	public String register(HttpSession session, HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		application.setAttribute(session.getId(), session);
		return "home/register";
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
	public String chat(Model model) {
		return "chat/main";
	}

	@RequestMapping(value = "/admin")
	public String admin(Model model) {
		return "manage/adminHome";
	}
	
	@RequestMapping(value = "/team")
	public String team(Model model,
			@RequestParam(required = false, defaultValue="") String teamname,
			@RequestParam(required = false, defaultValue="0") int teamNum) {
		if(!teamname.equals("")){
			model.addAttribute("teamInfo", teamService.getTeamInfo(teamNum));
			model.addAttribute("teamList", teamService.getTeamUserList(teamNum));
		}
		model.addAttribute("locationSubList", searchService.getSubLocationList());
		return "team/teamMain";
	}
}
