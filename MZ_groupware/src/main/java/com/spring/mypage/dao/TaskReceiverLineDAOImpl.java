package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.mypage.dto.TaskReceiverLineVO;

@Repository
public class TaskReceiverLineDAOImpl implements TaskReceiverLineDAO {

    private final SqlSession session;

    public TaskReceiverLineDAOImpl(@Qualifier("sqlSession") SqlSession session) {
        this.session = session;
    }
	
	@Override
	public List<TaskReceiverLineVO> selectLineList(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		List<TaskReceiverLineVO> lineList = session.selectList("TaskReceiverLine-Mapper.selectLineList", taskReceiverLineVO);
		return lineList;
	}

	@Override
	public TaskReceiverLineVO selectLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		return session.selectOne("TaskReceiverLine-Mapper.selectLine", taskReceiverLineVO);
	}

	@Override
	public void insertLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		session.insert("TaskReceiverLine-Mapper.insertLine", taskReceiverLineVO);
	}

	@Override
	public void updateLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		session.update("TaskReceiverLine-Mapper.updateLine", taskReceiverLineVO);
	}

	@Override
	public void deleteLine(TaskReceiverLineVO taskReceiverLineVO) throws SQLException {
		session.update("TaskReceiverLine-Mapper.deleteLine", taskReceiverLineVO);
		
	}

}
