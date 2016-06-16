package com.whenwhere.team.dao;


import java.util.List;
import java.util.Map;

import com.whenwhere.team.vo.TeamVO;

public interface TeamDAO {
	
	public int makeTeam(Map<String, Object> map);
	public List<TeamVO> getTeamList(String nickName);
}
