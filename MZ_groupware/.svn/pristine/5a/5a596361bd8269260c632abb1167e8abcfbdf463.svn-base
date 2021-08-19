package com.spring.approval.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.approval.dto.ApprovalReplyVO;
import com.spring.command.SearchCriteria;

public interface ApprovalReplyService {

	Map<String, Object> getReplyListByAppNo(int appNo, SearchCriteria cri) throws SQLException;
	
	int getReplyCount(int appNo) throws SQLException;
	
	void regist(ApprovalReplyVO approvalReplyVO) throws SQLException;
	void modify(ApprovalReplyVO approvalReplyVO) throws SQLException;
	void delete(ApprovalReplyVO approvalReplyVO) throws SQLException;
}
