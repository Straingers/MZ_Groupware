package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.VacationDAO;
import com.spring.dto.VacationVO;

public class VacationServiceImpl implements VacationService {

	private VacationDAO vacationDAO;
	public void setVacationDAO(VacationDAO vacationDAO) {
		this.vacationDAO = vacationDAO;
	}

	
	@Override
	public List<VacationVO> getVacationList(VacationVO vacation) throws SQLException {
		return vacationDAO.selectMyVacationList(vacation);
	}
	
	@Override
	public List<VacationVO> getUseVacation(VacationVO vacation) throws SQLException {
		return vacationDAO.selectMyUseVacation(vacation);
	}

	@Override
	public void registVacstion(VacationVO vacation) throws SQLException {
		vacationDAO.insertVacation(vacation);
	}

	@Override
	public VacationVO getVacationByAppNo(int appNo) throws SQLException {
		return vacationDAO.selectVacationByAppNo(appNo);
	}
	
}
