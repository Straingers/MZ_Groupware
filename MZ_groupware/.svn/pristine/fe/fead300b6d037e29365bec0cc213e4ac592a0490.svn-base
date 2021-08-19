package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.mypage.dto.TaskReceiverLineDetailVO;

@Repository
public class TaskReceiverLineDetailDAOImpl implements TaskReceiverLineDetailDAO {
	
	 private final SqlSession session;

    public TaskReceiverLineDetailDAOImpl(@Qualifier("sqlSession") SqlSession session) {
        this.session = session;
    }

	    @Override
	public List<TaskReceiverLineDetailVO> selectLineDetailList(TaskReceiverLineDetailVO taskReceiverLineDetailVO)
			throws SQLException {
		List<TaskReceiverLineDetailVO> detailList = session.selectList("TaskReceiverLineDetail-Mapper.selectLineDetailList", taskReceiverLineDetailVO);
		return detailList;
	}

	@Override
	public TaskReceiverLineDetailVO selectLineDetail(TaskReceiverLineDetailVO taskReceiverLineDetailVO)
			throws SQLException {
		return session.selectOne("TaskReceiverLineDetail-Mapper.selectLineDetail", taskReceiverLineDetailVO);
	}
	
	@Override
	public List<TaskReceiverLineDetailVO> selectRecDetail(int tasklineId) throws SQLException {
		return session.selectList("TaskReceiverLineDetail-Mapper.selectRecDetail", tasklineId);
	}

	@Override
	public List<TaskReceiverLineDetailVO> selectCcDetail(int tasklineId) throws SQLException {
		return session.selectList("TaskReceiverLineDetail-Mapper.selectCcDetail", tasklineId);
	}
	
	@Override
	public void insertLineDetail(TaskReceiverLineDetailVO taskReceiverLineDetailVO) throws SQLException {
		session.insert("TaskReceiverLineDetail-Mapper.insertLineDetail", taskReceiverLineDetailVO);
	}

	@Override
	public void deleteLineDetail(int tasklineId) throws SQLException {
		session.delete("TaskReceiverLineDetail-Mapper.deleteLineDetail", tasklineId);
	}

	
}
