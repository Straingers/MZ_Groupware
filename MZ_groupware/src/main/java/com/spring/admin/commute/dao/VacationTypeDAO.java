package com.spring.admin.commute.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dto.VacationTypeVO;

public interface VacationTypeDAO {
	List<VacationTypeVO> selectVacationTypeList() throws SQLException;
	
	void updateVacationType(VacationTypeVO vacaType) throws SQLException;
}
