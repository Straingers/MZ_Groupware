package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.admin.additional.dto.AdditionalBoardVO;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public interface AdditionalBoardService {
	
	Map<String, Object> getAdditionalBoardList(SearchCriteria cri) throws SQLException;
	
	AdditionalBoardVO getAdditionalBoard(AdditionalBoardVO board) throws SQLException;
	AdditionalBoardVO readBoard(AdditionalBoardVO board) throws SQLException;
	
	void registBoard(AdditionalBoardVO board) throws SQLException;
	
	void modifyBoard(AdditionalBoardVO board) throws SQLException;
	
	void removeBoard(AdditionalBoardVO board) throws SQLException;
	
	AttachVO getAttachByAttachNo(int attachNo) throws SQLException;
	
	void removeAttatchByAttachNo(int attachNo) throws SQLException;
	
}
