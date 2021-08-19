package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.mypage.dto.TaskReceiverLineVO;

public interface TaskReceiverLineDAO {
	
	List<TaskReceiverLineVO> selectLineList(TaskReceiverLineVO taskReceiverLineVO) throws SQLException;
	TaskReceiverLineVO selectLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException;
	
	void insertLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException;
	void updateLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException;
	void deleteLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException;
	
}
