package com.spring.task.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskAttachVO;
import com.spring.task.dto.TaskDocVO;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;

public interface TaskService {

	// TASK_REPORT
	Map<String, Object> getUncheckTaskList(TaskReportVO taskReportVO) throws SQLException;
	Map<String, Object> getSendTaskList(TaskReportVO taskReportVO) throws SQLException;
	Map<String, Object> getReceiveTaskList(TaskReportVO taskReportVO) throws SQLException;
	Map<String, Object> getTempTaskList(TaskReportVO taskReportVO) throws SQLException;
	List<TaskReportVO> getAllReceiveList(String empNo) throws SQLException;
	
	Map<String, Object> selectSendImportantList(TaskReportVO taskReportVO) throws SQLException;
	Map<String, Object> selectReceiverImportantList(TaskReportVO taskReportVO) throws SQLException;
	void updateSendImportant(TaskReportVO taskReportVO) throws SQLException;
	void updateReceiveImportant(TaskHistoryVO taskHistoryVO) throws SQLException;
	
	Map<String, Object> getTaskReport(int taskNo) throws SQLException;
	void registTaskReport(TaskReportVO taskReport) throws SQLException;
	
	Map<String, Object> getTempReport(TaskReportVO taskReportVO) throws SQLException;
	void registTempReport(TaskReportVO taskReport) throws SQLException;
	void modifyTempReport(TaskReportVO taskReportVO) throws SQLException;
	void removeTempReport(TaskReportVO taskReportVO) throws SQLException;
	
	int getUncheckShare(String empNo) throws SQLException;
	int getUncheckDaily(String empNo) throws SQLException;
	
	
	
	// TASK_ATTACH
	TaskAttachVO getAttach(int attachNo) throws SQLException;
	void removeAttach(int attachNo) throws SQLException;

	
	// TASK_DOC
    List<TaskDocVO> selectTaskDocList(SearchCriteria cri) throws SQLException;
    Map<String, Object> selectUseTaskDocList(TaskDocVO taskDoc) throws SQLException;
    
    TaskDocVO selectTaskDoc(TaskDocVO taskDocVO) throws SQLException;

    int selectTaskDocTotalCount(SearchCriteria cri) throws SQLException;

    void insertTaskDoc(TaskDocVO taskDocVO) throws SQLException;
    void updateTaskDoc(TaskDocVO taskDocVO) throws SQLException;
    void updateUse(TaskDocVO taskDocVO) throws SQLException;
    void deleteTaskDoc(TaskDocVO taskDocVO) throws SQLException;

}
