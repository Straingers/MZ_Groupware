package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.additional.dto.AdditionalBoardReplyVO;
import com.spring.command.SearchCriteria;

public interface AdditionalBoardReplyDAO {
	List<AdditionalBoardReplyVO> selectBoardReplyList(AdditionalBoardReplyVO reply, SearchCriteria cri) throws SQLException;
	
	int selectBoardReplyListCount(AdditionalBoardReplyVO reply) throws SQLException;
	
	int selectReplySeqNextValue() throws SQLException;
	
	void insertReply(AdditionalBoardReplyVO reply) throws SQLException;
	
	void updateReply(AdditionalBoardReplyVO reply) throws SQLException;
	
	void deleteReply(AdditionalBoardReplyVO reply) throws SQLException;
}
