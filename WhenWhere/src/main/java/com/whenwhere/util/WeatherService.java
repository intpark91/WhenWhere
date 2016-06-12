package com.whenwhere.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Service;

@Service
public class WeatherService {
	
	public String getWeatherInfo() {
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
		for(int i = 0; i<locArr.length(); i++){
			JSONObject loc = (JSONObject) locArr.get(i);
			System.out.println(loc.get("province").toString());
			System.out.println(loc.get("city").toString());
		}
		/*for(int j = 0; j<locArr.length();j++){
			JSONObject jobj2 = (JSONObject) locArr.get(j);
			System.out.println(jobj2.get("city").toString());
			jobj2 = (JSONObject) locArr.get(0);
			locArr = jobj2.getJSONArray("data");
			for(int i =0; i<locArr.length();i++){
				String str1=((JSONObject)locArr.get(i)).get("tmEf").toString();
				String str2=((JSONObject)locArr.get(i)).get("wf").toString();
				String reg[] = str1.split(" ");
				if(reg[1].equals("00:00")){
					System.out.println(str1 + " : " + str2);
				}
			}
		}*/
		return jobj.toString();
	}
}
