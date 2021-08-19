package com.spring.command;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

public class DepartmentRemoveCommand {
	private String deptCode;
	private String deptSuper;
	private String authority;

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptSuper() {
		return deptSuper;
	}

	public void setDeptSuper(String deptSuper) {
		this.deptSuper = deptSuper;
	}



	public DepartmentVO toDepartmentVO() {
		DepartmentVO department = new DepartmentVO();
		department.setDeptCode(deptCode);
		department.setDeptSuper(deptSuper);
		
		return department;
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setAuthority(authority);
		employee.setDeptCode(deptCode);
		
		return employee;
	}
}
