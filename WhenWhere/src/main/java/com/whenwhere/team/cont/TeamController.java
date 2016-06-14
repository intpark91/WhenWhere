package com.whenwhere.team.cont;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.team.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	
	@ResponseBody
	@RequestMapping(value = "/makeTeam")
	public String makeTeam(HttpServletRequest request) {
		return teamService.makeTeam(request);
	}
	
}
