package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalReplyVO;
import com.spring.command.SearchCriteria;

public interface ApprovalReplyDAO {

	List<ApprovalReplyVO> selectReplyListByAppNo(int appNo, SearchCriteria cri) throws SQLException;
	
	int selectReplyCount(int appNo) throws SQLException;
	
	void insertReply(ApprovalReplyVO approvalReplyVO) throws SQLException;
	void updateReply(ApprovalReplyVO approvalReplyVO) throws SQLException;
	void deleteReply(ApprovalReplyVO approvalReplyVO) throws SQLException;
}
