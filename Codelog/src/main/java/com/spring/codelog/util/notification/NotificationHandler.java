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
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.spring.codelog.util.notification.service.InotificationService;

@Component
public class NotificationHandler extends TextWebSocketHandler {

	@Autowired
	InotificationService notifyService;	
	
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	//1대1
	Map<String, WebSocketSession> userSessionMap = new HashMap<String, WebSocketSession>();
	
	//서버에 접속이 성공했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //클라이언트와 서버가 연결
		
		System.out.println("소켓 연결됨");
		//접속한 전체 유저 아이디
		sessions.add(session);
		//로그인 한 개별 유저 아이디를 가져온다.
		String senderId = getId(session);
		//userSessionMap에 개별유저아이디를 넣는다.
		userSessionMap.put(senderId, session);
	}
	
	//소켓에 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { //메세지
		String userId = getId(session);
		Map<String, Object> httpSession = session.getAttributes();
		String loginId = (String) httpSession.get("loginid");
		
		if(loginId != null) {
			//접속한 해당 유저의 읽지 않은 알림 데이터 전체 카운트만 가져올 경우
//			int countInform=informService.countInform(userId);
			
			//1. 해당 유저 알림데이터 전체 가져오기
			//List<InformDTO> getInform= informService.selectInformDTO(userId);
			//for(InformDTO informDTO : getInform) {
				//System.out.println("getInform : " + informDTO.toString());  
			//}
			
			//2.해당 유저 알림데이터 마지막 데이터만 가져올 경우
	        InformDTO selectLsatInform= informService.selectLsatInform(userId);
	        
	        WebSocketSession webSocketSession = userSessionsMap.get(userId);
	        
	        Gson gson = new Gson();
	        
	        //1.해당 유저 알림데이터 전체 가져오기일 경우 JSON 으로 전환 후 TextMessage 변환
	        //TextMessage textMessage = new TextMessage(gson.toJson(getInform));        
	         
	        //2.해당 유저 알림데이터 전체 가져오기일 경우  JSON 으로 전환 후 TextMessage 변환
	        TextMessage textMessage = new TextMessage(gson.toJson(selectLsatInform));
	        webSocketSession.sendMessage(textMessage);

		}
		
	}
	
	//연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println("afterConnectionClosed " + session + ", " + status);
        //소켓 연결이 끊겼을 때 개별 접속아이디 해체 처리한다.
        userSessionsMap.remove(session.getId());
        //소켓 연결이 끊겼을 때 전체 접속자 아이디 해체 처리한다.
        sessions.remove(session);
	}
	
	// 웹소켓 id 가져오기
    private String getId(WebSocketSession session) {
/*      
        (String)request.getSession().getAttribute("loginId");
        또는 ,
        session.getAttribute("loginId"); 
        이렇게 세션값을 가져오나 여기 웹소켓에서는 세션값을 WebSocketSession session  형태로 가져옵니다.
        따라서 , 다음과 코드 형태로 세션값을 가져옵니다. 
*/
         
        Map<String, Object> httpSession = session.getAttributes();
        String loginId = (String) httpSession.get("loginId");       
        if (loginId == null) {
            //System.out.println("로그인 loginID 가 널일경우  :" + session.getId());
            //랜덤 아이디 생성, 사이트 접속한 사람 전체
            //ex ) vawpuj5h, 5qw40sff
            return session.getId();
        } else {
                        //로그인한 유저 반환
            return loginId;
        }
        
    }
	
}


































