package com.whenwhere.main.service;

import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whenwhere.main.dao.SearchDAO;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

@Service("searchService")
public class SearchService {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   public List<String> getSubLocationList(){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return dao.getSubLocationList();
   }
   
   public List<String> getLocationList(String sub_loc){
      SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
      return dao.getLocationList(sub_loc);
   }
   
   public List<List<String>> getAllLocationList(){
      List<List<String>> list = new ArrayList<List<String>>();
      List<String> subLocationList = getSubLocationList();
      
      for(int i=0; i<subLocationList.size(); i++){
    	  list.add(getLocationList(subLocationList.get(i)));
      }
      
      return list;
   }
   
   public String getSearchList(HttpServletRequest request){
	  SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
	  
	  String sDate = request.getParameter("sDate");
	  String eDate = request.getParameter("eDate");
	  String locations[] = request.getParameterValues("locations");
	  
	  List<Map<String, Object>> searchEventList = new ArrayList<Map<String, Object>>();
	  List<Map<String, Object>> searchFoodList = new ArrayList<Map<String, Object>>();
	  List<Map<String, Object>> searchHotelList = new ArrayList<Map<String, Object>>();
	  
	  System.out.println(sDate+"::"+eDate+"::"+locations.length);

	  for(int i=0; i<locations.length; i++){
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  map.put("sDate", sDate);
		  map.put("eDate", eDate);
		  map.put("location", locations[i]);
		  
		  List<Map<String, Object>> eventlist = dao.getEventList(map);
		  List<Map<String, Object>> foodlist = dao.getFoodList(map);
		  List<Map<String, Object>> hotellist = hotelCrawler(sDate, eDate, locations[i]);
		  
		  for(int j=0; j<eventlist.size(); j++){
			  searchEventList.add(eventlist.get(j));
			  System.out.println(searchEventList.size()+"::"+eventlist.get(j).get("title")+","+eventlist.get(j).get("eSDate"));
		  }

		  for(int j=0; j<foodlist.size(); j++){
			  searchFoodList.add(foodlist.get(j));
			  System.out.println(searchFoodList.size()+"::"+foodlist.get(j).get("foodName")+","+foodlist.get(j).get("fSDate"));
		  }
		  
		  for(int j=0; j<hotellist.size(); j++){
			  searchHotelList.add(hotellist.get(j));
		  }
		  System.out.println(searchHotelList.size()+"::");
		  
	  }
	  JSONObject jsonObject = new JSONObject();
	  jsonObject.put("searchEventList", searchEventList);
	  jsonObject.put("searchFoodList", searchFoodList);
	  jsonObject.put("searchHotelList", searchHotelList);
      return jsonObject.toJSONString();
   }
   
   public List<Map<String, Object>> hotelCrawler(String sDate, String eDate, String location){
	   List<Map<String, Object>> list = new ArrayList<>();
	   
	   if(location.equals("all")){
		   return list;
	   }
	   
	   try {
		   location = URLEncoder.encode(location, "UTF-8");
		   String[] dateSplit = sDate.split("/");
		   sDate = dateSplit[2]+"/"+dateSplit[0]+"/"+dateSplit[1];
		   dateSplit = eDate.split("/");
		   eDate = dateSplit[2]+"/"+dateSplit[0]+"/"+dateSplit[1];

		   String url = "https://www.airbnb.co.kr/s/"+location+"?guests=4&checkin="+sDate+"&checkout="+eDate+"&ss_id=yaoo0pbg&ss_preload=false&source=bb&s_tag=xlxoS8bY";

		   //해당 URL 페이지를 가져온다.
		   Source source = new Source(new URL(url));;

		   //메소드 찾기를 위해 시작부터 끝까지 태그들만 parse 한다
		   source.fullSequentialParse();

		   //해당 데이터가 있는 부분을 찾는 부분.

		   List<Element> divList = source.getAllElements(HTMLElementName.DIV);
		   List<Element> divHotelList = new ArrayList<>();
		   //List<Element> imgRoomList = new ArrayList<>();

		   Element listDiv = null;
		   for(int i=0; i<divList.size(); i++){
			   if(divList.get(i).getAttributeValue("class")!=null){
				   if(divList.get(i).getAttributeValue("class").equals("listings-container")){
					   listDiv = divList.get(i);
					   break;
				   }
			   }
		   }

		   divList = listDiv.getAllElements(HTMLElementName.DIV);
		   for(int i=0; i<divList.size(); i++){
			   if(divList.get(i).getAttributeValue("class")!=null){
				   if(divList.get(i).getAttributeValue("class").equals("listing-card-wrapper col-sm-12 col-md-6 space-2")){
					   //숙소 DIV List
					   divHotelList.add(divList.get(i));
					   //숙소 IMG List
					   //imgRoomList.add(divList.get(i).getAllElements(HTMLElementName.IMG).get(0));
					   
					   for(int j=0; j<divList.get(i).getAllElements(HTMLElementName.SPAN).size(); j++){
						   if(divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("class")!=null){
							   if(divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("class").equals("rich-toggle wish_list_button wishlist-button")){
								   
								   Map<String, Object> map = new HashMap<>();
								   map.put("img", divList.get(i).getAllElements(HTMLElementName.IMG).get(0).toString());
								   map.put("hotelName", divList.get(i).getAllElements(HTMLElementName.H3).get(0).getAttributeValue("title"));
								   
								   map.put("roomType", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("data-room_type"));
								   map.put("hotelType", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("data-property_type_name"));
								   map.put("capacity", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("data-person_capacity_string"));
								   map.put("bedCnt", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j).getAttributeValue("data-bedrooms_string"));
								   map.put("href", "https://www.airbnb.co.kr"+divList.get(i).getAllElements(HTMLElementName.H3).get(0).getAllElements(HTMLElementName.A).get(0).getAttributeValue("href"));
								   map.put("locName", URLDecoder.decode(location,"UTF-8"));
								   
								   list.add(map); 
							   }
						   }
					   }

				   }
			   }
		   }

	   } catch (Exception e) {
		   e.printStackTrace();
	   }

	   return list;
   }

}