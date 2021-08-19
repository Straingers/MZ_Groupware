package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.additional.dto.AdditionalTypeVO;

public interface AdditionalTypeDAO {
	
	List<AdditionalTypeVO> selectAdditionalBoardList() throws SQLException;
	
	AdditionalTypeVO selectBoard(String boardCode) throws SQLException;
	
	String checkExistMenu() throws SQLException;
	
	String insertBoard(AdditionalTypeVO additionalType) throws SQLException;
	
	void updateBoard(AdditionalTypeVO additionalType) throws SQLException;
	
	void deleteBoard(AdditionalTypeVO additionalType) throws SQLException;
}
