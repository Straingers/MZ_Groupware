package com.spring.admin.commute.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dto.VacationTypeVO;

public interface VacationTypeService {

	List<VacationTypeVO> getVacationTypeList() throws SQLException;
	
	void updateTypeList(VacationTypeVO vacaType) throws SQLException;
}
