package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalVO;
import com.spring.command.SearchCriteria;

public interface ApprovalDAO {

	List<ApprovalVO> selectSearchApprovalList(SearchCriteria cri) throws SQLException;
	int selectSearchApprovalListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectIngApprovalList(SearchCriteria cri) throws SQLException;
	int selectIngListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectCompApprovalList(SearchCriteria cri) throws SQLException;
	int selectCompListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectRefApprovalList(SearchCriteria cri) throws SQLException;
	int selectRefListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectReadApprovalList(SearchCriteria cri) throws SQLException;
	int selectReadListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectRejApprovalList(SearchCriteria cri) throws SQLException;
	int selectRejListCount(SearchCriteria cri) throws SQLException;
	
	List<ApprovalVO> selectSearchApprovalByCategory(SearchCriteria cri, ApprovalVO approval) throws SQLException;
	
	
	ApprovalVO selectApprovalByAppNo(int appNo) throws SQLException;
	
	ApprovalVO selectApprovalByFileName(String FileName) throws SQLException;
	
	int selectApprovalSequenceNextValue() throws SQLException;
	
	void insertApproval(ApprovalVO approval) throws SQLException;
	
	void updateApproval(ApprovalVO approval) throws SQLException;
	
	void deleteApproval(int appNo) throws SQLException;
	
	void updateAppStatusByAppNo(ApprovalVO approval) throws SQLException;
	
	//임시저장
	List<ApprovalVO> selectTempApprovalList(SearchCriteria cri) throws SQLException;
	int selectTempListCount(SearchCriteria cri) throws SQLException; 
	
	ApprovalVO selectTempApproval(ApprovalVO approval) throws SQLException;
	void insertTempApproval(ApprovalVO approval) throws SQLException;
	void updateTempApproval(ApprovalVO approval) throws SQLException;
	void deleteTempApproval(ApprovalVO approval) throws SQLException;
	
	// 미확인결재문서cnt (메인페이지용)
	int selectUncheckCount(String empNo) throws SQLException;
	
	// 결재로그용
	List<ApprovalVO> selectAppLogList(SearchCriteria cri) throws SQLException;
	int selectAppLogListCount(SearchCriteria cri) throws SQLException;
	
	// 메인 리스트 출력
	List<ApprovalVO> selectAllReceiveList(String empNo) throws SQLException;
}
