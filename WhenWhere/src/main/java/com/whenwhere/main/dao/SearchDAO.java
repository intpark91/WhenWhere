package com.whenwhere.main.dao;

import java.util.List;
import java.util.Map;

import com.whenwhere.main.vo.LocationVO;
import com.whenwhere.team.vo.TeamVO;

public interface SearchDAO {
	public String getSubLocation(String loc);
	public List<String> getLocationList(String sub_loc);
	public List<Map<String, Object>> getSubLocationList();
	public List<Map<String, Object>> getEventList(Map<String, Object> map);
	public List<Map<String, Object>> getFoodList(Map<String, Object> map);
	public List<Map<String, Object>> getSearchTeamList(Map<String, Object> map);
}
