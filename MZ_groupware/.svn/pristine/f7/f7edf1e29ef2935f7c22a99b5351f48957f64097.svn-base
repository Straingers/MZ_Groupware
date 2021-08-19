package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;

public interface TaskReportDAO {

	// 미확인목록
	List<TaskReportVO> selectUncheckTaskList(SearchCriteria cri) throws SQLException;
	int selectUncheckTaskListCount(SearchCriteria cri) throws SQLException;
	
	// 발신목록
	List<TaskReportVO> selectSendTaskList(SearchCriteria cri) throws SQLException;
	int selectSendTaskListCount(SearchCriteria cri) throws SQLException;
	
	// 수신목록
	List<TaskReportVO> selectReceiveTaskList(SearchCriteria cri) throws SQLException;
	int selectReceiveTaskListCount(SearchCriteria cri) throws SQLException;
	List<TaskReportVO> selectAllReceiveTask(String empNo) throws SQLException;
	
	// 임시저장
	List<TaskReportVO> selectTempTaskList(SearchCriteria cri) throws SQLException;
	int selectTempListCount(SearchCriteria cri) throws SQLException;
	
	// 중요문서
	List<TaskReportVO> selectSendImportantList(SearchCriteria cri) throws SQLException;
	List<TaskReportVO> selectReceiverImportantList(SearchCriteria cri) throws SQLException;
	int selectSendImportantListCount(SearchCriteria cri) throws SQLException;
	int selectReceiverImportantListCount(SearchCriteria cri) throws SQLException;
	
	void updateSendImportant(TaskReportVO taskReportVO) throws SQLException;
	void updateReceiveImportant(TaskHistoryVO taskHistoryVO) throws SQLException;
	
	
	// 한 개 조회
	TaskReportVO selectTaskReport(int taskNo) throws SQLException;
	
	// 게시글 개수 조회
	int selectTaskReportListCount(SearchCriteria cri) throws SQLException;
	
	// 등록
	void insertTaskReport(TaskReportVO taskReport) throws SQLException;

	
	// 임시저장
	TaskReportVO selectTempTaskReport(TaskReportVO taskReportVO) throws SQLException;
	void insertTempTaskReport(TaskReportVO taskReportVO) throws SQLException;
	void updateTempTaskReport(TaskReportVO taskReportVO) throws SQLException;
	void deleteTempTaskReport(TaskReportVO taskReportVO) throws SQLException;
	
	// 미확인cnt
	int selectUncheckShareCount(String empNo) throws SQLException;
	int selectUncheckDailyCount(String empNo) throws SQLException;
}
