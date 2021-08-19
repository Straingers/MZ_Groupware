package com.spring.member.history.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.member.history.dao.TransferHistoryDAO;
import com.spring.member.history.dto.TransferHistoryVO;

@Service
public class TransferHistoryServiceImpl implements TransferHistoryService {
	
	private final TransferHistoryDAO transferHistoryDAO;
	
	public TransferHistoryServiceImpl(TransferHistoryDAO transferHistoryDAO) {
		this.transferHistoryDAO = transferHistoryDAO;
	}
	
	// 인사 변경 현황 히스토리 목록 조회 + 검색, 페이징 기능 추가
	@Override
	public Map<String, Object> getTransferHistoryList(SearchCriteria cri) throws SQLException {
		List<TransferHistoryVO> transferHistoryList = transferHistoryDAO.selectTransferHistorySearchCriteria(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(transferHistoryDAO.selectTransferHistoryCriteriaTotalCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("transferHistoryList", transferHistoryList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<TransferHistoryVO> getTransferHistoryEmpNo(String empNo) throws SQLException {
		List<TransferHistoryVO> transferHistoryList = transferHistoryDAO.selectTransferHistoryEmpNo(empNo);
		
		return transferHistoryList;
	}

	@Override
	public void regist(TransferHistoryVO transferHistory) throws SQLException {
		transferHistoryDAO.insertTransferHistory(transferHistory);
	}

}
