package com.spring.approval.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.approval.dto.ApprovalDocVO;
import com.spring.command.SearchCriteria;

public interface ApprovalDocService {

	Map<String, Object> selectApprovalDocList(SearchCriteria cri) throws SQLException;
	
	Map<String, Object> selectApprovalDocList1(ApprovalDocVO approvalDocVO) throws SQLException;
	
	Map<String, Object> getApprovalDocList() throws SQLException;
	Map<String, Object> getUseApprovalDocList(ApprovalDocVO approvalDoc) throws SQLException;
	
	ApprovalDocVO selectApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	ApprovalDocVO getApprovalDoc(String docId) throws SQLException;
	
	int selectApprovalDocTotalCount(SearchCriteria cri) throws SQLException;
	
	void insertApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	
	void updateApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	
	void updateUse(ApprovalDocVO approvalDoc) throws SQLException;
	
	void deleteApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
}
