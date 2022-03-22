package com.spring.codelog.util.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.codelog.user.model.UserVO;

public class WebSocketHandler extends TextWebSocketHandler {
	
	//로그인 한 전체 유저
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//로그인중인 개별 유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	//클라이언트가 서버로 연결 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getUserId(session);
		if(senderId != null) {
			System.out.println("소켓log: " + senderId + "연결됨");
			users.put(senderId, session); //로그인 중인 개별유저 저장
		}
	}
	
	//클라이언트가 데이터 전송 시 (좋아요?)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getUserId(session);
		//특정 유저에게 보내기
		String msg = message.getPayload();
		if(msg != null) {
			//ajax 통신으로 보낼 data임. 일단 임의로 type, target, content, url로 작성함. 뭘 보낼지 파악하고 수정해야함.
			//1. 좋아요 눌리는 곳(게시글 상세보기 페이지)에서 좋아요 클릭 이벤트 처리 작성
			//2. ajax로 데이터 보내줘야함 -> 전송한 정보를 db에 저장
			//3. db전송 성공 시 (ajax success: function() {여기에 soket.send()메서드로 소켓에 메세지 전달} -> db전송 성공 시 실시간 알림 전송
			String[] strs = msg.split(",");
			System.out.println("소켓log 이게뭐임...?: " + strs.toString());
			if(strs != null && strs.length == 4) {
				String type = strs[0]; //ajax data: type
				String target = strs[1]; //ajax data: target 알림 메세지를 받을 유저 아이디. 좋아요버튼이 눌릴 때..? 글 상세보기 파라미터에서 작성자 id나 번호 가져와야할듯...?
				String content = strs[2]; //ajax data: content 쪽지기능이 아니라 필요없을듯. 댓글/좋아요/팔로우? 구분하는 용도?
				String url = strs[3]; //ajax data: url
				WebSocketSession targetSession = users.get(target); //메세지를 받을 세션 조회
				
				//실시간 접속 시
				if(targetSession != null) {
					//ㅇㅇㅇ님이 회원님의 게시물을 좋아합니다.
					//tmpMsg 일단 그냥 복붙 아무거나 써둠 수정해야함
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>");
					targetSession.sendMessage(tmpMsg);
				}
				
				
			}
		}
	}
	
	
	
	//연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getUserId(session);
		if(senderId != null) { //로그인 값이 있는 경우만
			System.out.println("소켓log: " + senderId + "소켓연결 종료됨");
			users.remove(senderId);
			sessions.remove(session);
		}
	}
	
	
	
	//에러 발생 시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("소켓log: " + session.getId() + "익셉션 발생: " + exception.getMessage());
	}

	
	
	//웹소켓에 id 가져오기
	//접속한 유저의 http세션을 조회하여 id를 얻는 메서드
	private String getUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO) httpSession.get("loginSession");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getUserId();
		}
	}

}






