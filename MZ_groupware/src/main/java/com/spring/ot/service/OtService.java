package com.spring.ot.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.ot.dto.OtVO;

public interface OtService {
	Map<String, Object> getOtList(SearchCriteria cri)throws SQLException;
	
	OtVO getOt(int otNo) throws SQLException;
	
	void regist(OtVO ot) throws SQLException;
	
	void modify(OtVO ot) throws SQLException;
	
	void remove(int otNo) throws SQLException;
	
	// attach
	AttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	void removeAttachByAttachNo(int attachNo)throws SQLException;
}
