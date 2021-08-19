package com.spring.command;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

public class DepartmentRegistCommand {
	private String registDeptCode;
	private String registDeptName;
	private String registDeptSuper;
	private String registDeptSuperNo;
	
	
	public String getRegistDeptSuperNo() {
		return registDeptSuperNo;
	}

	public void setRegistDeptSuperNo(String registDeptSuperNo) {
		this.registDeptSuperNo = registDeptSuperNo;
	}

	public String getRegistDeptCode() {
		return registDeptCode;
	}

	public void setRegistDeptCode(String registDeptCode) {
		this.registDeptCode = registDeptCode;
	}

	public String getRegistDeptName() {
		return registDeptName;
	}

	public void setRegistDeptName(String registDeptName) {
		this.registDeptName = registDeptName;
	}

	public String getRegistDeptSuper() {
		return registDeptSuper;
	}

	public void setRegistDeptSuper(String registDeptSuper) {
		this.registDeptSuper = registDeptSuper;
	}

	public DepartmentVO toDepartmentVO() {
		DepartmentVO department = new DepartmentVO();
		department.setDeptCode(registDeptCode);
		department.setDeptName(registDeptName);
		department.setDeptSuper(registDeptSuper);
		department.setDeptSuperNo(registDeptSuperNo);
		
		return department;
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(registDeptSuperNo);
		employee.setAuthority("ROLE_JANG");
		
		return employee;
	}
}
