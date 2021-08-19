package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.additional.dto.AdditionalTypeVO;

public interface AdditionalTypeService {
	
	List<AdditionalTypeVO> getAdditionalBoardList() throws SQLException;
	
	AdditionalTypeVO getBoard(String boardCode) throws SQLException;
	
	void reigstBoard(AdditionalTypeVO additionalType) throws SQLException;
	
	void modifyBoard(AdditionalTypeVO additionalType) throws SQLException;
	
	void removeBoard(AdditionalTypeVO additionalType) throws SQLException;
}
