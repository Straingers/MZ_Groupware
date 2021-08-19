package com.spring.task.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.task.dao.TaskReplyDAO;
import com.spring.task.dto.TaskReplyVO;

@Service
public class TaskReplyServiceImpl implements TaskReplyService {
	
	private final TaskReplyDAO taskReplyDAO;
	public TaskReplyServiceImpl(TaskReplyDAO taskReplyDAO) {
		this.taskReplyDAO = taskReplyDAO;
	}

	@Override
	public Map<String, Object> getReplyListByTno(int taskNo, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<TaskReplyVO> replyList = taskReplyDAO.selectReplyListByTno(taskNo, cri);
		int count = taskReplyDAO.selectReplyCount(taskNo);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int getReplyCount(int taskNo) throws SQLException {
		return taskReplyDAO.selectReplyCount(taskNo);
	}

	@Override
	public void regist(TaskReplyVO taskReplyVO) throws SQLException {
		taskReplyDAO.insertReply(taskReplyVO);
	}

	@Override
	public void modify(TaskReplyVO taskReplyVO) throws SQLException {
		taskReplyDAO.updateReply(taskReplyVO);
	}

	@Override
	public void delete(TaskReplyVO taskReplyVO) throws SQLException {
		taskReplyDAO.deleteReply(taskReplyVO);
	}

}
