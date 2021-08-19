package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.CalendarDAO;
import com.spring.dto.CalendarVO;

public class CalendarServiceImpl implements CalendarService {

	private CalendarDAO calendarDAO;
	public void setCalendarDAO(CalendarDAO calendarDAO) {
		this.calendarDAO = calendarDAO;
	}

	@Override
	public void registCalendar(CalendarVO calendar) throws SQLException {
		int cno = calendarDAO.selectCalendarSeqNextValue();
		calendar.setCalNo(cno);
		
		String typeCode = calendar.getTypeCode();
		
		if(typeCode != "2") {
			
			String empNo = calendar.getEmpNo();
			
			String deptCode = calendarDAO.selectDeptCode(empNo);
		
			calendar.setTypeCode(deptCode);
		}
		
		calendarDAO.insertCalendar(calendar);
	}

	@Override
	public int getNextSeq() throws SQLException {
		return calendarDAO.selectCalendarSeqNextValue();
	}
	
	@Override
	public List<CalendarVO> getCalendarList(String empNo) throws SQLException {
		
		List<CalendarVO> calendarList = calendarDAO.selectCalendarListPage(empNo);

		return calendarList;
	}
	
	@Override
	public List<CalendarVO> getMainCalendarList(CalendarVO calendar) throws SQLException {
		
		List<CalendarVO> calendarList = calendarDAO.selectMainCalendarListPage(calendar);

		return calendarList;
	}


	@Override
	public void modifyCalendar(CalendarVO calendar) throws SQLException {
		calendarDAO.updateCalendar(calendar);
	}

	@Override
	public void modifyCalendarDate(CalendarVO calendar) throws SQLException {
		calendarDAO.updateCalendarDate(calendar);
	}

	@Override
	public void deleteCalendar(CalendarVO calendar) throws SQLException {
		calendarDAO.deleteCalendar(calendar);
	}

	
}
