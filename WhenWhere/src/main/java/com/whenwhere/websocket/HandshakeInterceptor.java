package com.whenwhere.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.whenwhere.user.vo.MemberVO;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After HandShake");
		super.afterHandshake(request, response, wsHandler, ex);
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse arg1, WebSocketHandler arg2,
			Map<String, Object> websocketMap) throws Exception {
		
		System.out.println("Before handshake");
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest)request;
		
		HttpServletRequest req = ssreq.getServletRequest();
<<<<<<< HEAD
		HttpSession session = req.getSession(false);
		MemberVO mem = (MemberVO)session.getAttribute("member");
		System.out.println("handshake"+mem.getNickname());
=======
		
		HttpSession session = req.getSession();
		MemberVO mem = (MemberVO)session.getAttribute("member");
>>>>>>> refs/heads/main_js
		websocketMap.put("session", session);
		
		return super.beforeHandshake(request, arg1, arg2, websocketMap);
	}
	
}
