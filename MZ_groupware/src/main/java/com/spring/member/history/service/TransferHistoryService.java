package com.spring.member.history.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.member.history.dto.TransferHistoryVO;

public interface TransferHistoryService {
	// 인사 변경 현황 히스토리 목록 조회 + 검색, 페이징 기능 추가
	Map<String, Object> getTransferHistoryList(SearchCriteria cri) throws SQLException;
	
	// 특정 직원 히스토리 조회
	List<TransferHistoryVO> getTransferHistoryEmpNo(String empNo) throws SQLException;
	
	// 히스토리 등록
	void regist(TransferHistoryVO transferHistory) throws SQLException;
}
