package com.spring.pds.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.dto.AttachVO;
import com.spring.pds.dto.PdsVO;

public interface PdsService {
	Map<String, Object> getPdsList(PdsVO pds)throws SQLException;
	
	PdsVO getPds(int pdsNo) throws SQLException;
	
	void regist(PdsVO pds) throws SQLException;
	
	void modify(PdsVO pds) throws SQLException;
	
	void remove(int pdsNo) throws SQLException;
	
	// attach
	AttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	void removeAttachByAttachNo(int attachNo)throws SQLException;
}
