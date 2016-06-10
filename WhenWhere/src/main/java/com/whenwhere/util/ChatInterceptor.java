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
		
		if(session.getAttribute("session_roomInfo") != null){
			
			int currentRoom = (Integer) session.getAttribute("session_roomInfo");
	        MemberVO member = (MemberVO) session.getAttribute("member");
	        
	        System.out.println("[session_roomInfo !null]"+ member.getNickname() +"의 채팅방 종료됨.");
	        
	        ServletContext application =  (ServletContext) session.getServletContext();
	        Map<Integer,ChatRoomVO> roomM = (HashMap<Integer,ChatRoomVO>) application.getAttribute("roomListM");
			List<Integer> roomA = (ArrayList<Integer>) application.getAttribute("roomNumList");
			
			ChatRoomVO room = roomM.get(currentRoom);
			for(int i=0;i<roomA.size();i++){
				if(roomA.get(i) == currentRoom){
					
					session.removeAttribute("session_roomInfo");
					
					if(room.getUserList().size()>1){
						
						List<String> list = room.getUserList();
						for(int j=0;j<list.size();j++){
							if(list.get(j).equals(member.getNickname()))
								list.remove(j);
						}
						break;
					}
					roomA.remove(i);
					roomM.remove(currentRoom);
				}
			}
	        
		}
		return true;
	}
}
