package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.InoutTimeVO;

public class InoutTimeDAOImpl implements InoutTimeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session =  session;
	}
	
	@Override
	public List<InoutTimeVO> selectTime() throws SQLException {
		return session.selectList("InoutTime-Mappers.selectTime");
	}

}
