package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalDocVO;
import com.spring.command.SearchCriteria;

public interface ApprovalDocDAO {

	List<ApprovalDocVO> selectSearchApprovalDocList(SearchCriteria cri) throws SQLException;
	
	List<ApprovalDocVO> selectApprovalDocList(ApprovalDocVO approvalDocVO) throws SQLException;

	List<ApprovalDocVO> selectSearchApprovalDocByUse(ApprovalDocVO approvalDoc) throws SQLException;
	
	ApprovalDocVO selectApprovalDocByDocId(ApprovalDocVO approvalDoc) throws SQLException;
	ApprovalDocVO getApprovalDoc(String docId) throws SQLException;
	
	void insertApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	
	void updateApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	
	void updateUse(ApprovalDocVO approvalDoc) throws SQLException;
	
	void deleteApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException;
	
	int selectApprovalDocTotalCount(SearchCriteria cri) throws SQLException;
}
