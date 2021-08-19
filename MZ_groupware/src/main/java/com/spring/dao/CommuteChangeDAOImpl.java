package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.CommuteChangeVO;

public class CommuteChangeDAOImpl implements CommuteChangeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CommuteChangeVO> selectCommuteChangeListByDept(CommuteChangeVO commChange) throws SQLException {
		return session.selectList("CommuteChange-Mappers.selectCommuteChangeListByDept", commChange);
	}

	@Override
	public void insertCommuteChange(CommuteChangeVO commChange) throws SQLException {
		session.update("CommuteChange-Mappers.insertCommuteChange", commChange);
	}

}
