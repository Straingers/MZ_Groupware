package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskAttachVO;

public interface TaskAttachDAO {
	
	TaskAttachVO selectAttachByAno(int attachNo) throws SQLException;
	List<TaskAttachVO> selectAttachByTno(int taskNo) throws SQLException;
	
	void insertAttach(TaskAttachVO attach) throws SQLException;
	void deleteAttach(int attachNo) throws SQLException;
	void deleteAllAttach(int taskNo) throws SQLException;
	
	List<TaskAttachVO> selectAllTaskList(SearchCriteria cri) throws SQLException;
	int selectAllTaskListCount(SearchCriteria cri) throws SQLException;
}
