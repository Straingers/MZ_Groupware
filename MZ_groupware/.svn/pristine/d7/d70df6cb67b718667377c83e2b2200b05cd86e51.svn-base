package com.spring.admin.commute.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.commute.dao.VacationTypeDAO;
import com.spring.admin.commute.dto.VacationTypeVO;
import com.spring.dao.EmployeeDAO;
import com.spring.dto.EmployeeVO;

public class VacationTypeServiceImpl implements VacationTypeService {
	
	private VacationTypeDAO vacationTypeDAO;
	public void setVacationTypeDAO(VacationTypeDAO vacationTypeDAO) {
		this.vacationTypeDAO = vacationTypeDAO;
	}
	private EmployeeDAO employeeDAO;
	public void setEmplyeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	@Override
	public List<VacationTypeVO> getVacationTypeList() throws SQLException {
		return vacationTypeDAO.selectVacationTypeList();
	}
	
	@Override
	public void updateTypeList(VacationTypeVO vacaType) throws SQLException {
		List<VacationTypeVO> vacaList = vacationTypeDAO.selectVacationTypeList();
		int ogDay = 0;
		for(VacationTypeVO vaca : vacaList) {
			if(vaca.getVacCode().equals(vacaType.getVacCode())) {
				ogDay = Integer.parseInt(vaca.getVacDays()) - 15;
			}
		}
		vacationTypeDAO.updateVacationType(vacaType);
		
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpVac(Integer.parseInt(vacaType.getVacDays()) - ogDay);
		emp.setAppPwd(Integer.parseInt(vacaType.getVacCode()));
		employeeDAO.updateEmpVac(emp);
	}
	
	
}
