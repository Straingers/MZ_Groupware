package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskAttachVO;

@Repository
public class TaskAttachDAOImpl implements TaskAttachDAO {
	
	private final SqlSession session;
	public TaskAttachDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	@Override
	public TaskAttachVO selectAttachByAno(int attachNo) throws SQLException {
		TaskAttachVO attach = session.selectOne("TaskAttach-Mapper.selectAttachByAno", attachNo);
		return attach;
	}

	@Override
	public List<TaskAttachVO> selectAttachByTno(int taskNo) throws SQLException {
		List<TaskAttachVO> attachList = session.selectList("TaskAttach-Mapper.selectAttachByTno", taskNo);
		return attachList;
	}

	@Override
	public void insertAttach(TaskAttachVO attach) throws SQLException {
		session.insert("TaskAttach-Mapper.insertAttach", attach);
	}

	@Override
	public void deleteAttach(int attachNo) throws SQLException {
		session.delete("TaskAttach-Mapper.deleteAttach", attachNo);
	}

	@Override
	public void deleteAllAttach(int taskNo) throws SQLException {
		session.delete("TaskAttach-Mapper.deleteAllAttach", taskNo);
	}

	@Override
	public List<TaskAttachVO> selectAllTaskList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("TaskAttach-Mapper.selectAllTaskList", cri, rowBounds);
	}

	@Override
	public int selectAllTaskListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("TaskAttach-Mapper.selectAllTaskListCount", cri);
	}
}
