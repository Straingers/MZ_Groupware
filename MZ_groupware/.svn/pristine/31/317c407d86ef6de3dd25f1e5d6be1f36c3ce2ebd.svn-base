package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.CalendarVO;

public class CalendarDAOImpl implements CalendarDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertCalendar(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.insertCalendar", calendar);
	}
	
	@Override
	public String selectDeptCode(String empNo) throws SQLException {
		String deptCode = session.selectOne("Calendar-Mapper.selectDeptCode", empNo);
		return deptCode;
	}
	
//	@Override
//	public String selectColor(String typeCode) throws SQLException {
//		String color = session.selectOne("Calendar-Mapper.selectColor", typeCode);
//		return color;
//	}

	@Override
	public int selectCalendarSeqNextValue() throws SQLException {
		int cno = (Integer) session.selectOne("Calendar-Mapper.selectCalendarSeqNextValue");
		return cno;
	}

	@Override
	public List<CalendarVO> selectCalendarListPage(String empNo) throws SQLException {
		List<CalendarVO> calendarList = session.selectList("Calendar-Mapper.selectCalendarList", empNo);
		
		return calendarList;
	}

	@Override
	public List<CalendarVO> selectMainCalendarListPage(CalendarVO CalendarVO) throws SQLException {
		List<CalendarVO> calendarList = session.selectList("Calendar-Mapper.selectMainCalendarList", CalendarVO);
		
		return calendarList;
	}

	@Override
	public void updateCalendar(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.updateCalendar",calendar);
	}

	@Override
	public void updateCalendarDate(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.updateCalendarDate",calendar);
	}

	@Override
	public void deleteCalendar(CalendarVO calendar) throws SQLException {
		session.update("Calendar-Mapper.deleteCalendar",calendar);
	}



	
}
