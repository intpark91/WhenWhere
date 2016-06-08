package com.whenwhere.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SearchDAO {
	public List<String> getLocationList(String sub_loc);
	public List<Map<String, Object>> getEventList(Map<String, Object> map);
}
