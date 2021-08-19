package com.spring.dto;

public class DepartmentVO {
	
	private String deptCode;
	private String deptName;
	private String deptSuper;
	private String deptSuperNo;
	private String isUse;
	
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptSuper() {
		return deptSuper;
	}
	public void setDeptSuper(String deptSuper) {
		this.deptSuper = deptSuper;
	}
	public String getDeptSuperNo() {
		return deptSuperNo;
	}
	public void setDeptSuperNo(String deptSuperNo) {
		this.deptSuperNo = deptSuperNo;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	
	@Override
	public String toString() {
		return "DepartmentVO [deptCode=" + deptCode + ", deptName=" + deptName + ", deptSuper=" + deptSuper
				+ ", deptSuperNo=" + deptSuperNo + ", isUse=" + isUse + "]";
	}
}
