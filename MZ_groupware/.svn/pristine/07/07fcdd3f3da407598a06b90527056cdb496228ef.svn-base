package com.spring.msg.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.msg.dto.MessageVO;

public interface MessageService {
	
	// 수신함 조회
	Map<String, Object> getReceiveList(MessageVO msgVO) throws SQLException;
	
	// 발신함 조회
	Map<String, Object> getSendList(MessageVO msgVO) throws SQLException;
	
	//쪽지 상세
	MessageVO getMessage(int mssNo, String pageType) throws SQLException;
	MessageVO getMainMessage(int mssNo) throws SQLException;
	
	//쪽지보내기
	void regist(MessageVO msg) throws SQLException;
	
	//수신함 쪽지 삭제
	void recRemove(int mssNo) throws SQLException;
	
	//수신함 쪽지 삭제
	void sendRemove(int mssNo) throws SQLException;
}
