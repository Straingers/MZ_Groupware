package com.spring.position.dto;

import java.util.List;

import com.spring.dto.EmployeeVO;

public class PositionVO {
	private String psCode;
	private String psName;
	private String isUse;
	private String psLevel;
	
	private List<EmployeeVO> employee;
	
	public List<EmployeeVO> getEmployee() {
		return employee;
	}
	public void setEmployee(List<EmployeeVO> employee) {
		this.employee = employee;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getPsName() {
		return psName;
	}
	public void setPsName(String psName) {
		this.psName = psName;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getPsLevel() {
		return psLevel;
	}
	public void setPsLevel(String psLevel) {
		this.psLevel = psLevel;
	}
	
	@Override
	public String toString() {
		return "PositionVO [psCode=" + psCode + ", psName=" + psName + ", isUse=" + isUse + ", psLevel=" + psLevel
				+ "]";
	}
}
