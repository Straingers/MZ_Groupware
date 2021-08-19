package com.spring.task.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.mypage.dao.TaskReceiverLineDAO;
import com.spring.mypage.dao.TaskReceiverLineDetailDAO;
import com.spring.task.dao.TaskAttachDAO;
import com.spring.task.dao.TaskDocDAO;
import com.spring.task.dao.TaskHistoryDAO;
import com.spring.task.dao.TaskReportDAO;
import com.spring.task.dto.TaskAttachVO;
import com.spring.task.dto.TaskDocVO;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;

@Service
public class TaskServiceImpl implements TaskService {

    private final TaskDocDAO taskDocDAO;
    private final TaskReportDAO taskReportDAO;
    private final TaskAttachDAO taskAttachDAO;
    private final TaskHistoryDAO taskHistoryDAO;
    private final TaskReceiverLineDAO lineDAO;
    private final TaskReceiverLineDetailDAO lineDetailDAO;
	public TaskServiceImpl(TaskDocDAO taskDocDAO, TaskReportDAO taskReportDAO, TaskAttachDAO taskAttachDAO,
			TaskHistoryDAO taskHistoryDAO, TaskReceiverLineDAO lineDAO, TaskReceiverLineDetailDAO lineDetailDAO) {
		this.taskDocDAO = taskDocDAO;
		this.taskReportDAO = taskReportDAO;
		this.taskAttachDAO = taskAttachDAO;
		this.taskHistoryDAO = taskHistoryDAO;
		this.lineDAO = lineDAO;
		this.lineDetailDAO = lineDetailDAO;
	}

