package com.whenwhere.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.stereotype.Service;

@Service
public class WeatherService {
	public void getWeatherInfo() throws IOException{
		String urlStr = "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		URL url = new URL(urlStr);
		
		URLConnection connection = url.openConnection();
		
		connection.setDoOutput(true);
		
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
		
		String inputLine;
		String buffer = "";
		
		while((inputLine = in.readLine())!=null){
			buffer += inputLine.trim();
		}
		in.close();
		
		System.out.println(buffer);
	}
}
