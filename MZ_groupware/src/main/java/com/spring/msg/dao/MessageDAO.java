package com.spring.msg.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.msg.dto.MessageVO;

public interface MessageDAO {
	//수신함
	List<MessageVO> selectReceiveAllMessageList(MessageVO msgVO) throws SQLException;
	
	//발신함
	List<MessageVO> selectSendAllMessageList(MessageVO msgVO) throws SQLException;
	
	//쪽지 상세
	MessageVO selectMessageByMssNo(int mssNo) throws SQLException;
	
	//쪽지 읽음 처리
	void chmodOpenStat(int mssNo) throws SQLException;
	
	//수신함 목록 개수
	int selectReceiveAllListCount(MessageVO msgVO) throws SQLException;
	
	//발신함 목록 개수
	int selectSendAllListCount(MessageVO msgVO) throws SQLException;
	
	//쪽지보내기
	void insertMessage(MessageVO msg) throws SQLException;
	
	//수신함 쪽지 삭제
	void deleteRecMessage(int mssNo) throws SQLException;
	
	//발신함 쪽지 삭제
	void deleteSendMessage(int mssNo) throws SQLException;
	
}
