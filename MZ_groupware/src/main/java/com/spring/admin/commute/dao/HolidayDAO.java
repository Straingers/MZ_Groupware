package com.spring.admin.commute.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dto.HolidayVO;

public interface HolidayDAO {
	
	List<HolidayVO> selectHolidayList() throws SQLException;

	List<HolidayVO> selectHolidayMainList(HolidayVO holidayVO) throws SQLException;
	
	int selectHolidayCount(HolidayVO holiday) throws SQLException;
	
	void insertHoliday(HolidayVO holiday) throws SQLException;
	
	void deleteHoliday(HolidayVO holiday) throws SQLException;
}
