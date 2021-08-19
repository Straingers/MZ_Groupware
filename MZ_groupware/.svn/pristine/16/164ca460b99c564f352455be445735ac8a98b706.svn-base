package com.spring.admin.commute.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.admin.commute.dto.VacationTypeVO;

public class VacationTypeDAOImpl implements VacationTypeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<VacationTypeVO> selectVacationTypeList() throws SQLException {
		return session.selectList("VacationType-Mapper.selectVacationTypeList");
	}

	@Override
	public void updateVacationType(VacationTypeVO vacaType) throws SQLException {
		session.update("VacationType-Mapper.updateVacationType", vacaType);
	}

}
