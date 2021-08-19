package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.CalendarVO;

public interface CalendarDAO {
	
	
	int selectCalendarSeqNextValue()throws SQLException;

//	String selectColor(String typeCode)throws SQLException;
	
	String selectDeptCode(String empNo)throws SQLException;
	
	void insertCalendar(CalendarVO calendar)throws SQLException;
	
	List<CalendarVO> selectCalendarListPage(String empNo)throws SQLException;

	List<CalendarVO> selectMainCalendarListPage(CalendarVO calendarvo)throws SQLException;
	
	void updateCalendar(CalendarVO calendar)throws SQLException;

	void updateCalendarDate(CalendarVO calendar)throws SQLException;
	
	void deleteCalendar(CalendarVO calendar)throws SQLException;
}
