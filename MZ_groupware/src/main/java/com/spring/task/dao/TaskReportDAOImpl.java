package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;

@Repository
public class TaskReportDAOImpl implements TaskReportDAO {

	private final SqlSession session;
	public TaskReportDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	
	@Override
	public List<TaskReportVO> selectUncheckTaskList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectUncheckTaskList", cri, rowBounds);
		return taskList;
	}

	@Override
	public int selectUncheckTaskListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectUncheckTaskListCount", cri);
		return count;
	}
	
	@Override
	public List<TaskReportVO> selectAllReceiveTask(String empNo) throws SQLException {
		return session.selectList("TaskReport-Mapper.selectAllReceiveTask", empNo);
	}


	@Override
	public List<TaskReportVO> selectSendTaskList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectSendTaskList", cri, rowBounds);
		return taskList;
	}

	@Override
	public int selectSendTaskListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectSendTaskListCount", cri);
		return count;
	}



	@Override
	public List<TaskReportVO> selectReceiveTaskList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectReceiveTaskList", cri, rowBounds);
		return taskList;
	}

	@Override
	public int selectReceiveTaskListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectReceiveTaskListCount", cri);
		return count;
	}



	@Override
	public List<TaskReportVO> selectTempTaskList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectTempTaskList", cri, rowBounds);
		return taskList;
	}

	@Override
	public int selectTempListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectTempListCount", cri);
		return count;
	}
	
	
	
	
	
	
	
	@Override
	public TaskReportVO selectTaskReport(int taskNo) throws SQLException {
		return session.selectOne("TaskReport-Mapper.selectTaskReport", taskNo);
	}

	@Override
	public int selectTaskReportListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("TaskReport-Mapper.selectTaskReportListCount", cri);
	}
	
	@Override
	public void insertTaskReport(TaskReportVO taskReport) throws SQLException {
		session.insert("TaskReport-Mapper.insertTaskReport", taskReport);
	}

	
	
	// 중요업무
	@Override
	public void updateSendImportant(TaskReportVO taskReportVO) throws SQLException {
		session.update("TaskReport-Mapper.updateSendImportant", taskReportVO);
	}
	
	@Override
	public void updateReceiveImportant(TaskHistoryVO taskHistoryVO) throws SQLException {
		session.update("TaskReport-Mapper.updateReceiveImportant", taskHistoryVO);
	}

	@Override
	public List<TaskReportVO> selectSendImportantList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectSendImportantList", cri, rowBounds);
		return taskList;
	}
	
	@Override
	public List<TaskReportVO> selectReceiverImportantList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<TaskReportVO> taskList = session.selectList("TaskReport-Mapper.selectReceiverImportantList", cri, rowBounds);
		return taskList;
	}
	
	@Override
	public int selectSendImportantListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectSendImportantListCount", cri);
		return count;
	}


	@Override
	public int selectReceiverImportantListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("TaskReport-Mapper.selectReceiverImportantListCount", cri);
		return count;
	}


	@Override
	public void insertTempTaskReport(TaskReportVO taskReportVO) throws SQLException {
		session.insert("TaskReport-Mapper.insertTempTaskReport", taskReportVO);
	}


	@Override
	public TaskReportVO selectTempTaskReport(TaskReportVO taskReportVO) throws SQLException {
		TaskReportVO task = session.selectOne("TaskReport-Mapper.selectTempTaskReport", taskReportVO);
		return task;
	}


	@Override
	public void updateTempTaskReport(TaskReportVO taskReportVO) throws SQLException {
		session.update("TaskReport-Mapper.updateTempTaskReport", taskReportVO);
	}


	@Override
	public void deleteTempTaskReport(TaskReportVO taskReportVO) throws SQLException {
		session.update("TaskReport-Mapper.deleteTempTaskReport", taskReportVO);
	}


	@Override
	public int selectUncheckShareCount(String empNo) throws SQLException {
		return session.selectOne("TaskReport-Mapper.selectUncheckShareCount", empNo);
	}


	@Override
	public int selectUncheckDailyCount(String empNo) throws SQLException {
		return session.selectOne("TaskReport-Mapper.selectUncheckDailyCount", empNo);
	}
}
