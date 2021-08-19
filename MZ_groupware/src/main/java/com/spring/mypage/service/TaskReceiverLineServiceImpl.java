package com.spring.mypage.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.mypage.dao.TaskReceiverLineDAO;
import com.spring.mypage.dao.TaskReceiverLineDetailDAO;
import com.spring.mypage.dto.TaskReceiverLineDetailVO;
import com.spring.mypage.dto.TaskReceiverLineVO;

@Service
public class TaskReceiverLineServiceImpl implements TaskReceiverLineService {
	
	private final TaskReceiverLineDAO lineDAO;
	private final TaskReceiverLineDetailDAO lineDetailDAO;
	public TaskReceiverLineServiceImpl(TaskReceiverLineDAO lineDAO, TaskReceiverLineDetailDAO lineDetailDAO) {
		this.lineDAO = lineDAO;
		this.lineDetailDAO = lineDetailDAO;
	}

	@Override
	public Map<String, Object> getLineList(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		List<TaskReceiverLineVO> lineList = lineDAO.selectLineList(taskReceiverLineVO);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("lineList", lineList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		TaskReceiverLineVO line = lineDAO.selectLine(taskReceiverLineVO);
		List<TaskReceiverLineDetailVO> rec = lineDetailDAO.selectRecDetail(line.getTasklineId());
		List<TaskReceiverLineDetailVO> cc = lineDetailDAO.selectCcDetail(line.getTasklineId());
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("line", line);
		dataMap.put("rec", rec);
		dataMap.put("cc", cc);
		return dataMap;
	}
	
	@Override
	public void regist(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		lineDAO.insertLine(taskReceiverLineVO);
		String recEmp = taskReceiverLineVO.getRecEmp();
		String ccEmp = taskReceiverLineVO.getCcEmp();
		
		TaskReceiverLineDetailVO detail = new TaskReceiverLineDetailVO();
		detail.setTasklineId(taskReceiverLineVO.getTasklineId());
		
		if(recEmp.trim().length() > 0) {
			String[] recEmpList = recEmp.split(",");
			if(recEmpList.length > 0) {
				for(String rec : recEmpList) {
					detail.setTasklineEmpno(rec);
					detail.setTasklineType("rec");
					lineDetailDAO.insertLineDetail(detail);
				}
			}
		}
		
		if(ccEmp.trim().length() > 0) {
			String[] ccEmpList = ccEmp.split(",");
			if(ccEmpList.length > 0) {
				for(String cc : ccEmpList) {
					detail.setTasklineEmpno(cc);
					detail.setTasklineType("cc");
					lineDetailDAO.insertLineDetail(detail);
				}
			}
		}  else {
			detail.setTasklineEmpno("default");
			detail.setTasklineType("cc");
			lineDetailDAO.insertLineDetail(detail);
		}
	}

	@Override
	public void update(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		lineDetailDAO.deleteLineDetail(taskReceiverLineVO.getTasklineId());
		lineDAO.updateLine(taskReceiverLineVO);

		String recEmp = taskReceiverLineVO.getRecEmp();
		String ccEmp = taskReceiverLineVO.getCcEmp();
		
		TaskReceiverLineDetailVO detail = new TaskReceiverLineDetailVO();
		
		detail.setTasklineId(taskReceiverLineVO.getTasklineId());
		if(recEmp.trim().length() > 0) {
			String[] recEmpList = recEmp.split(",");
			if(recEmpList.length > 0) {
				for(String rec : recEmpList) {
					detail.setTasklineEmpno(rec);
					detail.setTasklineType("rec");
					lineDetailDAO.insertLineDetail(detail);
				}
			}
		}
		
		if(ccEmp.trim().length() > 0) {
			String[] ccEmpList = ccEmp.split(",");
			if(ccEmpList.length > 0) {
				for(String cc : ccEmpList) {
					detail.setTasklineEmpno(cc);
					detail.setTasklineType("cc");
					lineDetailDAO.insertLineDetail(detail);
				}
			}
		} else {
			detail.setTasklineEmpno("default");
			detail.setTasklineType("cc");
			lineDetailDAO.insertLineDetail(detail);
		}
	}

	@Override
	public void delete(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		lineDAO.deleteLine(taskReceiverLineVO);
		
	}

	

}
 