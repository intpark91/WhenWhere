package com.whenwhere.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

@Service
public class WeatherService {
	
	//하늘 상태
	private static final String SUNNY = "S";
	private static final String CLOUD = "C";
	private static final String DARK = "D";
	//날씨
	private static final String RAIN = "R";
	private static final String SNOW = "S";
	//양
	private static final String HEAVY = "H";
	private static final String LIGHT = "L";
	
	public String getWeatherInfo(String locName) {
		String locNameRegex = ".*["+locName.charAt(0)+"].{0,1}["+locName.charAt(1)+"].*";
		String urlStr = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		String buffer = "";
		try {
			URL url = new URL(urlStr);
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				buffer += inputLine.trim();
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject jobj = XML.toJSONObject(buffer);
		JSONObject rss = (JSONObject) jobj.get("rss");
		JSONObject channel = (JSONObject) rss.get("channel");
		JSONObject item = (JSONObject) channel.get("item");
		JSONObject description = (JSONObject) item.get("description");
		JSONObject body = (JSONObject) description.get("body");
		JSONArray locArr= (JSONArray) body.get("location");
		
		JSONObject jsonObject = new JSONObject();
		List<String> weathers = new ArrayList<>();
		for(int i = 0; i<locArr.length(); i++){
			JSONObject loc = (JSONObject) locArr.get(i);
			String province = loc.get("province").toString();
			
			if(province.matches(locNameRegex)){
				System.out.println(province);
				JSONArray dataArr = (JSONArray) loc.get("data");
				for(int j=0; j<dataArr.length();j++){
					JSONObject data = (JSONObject) dataArr.get(j);
					String timeOfDay = data.get("tmEf").toString();
					String date = timeOfDay.split(" ")[1];
					if(date.equals("00:00")){
						System.out.println(data.get("tmEf") + " : " + data.get("wf"));
						weathers.add(changeWftoWfcode(data.get("wf").toString()));
					}
				}
				break;
			}
		}
		jsonObject.put("ok", true);
		jsonObject.put("wf", weathers);
		System.out.println(jsonObject.toString());
		return jsonObject.toString();
	}
	
	private String changeWftoWfcode(String wf){
		String code="";
		if(wf.matches(".*[맑].*")){
			code += SUNNY;
		}
		if(wf.matches(".*[구름].*")){
			code += CLOUD;
		}
		if(wf.matches(".*[흐].*")){
			code += DARK;
		}
		if(wf.matches(".*[조금].*")){
			code += LIGHT;
		}
		if(wf.matches(".*[많].*")){
			code += HEAVY;
		}
		if(wf.matches(".*[비].*")){
			code += RAIN;
		}
		if(wf.matches(".*[눈].*")){
			code += SNOW;
		}
		return code;
	}
}