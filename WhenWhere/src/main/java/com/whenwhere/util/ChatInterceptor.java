package com.whenwhere.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.whenwhere.user.vo.MemberVO;
import com.whenwhere.websocket.ChatRoomVO;

public class ChatInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(true);
		System.out.println(session.getAttribute("session_roomInfo") );
		if(session.getAttribute("session_roomInfo") != null){
			
			int currentRoom = (Integer) session.getAttribute("session_roomInfo");
	        MemberVO member = (MemberVO) session.getAttribute("member");
	        
	        System.out.println("[session_roomInfo !null]"+ member.getNickname() +"의 채팅방 종료됨.");
	        
			session.removeAttribute("session_roomInfo");
	        
		}
		return true;
	}
}
