package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public interface AttachService {
	
	Map<String, Object> getAllList(SearchCriteria cri) throws SQLException;
	Map<String, Object> getAppList(SearchCriteria cri) throws SQLException;
	Map<String, Object> getTaskList(SearchCriteria cri) throws SQLException;
	
	List<AttachVO> getDeleteAttachList() throws SQLException;
	
}
