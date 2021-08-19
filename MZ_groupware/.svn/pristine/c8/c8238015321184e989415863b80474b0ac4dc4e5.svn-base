package com.spring.office.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.office.dto.OfficeVO;

public interface OfficeService {
	Map<String, Object> getOfficeList(SearchCriteria cri)throws SQLException;
	
	OfficeVO getOffice(int officeNo) throws SQLException;
	
	void regist(OfficeVO office) throws SQLException;
	
	void modify(OfficeVO office) throws SQLException;
	
	void remove(int officeNo) throws SQLException;
	
	// attach
	AttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	void removeAttachByAttachNo(int attachNo)throws SQLException;
}
