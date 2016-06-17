package com.whenwhere.team.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@ResponseBody
	@RequestMapping(value = "/getTeamUserList")
	public String getTeamUserList(HttpServletRequest request, HttpSession session) {
		return teamService.getTeamUserList(request, session,Integer.parseInt(request.getParameter("teamNum")));
	}
	
	@ResponseBody
	@RequestMapping(value = "/getApplyTeamUserList")
	public String getApplyTeamUserList(@RequestParam String tNo) {
		return teamService.getApplyTeamUserList(tNo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/applyUserDelete")
	public String applyUserDelete(HttpServletRequest request) {
		return teamService.applyUserDelete(request);
	}
	
	@ResponseBody
	@RequestMapping(value = "/applyUser")
	public String applyUser(HttpServletRequest request) {
		return teamService.applyUser(request);
	}
	
	@ResponseBody
	@RequestMapping(value = "/chatTeam")
	public String chatTeam(HttpServletRequest request, HttpSession session) {
		return teamService.chatTeam(request, session,Integer.parseInt(request.getParameter("teamNum")));
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendMsg")
	public String sendMsg(HttpServletRequest request, HttpSession session) {
		return teamService.sendMsg(request, session, Integer.parseInt(request.getParameter("teamNum")), request.getParameter("nickName"),request.getParameter("msg"));
	}
}
