package com.whenwhere.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class HelloWebSocketHandler extends TextWebSocketHandler {
	
	static List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
    // 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("클라이언트 접속됨");
        sessions.add(session);
    }
    
    @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(int i=0;i<sessions.size();i++){
			System.out.println("'서버에서받은 메세지'"+message);
			sessions.get(i).sendMessage(message);
		}
	}

	// 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("클라이언트 접속해제");
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        System.out.println("전송오류 발생");
    }
}

