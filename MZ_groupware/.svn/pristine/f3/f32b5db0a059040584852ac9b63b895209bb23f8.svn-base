package com.spring.approval.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalHistoryVO;

public interface ApprovalHistoryService {


	List<ApprovalHistoryVO> getHistoryListByAppNo(int appNo) throws SQLException;
	
	void regist(ApprovalHistoryVO approvalHistory) throws SQLException;
	
	void updateSignStatusByFirst(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusBySecond(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusByThird(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	
	
	
	void updateSignStatus(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusToReject(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusToX(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
}
