package com.spring.socket;
 
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.dto.EmployeeVO;
import com.spring.notification.dto.NotificationVO;
import com.spring.notification.service.NotificationService;
import com.spring.service.EmployeeService;
 
public class EchoHandler extends TextWebSocketHandler{

	// 로그인중인 개별유저
	public static Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private EmployeeService employeeService;
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String empNo = getEmpNo(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(empNo!=null) {	// 로그인 값이 있는 경우만
			log(empNo + " 연결 됨");
			users.put(empNo, session);   // 로그인중 개별유저 저장
		}
	}
	
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs.length == 3) {
				List<EmployeeVO> empList = employeeService.getList();
				for(EmployeeVO emp : empList) {
					NotificationVO notification = new NotificationVO();
					notification.setEmpNo(emp.getEmpNo());
					notification.setNotificationContent(strs[1]);
					notification.setNotificationType("공지");
					notification.setNotificationUrl(strs[2]);
					int notiNo = notificationService.insertNotification(notification);

					WebSocketSession boardWriterSession = users.get(emp.getEmpNo());
					
					if(boardWriterSession != null) {
						TextMessage tmpMsg = new TextMessage("[공지] 새로운 공지가 등록되었습니다.$$[공지] " + strs[1]
															 + "$$" + notiNo
															 + "$$" + strs[2] + "$$" + emp.getEmpNo()); 
						boardWriterSession.sendMessage(tmpMsg);
					}
				}
			} else {
				String type = strs[0];
				String empNo = strs[1]; 
				String content = strs[2];
				String send = strs[3];
				String url = strs[4];
				
				if(empNo.indexOf("/") == -1) {
					NotificationVO notification = new NotificationVO();
					notification.setEmpNo(empNo);
					notification.setNotificationContent(content);
					notification.setNotificationUrl(url);
					notification.setNotificationType(type);
					int notiNo = notificationService.insertNotification(notification);
					
					//작성자가 로그인 해서 있다면
					WebSocketSession boardWriterSession = users.get(empNo);
					
					if(boardWriterSession != null) {
						TextMessage tmpMsg = new TextMessage("[" + type + "] " + send + "$$[" + type + "] " + content 
								+ "$$" + notiNo
								+ "$$" + url + "$$" + empNo); 
						boardWriterSession.sendMessage(tmpMsg);
					}
				} else {
					String[] empNos = empNo.split("/");
					for(String no : empNos) {
						NotificationVO notification = new NotificationVO();
						notification.setEmpNo(no);
						notification.setNotificationContent(content);
						notification.setNotificationUrl(url);
						notification.setNotificationType(type);
						int notiNo = notificationService.insertNotification(notification);
						
						//작성자가 로그인 해서 있다면
						WebSocketSession boardWriterSession = users.get(no);
						
						if(boardWriterSession != null) {
							TextMessage tmpMsg = new TextMessage("[" + type + "] " + send + "$$[" + type + "] " + content 
																+ "$$" + notiNo
																+ "$$" + url + "$$" + no); 
							boardWriterSession.sendMessage(tmpMsg);
						}
					}
				}
			}
		}
	}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String empNo = getEmpNo(session);
		if(empNo!=null) {	// 로그인 값이 있는 경우만
			log(empNo + " 연결 종료됨");
			users.remove(empNo);
		}
	}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getEmpNo(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		EmployeeVO emp = (EmployeeVO) httpSession.get("loginUser"); // 세션에 저장된 m_id 기준 조회
		String empNo = emp.getEmpNo();
		return empNo == null ? null : empNo;
	}
}