package com.whenwhere.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

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
			// TODO: handle exception
		}
		JSONObject jobj = XML.toJSONObject(buffer);
		return jobj.toString();
	}
}
