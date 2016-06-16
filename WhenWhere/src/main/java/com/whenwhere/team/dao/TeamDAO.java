package com.whenwhere.team.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.whenwhere.team.vo.TeamVO;

public interface TeamDAO {
	
	public int makeTeam(Map<String, Object> map);
	public List<TeamVO> getTeamList(String nickName);
	public List<String> getTeamUserList(@Param("nickname") String nickname, @Param("teamNum") int teamNum);
}
