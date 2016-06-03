package com.whenwhere.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After HandShake");
		super.afterHandshake(request, response, wsHandler, ex);
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse arg1, WebSocketHandler arg2,
			Map<String, Object> arg3) throws Exception {
		
		System.out.println("Before handshake");
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest)request;
		
		System.out.println("URI:"+request.getURI());
		HttpServletRequest req = ssreq.getServletRequest();
		
		System.out.println("전달된 ID:"+req.getParameter("id"));
		String userId = req.getParameter("id");
		
		arg3.put("userId", userId);
		//핸드쉐이크 인터셉터맵에 put을 할경우 controller격인 웹소켓 session에 들어가게된다.
		// 오직 beforeHandshak()에서만 가능하다. 
		// 이곳에서 map에 id를 넣어주면 simpleWebsocketHandler에서 세션을 꺼내쓸수있다.
		return super.beforeHandshake(request, arg1, arg2, arg3);
	}
	
}
