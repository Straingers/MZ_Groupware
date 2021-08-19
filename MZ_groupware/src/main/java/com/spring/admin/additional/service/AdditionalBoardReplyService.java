package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.admin.additional.dto.AdditionalBoardReplyVO;
import com.spring.command.SearchCriteria;

public interface AdditionalBoardReplyService {

	Map<String, Object> getReplyListByAddNo(AdditionalBoardReplyVO reply, SearchCriteria cri) throws SQLException;
	
	int getReplyCount(AdditionalBoardReplyVO reply) throws SQLException;
	
	void registReply(AdditionalBoardReplyVO reply) throws SQLException;
	
	void modifyReply(AdditionalBoardReplyVO reply) throws SQLException;
	
	void removeReply(AdditionalBoardReplyVO reply) throws SQLException;
}
