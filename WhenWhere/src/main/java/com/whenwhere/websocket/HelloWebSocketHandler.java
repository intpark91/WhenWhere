package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.HashMap;
<<<<<<< HEAD
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
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
        sessions.add(session);
        
        HttpSession Hsession = (HttpSession) session.getAttributes().get("session");
        MemberVO member = (MemberVO) Hsession.getAttribute("member");
        
        msgToAll(session,"admin", member.getNickname()+" 님이 접속 하였습니다.");
    }
    
    @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
    	String str = (String) message.getPayload();

    	JSONParser jsonParser = new JSONParser();
    	try {
    		JSONObject jsonObj = (JSONObject)jsonParser.parse(str);
    		System.out.println(str);
    		
    		String name = (String) jsonObj.get("name");
    		String msg = (String) jsonObj.get("msg");
    		
    		msgToAll(session,name,msg);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
	}

	// 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        HttpSession Hsession = (HttpSession) session.getAttributes().get("session");
        MemberVO member = (MemberVO) Hsession.getAttribute("member");
        String nickname = member.getNickname();
        int currentRoom = 0;
        
        ServletContext application =  (ServletContext) Hsession.getServletContext();
        Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
		List<Integer> roomA = (ArrayList<Integer>) application.getAttribute("roomNumList");
		
		Iterator<Integer> keys = roomM.keySet().iterator();
        while( keys.hasNext() ){
            int key = keys.next();
            ChatRoomVO room = roomM.get(key);
            List<String> roomList = room.getUserList();
            for(int i=0;i<roomList.size();i++){
            	if(roomList.get(i).equals(nickname)){
            		currentRoom = room.getRoomNum();
            		System.out.println("서버에 저장된 방번호"+currentRoom);
            		if(roomList.size()>1){
    					roomList.remove(i);
    				}else{
    					roomM.remove(key);
    					for(int k=0;k<roomA.size();k++){
    			        	if(roomA.get(i).equals(currentRoom))
    			        		roomA.remove(i);
    			        }
    				}
            		break;
            	}
            }
        }
        
        if(Hsession.getAttribute("session_roomInfo")!=null)
        	Hsession.removeAttribute("session_roomInfo");
        
        endMsgToAll(currentRoom, application, "admin", member.getNickname() +" 님이 접속 종료하였습니다.");
        
        sessions.remove(session);
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        System.out.println("전송오류 발생");
    }
    
    public void msgToAll(WebSocketSession session,String user,String message) {
    	
    	HttpSession Httpsession = (HttpSession) session.getAttributes().get("session");
        int currentRoom = (Integer) Httpsession.getAttribute("session_roomInfo");
        
        System.out.println("MSG[현재방번호]"+currentRoom);
        
        ServletContext application =  (ServletContext) Httpsession.getServletContext();
        Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
        ChatRoomVO room = roomM.get(currentRoom);
        List<String> userList = room.getUserList();
        
       /* System.out.println("MSG[roomMsIZE]"+roomM.size());
        System.out.println("MSG[userListsIZE]"+userList.size());
        System.out.println("MSG[sessionsIZE]"+sessions.size());*/
        
    	JSONObject obj = new JSONObject();
    	obj.put("name", user);
    	obj.put("msg", message);
    	
        for (int i = 0; i < sessions.size(); i++) {
        	for(int j=0; j< userList.size();j++){
        		HttpSession Hsession = (HttpSession) sessions.get(i).getAttributes().get("session");
        		MemberVO member = (MemberVO) Hsession.getAttribute("member");
        		String nickname = member.getNickname();
        		if(userList.get(j).equals(nickname)){
        			System.out.println("userList.get(j).equals(nickname)"+nickname);
		           try {
		              sessions.get(i).sendMessage(new TextMessage(obj.toJSONString()));
		           } catch (Exception e) {
		              e.printStackTrace();
		           }
        		}
        	}
        }
    }
    
    public void endMsgToAll(int roomNum, ServletContext application2, String user,String message) {
    	
        
        System.out.println("endMsgToAll[현재방번호]"+roomNum);
        
        ServletContext application =  application2;
        Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
        ChatRoomVO room = roomM.get(roomNum);
        List<String> userList = room.getUserList();
        
        System.out.println("MSG[roomMsIZE]"+roomM.size());
        System.out.println("MSG[userListsIZE]"+userList.size());
        System.out.println("MSG[sessionsIZE]"+sessions.size());
        
    	JSONObject obj = new JSONObject();
    	obj.put("name", user);
    	obj.put("msg", message);
    	
        for (int i = 0; i < sessions.size(); i++) {
        	for(int j=0; j< userList.size();j++){
        		HttpSession Hsession = (HttpSession) sessions.get(i).getAttributes().get("session");
        		MemberVO member = (MemberVO) Hsession.getAttribute("member");
        		String nickname = member.getNickname();
        		if(userList.get(j).equals(nickname)){
        			System.out.println("userList.get(j).equals(nickname)"+nickname);
		           try {
		              sessions.get(i).sendMessage(new TextMessage(obj.toJSONString()));
		           } catch (Exception e) {
		              e.printStackTrace();
		           }
        		}
        	}
=======
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
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
        int currentRoom = (Integer) Hsession.getAttribute("session_roomInfo");
        MemberVO member = (MemberVO) Hsession.getAttribute("member");
        
        ServletContext application =  (ServletContext) Hsession.getServletContext();
        Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
		List<Integer> roomA = (ArrayList<Integer>) application.getAttribute("roomNumList");
		
		roomM.remove(currentRoom);
		for(int i=0;i<roomA.size();i++){
			if(roomA.get(i) == currentRoom){
				System.out.println("리스트 탐색 성공");
				roomA.remove(i);
			}
		}
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
>>>>>>> refs/heads/main_js
        }
    }
}

