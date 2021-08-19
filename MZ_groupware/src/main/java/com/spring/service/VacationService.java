package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.VacationVO;

public interface VacationService {

	List<VacationVO> getVacationList(VacationVO vacation) throws SQLException;
	
	List<VacationVO> getUseVacation(VacationVO vacation) throws SQLException;
	
	VacationVO getVacationByAppNo(int appNo) throws SQLException;
	
	void registVacstion(VacationVO vacation) throws SQLException;
}
