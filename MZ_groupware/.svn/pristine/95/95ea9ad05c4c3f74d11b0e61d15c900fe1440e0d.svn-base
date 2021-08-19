package com.spring.member.history.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.member.history.dto.TransferHistoryVO;

public interface TransferHistoryDAO {
	// 인사 변경 현황 히스토리 목록 조회 + 검색, 페이징 기능 추가
	List<TransferHistoryVO> selectTransferHistorySearchCriteria(SearchCriteria cri) throws SQLException;
	
	// 인사 변경 현황 히스토리 목록 내 목록 수 조회
	int selectTransferHistoryCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	// 특정 직원 히스토리 조회
	List<TransferHistoryVO> selectTransferHistoryEmpNo(String empNo) throws SQLException;
	
	// 히스토리 등록 
	void insertTransferHistory(TransferHistoryVO transferHistory) throws SQLException;
}
