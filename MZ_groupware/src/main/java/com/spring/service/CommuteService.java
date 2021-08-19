package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;

public interface CommuteService {
	
	Map<String, Object> getAllCommute(SearchCriteria cri) throws SQLException;
	
	List<CommuteVO> getDeptCommute(String deptName) throws SQLException;
	List<CommuteVO> getDeptCommuteByMonth(String deptName, int month) throws SQLException;
	
	CommuteVO getCommuteByCommuteNo(String commuteNo) throws SQLException;
	
	List<CommuteVO> getEmpCommute(EmployeeVO emp) throws SQLException;
	 
	CommuteVO getMyCommute(CommuteVO commute) throws SQLException;
	
	CommuteVO getEmpTime(String empNo) throws SQLException;
	
	CommuteVO getTodayCommute(CommuteVO commute) throws SQLException;
	
	List<CommuteVO> getThisWeekWorkingDay(String empNo) throws SQLException;
	
	CommuteVO regist(CommuteVO comm) throws SQLException;
	void updateOutTime(CommuteVO comm) throws SQLException;
	void updateWorkingTime(CommuteVO comm) throws SQLException;
	
	void updateInType(CommuteVO comm) throws SQLException;
	
}
