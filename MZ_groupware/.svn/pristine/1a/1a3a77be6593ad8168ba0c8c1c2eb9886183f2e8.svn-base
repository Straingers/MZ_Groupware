package com.spring.admin.commute.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dto.HolidayVO;

public interface HolidayService {
	
	List<HolidayVO> getHolidayList() throws SQLException;

	List<HolidayVO> getHolidayMainList(HolidayVO holidayVO) throws SQLException;
	
	int checkHoliday(String holidayDate) throws SQLException;
	
	void registHoliday(HolidayVO holiday) throws SQLException;
	
	void removeHoliday(HolidayVO holiday) throws SQLException;
}
