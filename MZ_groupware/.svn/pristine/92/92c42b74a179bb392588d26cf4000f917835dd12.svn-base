package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.task.dto.TaskHistoryVO;

public interface TaskHistoryDAO {
	
	List<TaskHistoryVO> selectHitoryRecList(int taskReceiver) throws SQLException;
	List<TaskHistoryVO> selectHitoryCcList(int taskReceiver) throws SQLException;
	
	void insertHistory(TaskHistoryVO taskHistoryVO) throws SQLException;
	void updateSignStatus(TaskHistoryVO taskHistoryVO) throws SQLException;
}
