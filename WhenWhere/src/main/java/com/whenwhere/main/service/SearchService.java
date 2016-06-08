package com.whenwhere.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.JsonSerializer;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.main.dao.SearchDAO;

@Service("searchServive")
public class SearchService {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   /*public List<String> getSubLocationList(){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return dao.getSubLocationList();
   }*/
   
   public List<String> getLocationList(String sub_loc){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return dao.getLocationList(sub_loc);
   }
   
   public List<List<String>> getAllLocationList(){
      List<List<String>> list = new ArrayList<List<String>>();
      list.add(getLocationList("서울"));
      list.add(getLocationList("경기"));
      list.add(getLocationList("영서"));
      list.add(getLocationList("영동"));
      list.add(getLocationList("충북"));
      list.add(getLocationList("충남"));
      list.add(getLocationList("경북"));
      list.add(getLocationList("경남"));
      list.add(getLocationList("전북"));
      list.add(getLocationList("전남"));
      list.add(getLocationList("제주"));
      
      return list;
   }
   
   public String getSearchList(HttpServletRequest request){
	  SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
	  
	  String sDate = request.getParameter("sDate");
	  String eDate = request.getParameter("eDate");
	  String locations[] = request.getParameterValues("locations");
	  System.out.println(sDate+","+eDate+","+locations.length);
	  
	  List<Map<String, Object>> searchEventList = new ArrayList<Map<String, Object>>();
	  List<Map<String, Object>> searchFoodList = new ArrayList<Map<String, Object>>();
	  for(int i=0; i<locations.length; i++){
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("sDate", sDate);
		  map.put("eDate", eDate);
		  map.put("location", locations[i]);
		  
		  List<Map<String, Object>> list = dao.getEventList(map);
		  
		  System.out.println(list.size()+"::"+list.get(0).get("title")+","+list.get(0).get("sDate"));
		  
		  for(int j=0; j<list.size(); j++){
			  searchEventList.add(list.get(j));
		  }
	  }
	  
	  JSONObject jsonObject = new JSONObject();
	  jsonObject.put("searchEventList", searchEventList);
	  jsonObject.put("searchFoodList", searchFoodList);
	  System.out.println(jsonObject.toJSONString());
      return jsonObject.toJSONString();
   }
   

}