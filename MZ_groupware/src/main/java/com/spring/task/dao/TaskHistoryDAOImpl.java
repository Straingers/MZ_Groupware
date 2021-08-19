package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.task.dto.TaskHistoryVO;

@Repository
public class TaskHistoryDAOImpl implements TaskHistoryDAO {
	
	private final SqlSession session;

    public TaskHistoryDAOImpl(@Qualifier("sqlSession") SqlSession session) {
        this.session = session;
    }
	
	@Override
	public void insertHistory(TaskHistoryVO taskHistoryVO) throws SQLException {
		session.insert("TaskHistory-Mapper.insertHistory", taskHistoryVO);
	}

	@Override
	public List<TaskHistoryVO> selectHitoryRecList(int taskReceiver) throws SQLException {
		return session.selectList("TaskHistory-Mapper.selectHitoryRecList", taskReceiver);
	}

	@Override
	public List<TaskHistoryVO> selectHitoryCcList(int taskReceiver) throws SQLException {
		return session.selectList("TaskHistory-Mapper.selectHitoryCcList", taskReceiver);

	}

	@Override
	public void updateSignStatus(TaskHistoryVO taskHistoryVO) throws SQLException {
		session.update("TaskHistory-Mapper.updateSignStatus", taskHistoryVO);
	}

}
