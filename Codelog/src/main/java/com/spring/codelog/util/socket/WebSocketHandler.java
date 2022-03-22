//package com.spring.codelog.util.socket;
//
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.ConcurrentHashMap;
//
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.spring.codelog.user.model.UserVO;
//
//
//public class WebSocketHandler extends TextWebSocketHandler {
//	
//	//로그인 한 전체
//	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
//	
//	//1대1
//	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
//	
//	//서버에 접속이 성공했을 때
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		sessions.add(session);
//		
//		String senderId = getUserId(session);
//		userSessionMap.put(senderId, session);
//	}
//	
//	//소켓에 메세지를 보냈을 때
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		//protocol : cmd, 
//		String msg = message.getPayload();
//		if(StringUtils.isNotEmpty(msg)) {
//			String[] strs = msg.split(",");
//			System.out.println(strs.toString());
//			if(strs != null && strs.length == 4) {
//				String type = strs[0];
//				String target = strs[1]; //id 저장
//				String content = strs[2];
//				String url = strs[3];
//				
//				//메세지를 받을 세션 조회
//				WebSocketSession targetSession = 
//			}
//			
//		}
//	}
//	
//	//웹소켓 userNo 가져오기
//	private String getUserId(WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//		UserVO loginUser = (UserVO) httpSession.get("userId");
//		
//		if(loginUser == null) {
//			return session.getId();
//		} else {
//			return loginUser.getUserId();
//		}
//		
//	}
//	
//	
//	
//
//}






