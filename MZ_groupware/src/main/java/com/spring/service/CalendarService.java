package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.CalendarVO;


public interface CalendarService {
	
	//등록
	void registCalendar(CalendarVO calendar)throws SQLException;
		
	int getNextSeq() throws SQLException;
	
	//리스트보기
	List<CalendarVO> getCalendarList(String empNo) throws SQLException;

	//main리스트보기
	List<CalendarVO> getMainCalendarList(CalendarVO calendar) throws SQLException;
	
	//수정
	void modifyCalendar(CalendarVO calendar)throws SQLException;

	//날짜만 수정
	void modifyCalendarDate(CalendarVO calendar)throws SQLException;
	
	//삭제
	void deleteCalendar(CalendarVO calendar)throws SQLException;
}
