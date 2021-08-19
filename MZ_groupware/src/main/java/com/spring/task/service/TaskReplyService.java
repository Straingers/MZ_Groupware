package com.spring.task.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskReplyVO;

public interface TaskReplyService {
	
	Map<String, Object> getReplyListByTno(int taskNo, SearchCriteria cri) throws SQLException;
	int getReplyCount(int taskNo) throws SQLException;
	
	void regist(TaskReplyVO taskReplyVO) throws SQLException;
	void modify(TaskReplyVO taskReplyVO) throws SQLException;
	void delete(TaskReplyVO taskReplyVO) throws SQLException;
	
}