	// Task_Report
	@Override
	public Map<String, Object> getUncheckTaskList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectUncheckTaskList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectUncheckTaskListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getSendTaskList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectSendTaskList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectSendTaskListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getReceiveTaskList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectReceiveTaskList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectReceiveTaskListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<TaskReportVO> getAllReceiveList(String empNo) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectAllReceiveTask(empNo);
		return taskList;
	}

	@Override
	public Map<String, Object> getTempTaskList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectTempTaskList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectTempListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	// 중요업무
	@Override
	public void updateSendImportant(TaskReportVO taskReportVO) throws SQLException {
		taskReportDAO.updateSendImportant(taskReportVO);
	}
	
	@Override
	public void updateReceiveImportant(TaskHistoryVO taskHistoryVO) throws SQLException {
		taskReportDAO.updateReceiveImportant(taskHistoryVO);
	}
	
	@Override
	public Map<String, Object> selectSendImportantList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectSendImportantList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectSendImportantListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectReceiverImportantList(TaskReportVO taskReportVO) throws SQLException {
		List<TaskReportVO> taskList = taskReportDAO.selectReceiverImportantList(taskReportVO);
		
		if(taskList != null)
			for(TaskReportVO task : taskList)
				addAttachList(task);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(taskReportVO);
		pageMaker.setTotalCount(taskReportDAO.selectReceiverImportantListCount(taskReportVO));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("taskList", taskList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	
	@Override
	public Map<String, Object> getTaskReport(int taskNo) throws SQLException {
		TaskReportVO task = taskReportDAO.selectTaskReport(taskNo);
		addAttachList(task);
		List<TaskHistoryVO> taskHistoryRec = taskHistoryDAO.selectHitoryRecList(task.getTaskNo());
		List<TaskHistoryVO> taskHistoryCc = taskHistoryDAO.selectHitoryCcList(task.getTaskNo());
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("task", task);
		dataMap.put("taskHistoryRec", taskHistoryRec);
		dataMap.put("taskHistoryCc", taskHistoryCc);
		return dataMap;
	}

	@Override
	public void registTaskReport(TaskReportVO taskReport) throws SQLException {
		taskReportDAO.insertTaskReport(taskReport);
		if(taskReport.getAttachList() != null) {
			for (TaskAttachVO attach : taskReport.getAttachList()) {
				attach.setTaskNo(taskReport.getTaskNo());
				attach.setAttachAttacher(taskReport.getEmpNo());
				taskAttachDAO.insertAttach(attach);
			}
		}
		
		String recEmp = taskReport.getRecEmp();
		String ccEmp = taskReport.getCcEmp();
		
		TaskHistoryVO history = new TaskHistoryVO();
		
		if(recEmp.trim().length() > 0) {
			String[] recEmpList = recEmp.split(",");
			
			if(recEmpList.length > 0) {
				for(String rec : recEmpList) {
					history.setTaskReceiver(rec);
					history.setTaskNo(taskReport.getTaskNo());
					history.setTaskReceiverType("rec");
					taskHistoryDAO.insertHistory(history);
				}
			}
		}
		
		if(ccEmp.trim().length() > 0) {
			String[] ccEmpList = ccEmp.split(",");
			
			if(ccEmpList.length > 0) {
				for(String cc : ccEmpList) {
					history.setTaskReceiver(cc);
					history.setTaskNo(taskReport.getTaskNo());
					history.setTaskReceiverType("cc");
					taskHistoryDAO.insertHistory(history);
				}
			}
		}
		
	}
	
	@Override
	public void registTempReport(TaskReportVO taskReport) throws SQLException {
		taskReportDAO.insertTempTaskReport(taskReport);
		if(taskReport.getAttachList() != null) {
			for (TaskAttachVO attach : taskReport.getAttachList()) {
				attach.setTaskNo(taskReport.getTaskNo());
				attach.setAttachAttacher(taskReport.getEmpNo());
				taskAttachDAO.insertAttach(attach);
			}
		}
		
	}
	
	@Override
	public Map<String, Object> getTempReport(TaskReportVO taskReportVO) throws SQLException {
		TaskReportVO task = taskReportDAO.selectTempTaskReport(taskReportVO);
		addAttachList(task);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("task", task);
		return dataMap;
	}

	@Override
	public void modifyTempReport(TaskReportVO taskReportVO) throws SQLException {
		taskReportDAO.updateTempTaskReport(taskReportVO);
		
		if(taskReportVO.getAttachList() != null)
			for (TaskAttachVO attach : taskReportVO.getAttachList()) {
				attach.setTaskNo(taskReportVO.getTaskNo());
				attach.setAttachAttacher(taskReportVO.getEmpNo());
				taskAttachDAO.insertAttach(attach);
			}
	}

	@Override
	public void removeTempReport(TaskReportVO taskReportVO) throws SQLException {
		taskReportDAO.deleteTempTaskReport(taskReportVO); 
		
	}
	

	@Override
	public int getUncheckShare(String empNo) throws SQLException {
		int cnt = taskReportDAO.selectUncheckShareCount(empNo);
		return cnt;
	}

	@Override
	public int getUncheckDaily(String empNo) throws SQLException {
		int cnt = taskReportDAO.selectUncheckDailyCount(empNo);
		return cnt;
	}
	
	// Task_Attach
	@Override
	public TaskAttachVO getAttach(int attachNo) throws SQLException {
		TaskAttachVO attach = taskAttachDAO.selectAttachByAno(attachNo);
		return attach;
	}

	@Override
	public void removeAttach(int attachNo) throws SQLException {
		taskAttachDAO.deleteAttach(attachNo);
	}
	
	private void addAttachList(TaskReportVO task) throws SQLException {
		if (task == null) return;
		
		int taskNo = task.getTaskNo();
		List<TaskAttachVO> attachList = taskAttachDAO.selectAttachByTno(taskNo);
		task.setAttachList(attachList);
	}
	
	
	
	
	
	// Task_Doc
	@Override
    public List<TaskDocVO> selectTaskDocList(SearchCriteria cri) throws SQLException {
        return taskDocDAO.selectTaskDocList(cri);
    }
	
	@Override
	public Map<String, Object> selectUseTaskDocList(TaskDocVO taskDoc) throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("taskDoc", taskDocDAO.selectUseTaskDocList(taskDoc));
		return dataMap;
	}
	
    @Override
    public int selectTaskDocTotalCount(SearchCriteria cri) throws SQLException {
        return taskDocDAO.selectTaskDocTotalCount(cri);
    }

    @Override
    public TaskDocVO selectTaskDoc(TaskDocVO taskDocVO) throws SQLException {
        return taskDocDAO.selectTaskDoc(taskDocVO);
    }

    @Override
    public void insertTaskDoc(TaskDocVO taskDocVO) throws SQLException {
        taskDocDAO.insertTaskDoc(taskDocVO);
    }

	@Override
	public void updateTaskDoc(TaskDocVO taskDocVO) throws SQLException {
		taskDocDAO.updateTaskDoc(taskDocVO);
	}

	@Override
	public void updateUse(TaskDocVO taskDocVO) throws SQLException {
		taskDocDAO.updateUse(taskDocVO);
	}

	@Override
	public void deleteTaskDoc(TaskDocVO taskDocVO) throws SQLException {
		taskDocDAO.deleteTaskDoc(taskDocVO);
	}

}
