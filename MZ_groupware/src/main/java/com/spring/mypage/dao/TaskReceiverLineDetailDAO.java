package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.mypage.dto.TaskReceiverLineDetailVO;

public interface TaskReceiverLineDetailDAO {
	
	List<TaskReceiverLineDetailVO> selectLineDetailList(TaskReceiverLineDetailVO taskReceiverLineDetailVO) throws SQLException;
	TaskReceiverLineDetailVO selectLineDetail(TaskReceiverLineDetailVO taskReceiverLineDetailVO) throws SQLException;
	List<TaskReceiverLineDetailVO> selectRecDetail(int tasklineId) throws SQLException;
	List<TaskReceiverLineDetailVO> selectCcDetail(int tasklineId) throws SQLException;
	
	
	void insertLineDetail(TaskReceiverLineDetailVO taskReceiverLineDetailVO) throws SQLException;
	void deleteLineDetail(int tasklineId) throws SQLException;
	
}
