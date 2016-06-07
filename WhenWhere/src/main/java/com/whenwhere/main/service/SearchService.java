package com.whenwhere.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.main.dao.SearchDAO;
import com.whenwhere.main.vo.SearchVO;

@Service("searchService")
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
   
   public List<SearchVO> getSearchList(HttpServletRequest request){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return null;
   }
   

}