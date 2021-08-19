package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;

public interface CommuteDAO {
	
	List<CommuteVO> selectCommuteList(SearchCriteria cri) throws SQLException;
	
	int selectCommuteListCount(SearchCriteria cri) throws SQLException;
	
	CommuteVO selectCommuteByCommNo(String commuteNo) throws SQLException;
	
	List<CommuteVO> selectCommuteListByEmp(EmployeeVO emp) throws SQLException;
	List<CommuteVO> selectCommuteListByDept(String deptName) throws SQLException;
	List<CommuteVO> selectCommuteListByDeptNMonth(CommuteVO commute) throws SQLException;
	
	CommuteVO selectMyCommute(CommuteVO commute) throws SQLException;
	
	CommuteVO selectEmpByTime(String empNo) throws SQLException;
	
	CommuteVO selectTodayCommute(CommuteVO commute) throws SQLException;
	
	List<CommuteVO> selectThisWeekWorkingDay(String empNo) throws SQLException;
	
	void insertCommuteLog(CommuteVO comm) throws SQLException;
	void updateOutTime(CommuteVO comm) throws SQLException;
	void updateWorkingTime(CommuteVO comm) throws SQLException;
	
	void updateInType(CommuteVO comm) throws SQLException;
	
	void updateCommuteInfo(CommuteVO comm) throws SQLException;
	
	
	// 근로시간 계산
	String one(String empNo) throws SQLException;
	String two(String empNo) throws SQLException;
	String three(String empNo) throws SQLException;
	String four(String empNo) throws SQLException;
	String five(String empNo) throws SQLException;
	String six(String empNo) throws SQLException;
	String seven(String empNo) throws SQLException;
	String eight(String empNo) throws SQLException;
	String nine(String empNo) throws SQLException;
	String ten(String empNo) throws SQLException;
	String eleven(String empNo) throws SQLException;
	String twelve(String empNo) throws SQLException;
	String thirteen(String empNo) throws SQLException;
	
}
