package com.whenwhere.team.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.team.dao.TeamDAO;
import com.whenwhere.team.vo.TeamVO;
import com.whenwhere.user.vo.MemberVO;

@Service("teamService")
public class TeamService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String makeTeam(TeamVO teamVO, HttpServletRequest request, HttpSession session) {
		TeamDAO dao = sqlSessionTemplate.getMapper(TeamDAO.class);
		JSONObject obj = new JSONObject();
		obj.put("ok", false);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionNick; 

		if (member != null){
			Map<String, Object> map = new HashMap<>();
			sessionNick = member.getNickname();
			
			map.put("nickname", sessionNick);
			map.put("sdate", teamVO.getSdate());
			map.put("edate", teamVO.getEdate()); 
			map.put("loc_code", teamVO.getLoc_code());
			map.put("subject", teamVO.getSubject()); 
			map.put("teamname", teamVO.getTeamname());
			
			System.out.println(map.get("nickname"));
			System.out.println(map.get("sdate"));
			System.out.println(map.get("edate"));
			System.out.println(map.get("loc_code"));
			System.out.println(map.get("subject"));
			System.out.println(map.get("teamname"));
			
			int row = dao.makeTeam(map);
			if(row == 0){
				System.out.println("팀만들기 실패");
			}
			
			obj.put("ok", true);
		}else{
			System.out.println("로그인해");
		}
		return obj.toJSONString();
	}

	@SuppressWarnings("unchecked")
	public String getTeamList(HttpServletRequest request, HttpSession session) {
		TeamDAO dao = sqlSessionTemplate.getMapper(TeamDAO.class);
		JSONObject obj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		obj.put("ok", true);
		jsonArr.add(obj);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if (member != null){
			String sessionNick = member.getNickname();
			
			List<TeamVO> teamList = new ArrayList<TeamVO>();
			teamList = dao.getTeamList(sessionNick);
			System.out.println(teamList.size());
			for(int i=0;i<teamList.size();i++){
				obj = new JSONObject();
				
				obj.put("no", teamList.get(i).getNo());
				obj.put("status", teamList.get(i).getStatus()); 
				obj.put("nickname", teamList.get(i).getNickName());
				obj.put("teamname", teamList.get(i).getTeamname());
				obj.put("subject", teamList.get(i).getSubject());
				Date date = teamList.get(i).getSdate();
				String dateS = date.toString().split(" 00")[0];
				obj.put("sdate",dateS);
				date =teamList.get(i).getEdate();
				dateS = date.toString().split(" 00")[0];
				obj.put("edate", dateS);
				
				jsonArr.add(obj);
			}
		}else{
			System.out.println("로그인해");
		}
		System.out.println(jsonArr.toJSONString());
		return jsonArr.toJSONString();
	}

	public String getTeamUserList(HttpServletRequest request, HttpSession session, int teamNum) {
		TeamDAO dao = sqlSessionTemplate.getMapper(TeamDAO.class);
		JSONObject obj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		obj.put("ok", true);
		jsonArr.add(obj);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if (member != null){
			String sessionNick = member.getNickname();
			
			List<String> teamList = new ArrayList<String>();
			teamList = dao.getTeamUserList(sessionNick, teamNum);
			
			String str="";
			for(int i=0;i<teamList.size();i++){
				str +=teamList.get(i) + ",";
			}
			str += "end";
			jsonArr.add(str);
			
		}else{
			System.out.println("로그인해");
		}
		System.out.println(jsonArr.toJSONString());
		return jsonArr.toJSONString();
	}
}
 