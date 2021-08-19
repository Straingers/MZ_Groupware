package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskDocVO;

@Repository
public class TaskDocDAOImpl implements TaskDocDAO {

    private final SqlSession session;

    public TaskDocDAOImpl(@Qualifier("sqlSession") SqlSession session) {
        this.session = session;
    }

    @Override
    public List<TaskDocVO> selectTaskDocList(SearchCriteria cri) throws SQLException {
        int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("TaskDoc-Mapper.selectTaskDocList", cri, rowBounds);
    }
    
    @Override
    public List<TaskDocVO> selectUseTaskDocList(TaskDocVO taskDoc) throws SQLException {
    	return session.selectList("TaskDoc-Mapper.selectUseTaskDocList", taskDoc);
    }

    @Override
    public TaskDocVO selectTaskDoc(TaskDocVO taskDoc) throws SQLException {
        return session.selectOne("TaskDoc-Mapper.selectTaskDoc", taskDoc);
    }

    @Override
    public void insertTaskDoc(TaskDocVO taskDoc) throws SQLException {
        session.insert("TaskDoc-Mapper.insertTaskDoc", taskDoc);
    }

    @Override
    public void updateTaskDoc(TaskDocVO taskDoc) throws SQLException {
    	session.update("TaskDoc-Mapper.updateTaskDoc", taskDoc);
    }

    @Override
    public void deleteTaskDoc(TaskDocVO taskDoc) throws SQLException {
    	session.update("TaskDoc-Mapper.deleteTaskDoc", taskDoc);
    }

	@Override
	public void updateUse(TaskDocVO taskDoc) throws SQLException {
		session.update("TaskDoc-Mapper.updateUse", taskDoc);
	}
	
	@Override
	public int selectTaskDocTotalCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("TaskDoc-Mapper.selectTaskDocTotalCount", cri);
	}
}
