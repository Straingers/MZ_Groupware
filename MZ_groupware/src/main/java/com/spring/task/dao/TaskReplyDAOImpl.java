package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskReplyVO;

@Repository
public class TaskReplyDAOImpl implements TaskReplyDAO {

	private final SqlSession session;
	public TaskReplyDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<TaskReplyVO> selectReplyListByTno(int taskNo, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<TaskReplyVO> replyList = session.selectList("TaskReply-Mapper.selectReplyListByTno", taskNo, rowBounds);
		
		return replyList;
	}

	@Override
	public int selectReplyCount(int taskNo) throws SQLException {
		return session.selectOne("TaskReply-Mapper.selectReplyCount", taskNo);
	}

	@Override
	public void insertReply(TaskReplyVO taskReplyVO) throws SQLException {
		session.insert("TaskReply-Mapper.insertReply", taskReplyVO);
	}

	@Override
	public void updateReply(TaskReplyVO taskReplyVO) throws SQLException {
		session.insert("TaskReply-Mapper.updateReply", taskReplyVO);
	}

	@Override
	public void deleteReply(TaskReplyVO taskReplyVO) throws SQLException {
		session.insert("TaskReply-Mapper.deleteReply", taskReplyVO);
	}

}
