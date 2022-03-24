/*
package com.spring.codelog.util.notification;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.codelog.util.notification.service.InotificationService;

@Component
public class NotificationHandler extends TextWebSocketHandler {

	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	//1대1
	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	@Autowired
	InotificationService notifyService;	
	
	//서버에 접속이 성공했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//접속한 전체 유저 아이디
		sessions.add(session);
		//로그인 한 개별 유저 아이디를 가져온다.
		String senderId = getId(session);
		//userSessionMap에 개별유저아이디를 넣는다.
		userSessionMap.put(senderId, session);
	}
	
	//소켓에 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String userId = getId(session);
		Map<String, Object> httpSession = session.getAttributes();
		String loginId = (String) httpSession.get("loginid");
		
		if(loginId != null) {
			//접속한 해당 유저의 읽지 않은 알림 데이터 전체 카운트만 가져올 경우
//			int countInform=informService.countInform(userId);
			
			//1. 해당 유저 알림데이터 전체 가져오기
			list
			
			
		}
		
		
		
		
	}
	
	
	
	
	
	
	
}
*/


































