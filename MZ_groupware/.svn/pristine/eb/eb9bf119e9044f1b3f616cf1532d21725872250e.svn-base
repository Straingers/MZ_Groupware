package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskReplyVO;

public interface TaskReplyDAO {
	
	List<TaskReplyVO> selectReplyListByTno(int taskNo, SearchCriteria cri) throws SQLException;
	int selectReplyCount(int taskNo) throws SQLException;
	
	void insertReply(TaskReplyVO taskReplyVO) throws SQLException;
	void updateReply(TaskReplyVO taskReplyVO) throws SQLException;
	void deleteReply(TaskReplyVO taskReplyVO) throws SQLException;
	
}
