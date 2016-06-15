package com.whenwhere.team.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			
		}else{
			System.out.println("로그인해");
		}
			
		return null;
	}

}
 