package com.whenwhere.main.service;

import java.util.ArrayList;
import java.util.List;

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
      list.add(getLocationList("����"));
      list.add(getLocationList("���"));
      list.add(getLocationList("����"));
      list.add(getLocationList("����"));
      list.add(getLocationList("���"));
      list.add(getLocationList("�泲"));
      list.add(getLocationList("���"));
      list.add(getLocationList("�泲"));
      list.add(getLocationList("����"));
      list.add(getLocationList("����"));
      list.add(getLocationList("����"));
      
      return list;
   }
   
   public List<SearchVO> getSearchList(){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return null;
   }
   

}