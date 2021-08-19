package com.spring.command;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

public class DepartmentModifyCommand {
	private String modifyDeptCode;
	private String modifyDeptName;
	private String modifyDeptSuper;
	private String modifyDeptSuperNo;
	private String beforeDeptSuperNo;

	public String getBeforeDeptSuperNo() {
		return beforeDeptSuperNo;
	}

	public void setBeforeDeptSuperNo(String beforeDeptSuperNo) {
		this.beforeDeptSuperNo = beforeDeptSuperNo;
	}

	public String getModifyDeptCode() {
		return modifyDeptCode;
	}

	public void setModifyDeptCode(String modifyDeptCode) {
		this.modifyDeptCode = modifyDeptCode;
	}

	public String getModifyDeptName() {
		return modifyDeptName;
	}

	public void setModifyDeptName(String modifyDeptName) {
		this.modifyDeptName = modifyDeptName;
	}

	public String getModifyDeptSuper() {
		return modifyDeptSuper;
	}

	public void setModifyDeptSuper(String modifyDeptSuper) {
		this.modifyDeptSuper = modifyDeptSuper;
	}

	public String getModifyDeptSuperNo() {
		return modifyDeptSuperNo;
	}

	public void setModifyDeptSuperNo(String modifyDeptSuperNo) {
		this.modifyDeptSuperNo = modifyDeptSuperNo;
	}

	
	
	@Override
	public String toString() {
		return "DepartmentModifyCommand [modifyDeptCode=" + modifyDeptCode + ", modifyDeptName=" + modifyDeptName
				+ ", modifyDeptSuper=" + modifyDeptSuper + ", modifyDeptSuperNo=" + modifyDeptSuperNo + "]";
	}

	public DepartmentVO toDepartmentVO() {
		DepartmentVO department = new DepartmentVO();
		department.setDeptCode(modifyDeptCode);
		department.setDeptName(modifyDeptName);
		department.setDeptSuper(modifyDeptSuper);
		department.setDeptSuperNo(modifyDeptSuperNo);
		
		return department;
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(modifyDeptSuperNo);
		employee.setAuthority("ROLE_JANG");
		
		return employee;
	}
	
	public EmployeeVO toEmployeeRoleUserVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(beforeDeptSuperNo);
		employee.setAuthority("ROLE_USER");
		
		return employee;
	}
}
