package com.spring.admin.commute.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.admin.commute.dto.HolidayVO;

public class HolidayDAOImpl implements HolidayDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<HolidayVO> selectHolidayList() throws SQLException {
		return session.selectList("Holiday-Mapper.selectHolidayList");
	}
	
	@Override
	public List<HolidayVO> selectHolidayMainList(HolidayVO holidayVO) throws SQLException {
		return session.selectList("Holiday-Mapper.selectMainHolidayList", holidayVO);
	}

	@Override
	public int selectHolidayCount(HolidayVO holiday) throws SQLException {
		return session.selectOne("Holiday-Mapper.selectHolidayCount", holiday);
	}
	
	@Override
	public void insertHoliday(HolidayVO holiday) throws SQLException {
		session.update("Holiday-Mapper.insertHoliday", holiday);
	}

	@Override
	public void deleteHoliday(HolidayVO holiday) throws SQLException {
		session.update("Holiday-Mapper.deleteHoliday", holiday);
	}

}
