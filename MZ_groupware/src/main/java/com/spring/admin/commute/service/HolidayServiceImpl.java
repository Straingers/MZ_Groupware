package com.spring.admin.commute.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dao.HolidayDAO;
import com.spring.admin.commute.dto.HolidayVO;

public class HolidayServiceImpl implements HolidayService {

	private HolidayDAO holidayDAO;
	public void setHolidayDAO(HolidayDAO holidayDAO) {
		this.holidayDAO = holidayDAO;
	}
	
	@Override
	public List<HolidayVO> getHolidayList() throws SQLException {
		return holidayDAO.selectHolidayList();
	}

	@Override
	public List<HolidayVO> getHolidayMainList(HolidayVO holidayVO) throws SQLException {
		return holidayDAO.selectHolidayMainList(holidayVO);
	}

	@Override
	public int checkHoliday(String holidayDate) throws SQLException {
		HolidayVO holiday = new HolidayVO();
		holiday.setHolidayDate(holidayDate);
		return holidayDAO.selectHolidayCount(holiday);
	}
	
	@Override
	public void registHoliday(HolidayVO holiday) throws SQLException {
		holidayDAO.insertHoliday(holiday);
	}

	@Override
	public void removeHoliday(HolidayVO holiday) throws SQLException {
		holidayDAO.deleteHoliday(holiday);
	}

}
