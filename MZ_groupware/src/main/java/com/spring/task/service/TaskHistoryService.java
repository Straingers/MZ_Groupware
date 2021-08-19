package com.spring.task.service;

import java.sql.SQLException;

import com.spring.task.dto.TaskHistoryVO;

public interface TaskHistoryService {
	
	void updateSignStatus(TaskHistoryVO taskHistoryVO) throws SQLException;
	
}
