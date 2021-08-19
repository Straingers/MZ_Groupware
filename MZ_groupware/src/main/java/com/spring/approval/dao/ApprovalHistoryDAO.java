package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalHistoryVO;

public interface ApprovalHistoryDAO {

	List<ApprovalHistoryVO> selectHistoryListByAppNo(int appNo) throws SQLException;
	
	ApprovalHistoryVO selectHistoryByFirst(int appNo) throws SQLException;
	ApprovalHistoryVO selectHistoryBySecond(int appNo) throws SQLException;
	ApprovalHistoryVO selectHistoryByThird(int appNo) throws SQLException;
	
	List<ApprovalHistoryVO> selectHistoryByHelp(int appNo) throws SQLException;
	List<ApprovalHistoryVO> selectHistoryByRef(int appNo) throws SQLException;
	List<ApprovalHistoryVO> selectHistoryByRead(int appNo) throws SQLException;
	
	void insertApprovalHistory(ApprovalHistoryVO approvalHistory) throws SQLException;
	void insertAppHistroy(ApprovalHistoryVO approvalHistory) throws SQLException;
	
	void updateSignStatusByFirst(ApprovalHistoryVO approvalHistory) throws SQLException;
	void updateSignStatusBySecond(ApprovalHistoryVO approvalHistory) throws SQLException;
	void updateSignStatusByThird(ApprovalHistoryVO approvalHistory) throws SQLException;
	
	void updateSignStatus(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusToReject(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
	void updateSignStatusToX(ApprovalHistoryVO approvalHistoryVO) throws SQLException;
}
