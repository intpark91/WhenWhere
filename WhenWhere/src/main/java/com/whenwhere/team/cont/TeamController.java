package com.whenwhere.team.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whenwhere.team.service.TeamService;
import com.whenwhere.team.vo.TeamVO;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	
	@ResponseBody
	@RequestMapping(value = "/makeTeam")
	public String makeTeam(TeamVO teamVO, HttpServletRequest request, HttpSession session) {
		return teamService.makeTeam(teamVO, request, session);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getTeamList")
	public String getTeamList(HttpServletRequest request, HttpSession session) {
		return teamService.getTeamList(request, session);
	}
}
