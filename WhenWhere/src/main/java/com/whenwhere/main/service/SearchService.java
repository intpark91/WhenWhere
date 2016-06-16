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
import com.whenwhere.main.vo.LocationVO;
import com.whenwhere.team.dao.TeamDAO;
import com.whenwhere.team.vo.TeamVO;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

@Service("searchService")
public class SearchService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> getSubLocationList() {
		SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
		return dao.getSubLocationList();
	}

	public List<String> getLocationList(String sub_loc) {
		SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);
		return dao.getLocationList(sub_loc);
	}

	public List<List<String>> getAllLocationList() {
		List<List<String>> list = new ArrayList<List<String>>();
		List<Map<String, Object>> subLocationList = getSubLocationList();

		for (int i = 0; i < subLocationList.size(); i++) {
			list.add(getLocationList(subLocationList.get(i).get("locSubName").toString())); 
			System.out.println(list.get(i));
		}
		return list;
	}

	public String getSearchList(HttpServletRequest request) {
		SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);

		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String locations[] = request.getParameterValues("locations");
		
		List<Map<String, Object>> searchEventList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> searchFoodList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> searchHotelList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> searchTeamList = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < locations.length; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sDate", sDate);
			map.put("eDate", eDate);
			map.put("location", locations[i]);
			map.put("locSub", "all");
			map.put("loc_code", dao.getSubLocation(locations[i]));

			List<Map<String, Object>> eventlist = dao.getEventList(map);
			List<Map<String, Object>> foodlist = dao.getFoodList(map);
			List<Map<String, Object>> hotellist = hotelCrawler(sDate, eDate, locations[i]);
			List<Map<String, Object>> teamlist = dao.getSearchTeamList(map);

			for (int j = 0; j < eventlist.size(); j++) {
				searchEventList.add(eventlist.get(j));
			}

			for (int j = 0; j < foodlist.size(); j++) {
				searchFoodList.add(foodlist.get(j));
			}

			for (int j = 0; j < hotellist.size(); j++) {
				searchHotelList.add(hotellist.get(j));
			}
			 
			for (int j = 0; j < teamlist.size(); j++) {
				searchTeamList.add(teamlist.get(j));
				System.out.println(searchTeamList.get(j).get("tSDate"));
			}
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("searchEventList", searchEventList);
		jsonObject.put("searchFoodList", searchFoodList);
		jsonObject.put("searchHotelList", searchHotelList);
		jsonObject.put("searchTeamList", searchTeamList);
		return jsonObject.toJSONString();
	}
	
	public String getEventList(HttpServletRequest request){
		SearchDAO dao = sqlSessionTemplate.getMapper(SearchDAO.class);

		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String location = request.getParameter("location");

		List<Map<String, Object>> searchEventList = new ArrayList<Map<String, Object>>();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		map.put("location", "all");
		map.put("locSub", location);

		List<Map<String, Object>> eventlist = dao.getEventList(map);

		for (int j = 0; j < eventlist.size(); j++) {
			searchEventList.add(eventlist.get(j));
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("searchEventList", searchEventList);
		return jsonObject.toJSONString();
	}

	public List<Map<String, Object>> hotelCrawler(String sDate, String eDate, String location) {
		List<Map<String, Object>> list = new ArrayList<>();

		if (location.equals("all")) {
			return list;
		}

		try {
			location = URLEncoder.encode(location, "UTF-8");
			String[] dateSplit = sDate.split("/");
			sDate = dateSplit[2] + "/" + dateSplit[0] + "/" + dateSplit[1];
			dateSplit = eDate.split("/");
			eDate = dateSplit[2] + "/" + dateSplit[0] + "/" + dateSplit[1];

			String url = "https://www.airbnb.co.kr/s/" + location + "?guests=4&checkin=" + sDate + "&checkout=" + eDate
					+ "&ss_id=yaoo0pbg&ss_preload=false&source=bb&s_tag=xlxoS8bY";

			// �ش� URL �������� �����´�.
			Source source = new Source(new URL(url));
			;

			// �޼ҵ� ã�⸦ ���� ���ۺ��� ������ �±׵鸸 parse �Ѵ�
			source.fullSequentialParse();

			// �ش� �����Ͱ� �ִ� �κ��� ã�� �κ�.

			List<Element> divList = source.getAllElements(HTMLElementName.DIV);
			List<Element> divHotelList = new ArrayList<>();
			// List<Element> imgRoomList = new ArrayList<>();

			Element listDiv = null;
			for (int i = 0; i < divList.size(); i++) {
				if (divList.get(i).getAttributeValue("class") != null) {
					if (divList.get(i).getAttributeValue("class").equals("listings-container")) {
						listDiv = divList.get(i);
						break;
					}
				}
			}

			divList = listDiv.getAllElements(HTMLElementName.DIV);
			for (int i = 0; i < divList.size(); i++) {
				if (divList.get(i).getAttributeValue("class") != null) {
					if (divList.get(i).getAttributeValue("class")
							.equals("listing-card-wrapper col-sm-12 col-md-6 space-2")) {
						// ���� DIV List
						divHotelList.add(divList.get(i));
						// ���� IMG List
						// imgRoomList.add(divList.get(i).getAllElements(HTMLElementName.IMG).get(0));

						for (int j = 0; j < divList.get(i).getAllElements(HTMLElementName.SPAN).size(); j++) {
							if (divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
									.getAttributeValue("class") != null) {
								if (divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
										.getAttributeValue("class")
										.equals("rich-toggle wish_list_button wishlist-button")) {

									Map<String, Object> map = new HashMap<>();
									map.put("img",
											divList.get(i).getAllElements(HTMLElementName.IMG).get(0).toString());
									map.put("hotelName", divList.get(i).getAllElements(HTMLElementName.H3).get(0)
											.getAttributeValue("title"));

									map.put("roomType", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
											.getAttributeValue("data-room_type"));
									map.put("hotelType", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
											.getAttributeValue("data-property_type_name"));
									map.put("capacity", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
											.getAttributeValue("data-person_capacity_string"));
									map.put("bedCnt", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
											.getAttributeValue("data-bedrooms_string"));
									map.put("starRating", divList.get(i).getAllElements(HTMLElementName.SPAN).get(j)
											.getAttributeValue("data-star_rating"));
									
									map.put("href", "https://www.airbnb.co.kr" + divList.get(i)
											.getAllElements(HTMLElementName.H3).get(0).getAllElements(HTMLElementName.A)
											.get(0).getAttributeValue("href"));
									map.put("locName", URLDecoder.decode(location, "UTF-8"));

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