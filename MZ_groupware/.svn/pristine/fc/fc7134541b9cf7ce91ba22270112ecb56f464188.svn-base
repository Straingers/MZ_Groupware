package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.additional.dto.AdditionalBoardVO;
import com.spring.command.SearchCriteria;

public interface AdditionalBoardDAO {
	
	List<AdditionalBoardVO> selectBoardListByBoardCode(SearchCriteria cri) throws SQLException;
	
	AdditionalBoardVO selectBoardByAddNo(AdditionalBoardVO board) throws SQLException;
	
	int selectBoardListByBoardCodeCount(SearchCriteria cri) throws SQLException;
	
	void increaseViewCount(AdditionalBoardVO board) throws SQLException;
	
	int insertBoard(AdditionalBoardVO board) throws SQLException;
	
	void updateBoard(AdditionalBoardVO board) throws SQLException;
	
	void deleteBoard(AdditionalBoardVO board) throws SQLException;
}
