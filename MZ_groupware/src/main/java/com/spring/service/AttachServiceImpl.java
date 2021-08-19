package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.approval.dao.ApprovalAttachDAO;
import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dto.AttachVO;
import com.spring.task.dao.TaskAttachDAO;
import com.spring.task.dto.TaskAttachVO;

@Service
public class AttachServiceImpl implements AttachService {

	private final AttachDAO attachDAO;
	private final ApprovalAttachDAO approvalAttachDAO;
	private final TaskAttachDAO taskAttachDAO;
	public AttachServiceImpl(AttachDAO attachDAO, ApprovalAttachDAO approvalAttachDAO, TaskAttachDAO taskAttachDAO) {
		this.attachDAO = attachDAO;
		this.approvalAttachDAO = approvalAttachDAO;
		this.taskAttachDAO = taskAttachDAO;
	}

	@Override
	public Map<String, Object> getAllList(SearchCriteria cri) throws SQLException {
		List<AttachVO> attList = attachDAO.selectAllList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(attachDAO.selectAllListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("attList", attList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<AttachVO> getDeleteAttachList() throws SQLException {
		attachDAO.deleteCommAttach();
		return attachDAO.deleteAttachList();
	}

	@Override
	public Map<String, Object> getAppList(SearchCriteria cri) throws SQLException {
		List<ApprovalAttachVO> appList = approvalAttachDAO.selectAllAppList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(approvalAttachDAO.selectAllAppListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("appList", appList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getTaskList(SearchCriteria cri) throws SQLException {
		List<TaskAttachVO> taskList = taskAttachDAO.selectAllTaskList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(taskAttachDAO.selectAllTaskListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

}
