package com.spring.codelog.util.socket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {
	
	//로그인중인 개별 유저
	//Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	//클라이언트가 서버로 연결 시
	//@Override
	//public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	//	String senderId = getUserId(session);
	//}
	
	//웹소켓에 id 가져오기
	//접속한 유저의 http

}






