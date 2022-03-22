package com.spring.codelog.util.socket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class WebSocketHandler extends TextWebSocketHandler {
	
	//웹 소켓 세션을 저장할 리스트(전체 로그인 세션)
	List<WebSocketSession> sessionList = new ArrayList<>();
	
	//1:1
	//Map<String, WebSocketSession> userSessionMap = new HashMap<>();
	
	//클라이언트와 연결 된 후 (서버에 접속 성공했을 때)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		//세션값을 불러온 0번째 중괄호에 session.getId()를 넣어라.
		//logger.info("{} 연결됨", session.getId());
		
		//Session값을 
	}
	
	//소켓에 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//String senderUserNo = getUserNo(session);
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
	}

}
