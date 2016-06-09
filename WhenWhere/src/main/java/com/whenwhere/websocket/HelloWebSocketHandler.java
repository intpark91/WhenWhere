package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.whenwhere.user.vo.MemberVO;

public class HelloWebSocketHandler extends TextWebSocketHandler {
	
	static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
  
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("클라이언트 접속됨");
        
        sessions.add(session);
        
        HttpSession Hsession = (HttpSession) session.getAttributes().get("session");
        MemberVO member = (MemberVO) Hsession.getAttribute("member");
        
        msgToAll("admin", member.getNickname()+" 님이 접속 하였습니다.");
    }
    
    @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
    	String str = (String) message.getPayload();

    	JSONParser jsonParser = new JSONParser();
    	try {
    		JSONObject jsonObj = (JSONObject)jsonParser.parse(str);
    		System.out.println(str);
    		
    		String name = (String) jsonObj.get("name");
    		System.out.println("이름:"+name);
    		
    		String msg = (String) jsonObj.get("msg");
    		System.out.println("msg:"+msg);
    		
    		msgToAll(name,msg);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
	}

	// 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("클라이언트 접속해제");
        sessions.remove(session);
        
        HttpSession Hsession = (HttpSession) session.getAttributes().get("session");
        MemberVO member = (MemberVO) Hsession.getAttribute("member");
        
        msgToAll("admin", member.getNickname() +" 님이 접속 종료하였습니다.");
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        System.out.println("전송오류 발생");
    }
    
    public void msgToAll(String user,String message) {
    	JSONObject obj = new JSONObject();
    	obj.put("name", user);
    	obj.put("msg", message);
    	
        for (int i = 0; i < sessions.size(); i++) {
           try {
              sessions.get(i).sendMessage(new TextMessage(obj.toJSONString()));
           } catch (Exception e) {
              e.printStackTrace();
           }
        }
    }
}

