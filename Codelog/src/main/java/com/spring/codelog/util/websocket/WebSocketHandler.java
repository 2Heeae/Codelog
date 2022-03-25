package com.spring.codelog.util.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.codelog.user.model.UserVO;


@Repository
public class WebSocketHandler extends TextWebSocketHandler {
	
	//로그인중인 유저 1:1
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	//웹소켓 클라이언트와 서버 연결되었을 때 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getLoginId(session); //접속한 유저의 http세션을 조회해서 id를 얻음
		if(StringUtils.isNotEmpty(senderId)) { //로그인 한 경우
			System.out.println("소켓 연결 됨: " + senderId);
			users.put(senderId, session); //로그인중인 개별 유저 저장
		}
		
	}

	//웹소켓 클라이언트가 텍스트 메시지를 전송할 때(클라이언트가 데이터 전송) 호출
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getLoginId(session);
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			
			String[] strs = msg.split(",");
			System.out.println("msg값: " + strs.toString());
			
			if(strs != null && strs.length == 3) {
				String viewUser = strs[0]; //글 보는 사람 아이디
				String writer = strs[1]; //글 쓴 사람 아이디
				String likeChk = strs[2]; //좋아요 눌렀는지 여부
				
				String comment = "";
				if(likeChk.equals("0")) {
					comment = " 좋아요를 취소했습니다.";
				} else if(likeChk.equals("1")) {
					comment = "을 좋아합니다.";
				}
				
				//WebSocketSession targetSession = users.get(writer);  //메세지 받을 세션 조회
				WebSocketSession targetSession = users.get(writer);  //메세지 받을 세션 조회
				
				// 실시간 접속시
				if(targetSession!=null) {
					// ex 둘리님이 고길동님의 게시물을 좋아합니다.
					TextMessage txtMsg = new TextMessage(viewUser + "님이 " + writer + "님의 게시물" + comment);
					targetSession.sendMessage(txtMsg); //글 작성자에게 알려줌
				} else {
					TextMessage txtMsg = new TextMessage(viewUser + "님이 " + writer + "님의 게시물" + comment);
					session.sendMessage(txtMsg); //나한테 보여줘서 보내지는지 체크하는 용도로 썼음
				}
			}
		}
	}

	//웹소켓 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getLoginId(session);
		if(senderId != null) { //로그인 한 경우
			System.out.println(senderId + " 소켓 연결 종료");
			users.remove(senderId);
		}
		
	}
	
	//에러 발생 시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("소켓 익셉션 발생: " + exception.getMessage());

	}
	
//	//로그인한 유저의 http세션을 조회하여 id를 얻는 메서드
//	private String getLoginId(WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//		String userId = (String) httpSession.get("userId");
//		System.out.println("로그인 한 아이디 : " + userId);
//		return userId == null? null : userId;
//	}
	
	//로그인한 유저의 http세션을 조회하여 id를 얻는 메서드
	private String getLoginId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("loginSession");
		
		String userId = loginUser.getUserId();
		
		System.out.println("로그인 한 아이디 : " + userId);
		
		return loginUser == null ? null : userId;
		
	}
	
}
