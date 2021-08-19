package com.spring.task.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.spring.task.dao.TaskHistoryDAO;
import com.spring.task.dto.TaskHistoryVO;

@Service
public class TaskHistoryServiceImpl implements TaskHistoryService {
	
	private TaskHistoryDAO taskHistoryDAO;
	public TaskHistoryServiceImpl(TaskHistoryDAO taskHistoryDAO) {
		this.taskHistoryDAO = taskHistoryDAO;
	}

	@Override
	public void updateSignStatus(TaskHistoryVO taskHistoryVO) throws SQLException {
		taskHistoryDAO.updateSignStatus(taskHistoryVO);
	}
	
}
