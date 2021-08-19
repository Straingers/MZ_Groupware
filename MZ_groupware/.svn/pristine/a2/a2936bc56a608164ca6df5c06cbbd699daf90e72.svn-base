package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.VacationVO;

public interface VacationDAO {
	
	List<VacationVO> selectMyVacationList(VacationVO vacation) throws SQLException;
	
	List<VacationVO> selectMyUseVacation(VacationVO vacation) throws SQLException;
	
	VacationVO selectVacationByAppNo(int appNo) throws SQLException;
	
	void insertVacation(VacationVO vacation) throws SQLException;
}
