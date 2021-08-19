package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.VacationVO;

public class VacationDAOImpl implements VacationDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<VacationVO> selectMyVacationList(VacationVO vacation) throws SQLException {
		return session.selectList("Vacation-Mapper.selectMyVacationList", vacation);
	}
	
	@Override
	public List<VacationVO> selectMyUseVacation(VacationVO vacation) throws SQLException {
		return session.selectList("Vacation-Mapper.selectMyUseVacation", vacation);
	}

	@Override
	public void insertVacation(VacationVO vacation) throws SQLException {
		session.update("Vacation-Mapper.insertVacation", vacation);
	}

	@Override
	public VacationVO selectVacationByAppNo(int appNo) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVacationByAppNo", appNo);
	}

}
