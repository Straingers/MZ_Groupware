package com.spring.member.history.dto;

import java.util.Date;

public class TransferHistoryVO {
	private String transNo;
	private String empNo;
	private String psName;
	private Date transDate;
	private String transStatus;
	private Date transEndDate;
	private Date transStartDate;
	
	private String strTransDate;
	private String strTransEndDate;
	private String strTransStartDate;
	
	private String empName;
	private String empTel;
	private String empPhoto;
	private String deptCode;
	private String psCode;
	private String empStatus;
	private String deptName;
	
	public String getPsName() {
		return psName;
	}
	public void setPsName(String psName) {
		this.psName = psName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getTransNo() {
		return transNo;
	}
	public void setTransNo(String transNo) {
		this.transNo = transNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public Date getTransDate() {
		return transDate;
	}
	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}
	public String getTransStatus() {
		return transStatus;
	}
	public void setTransStatus(String transStatus) {
		this.transStatus = transStatus;
	}
	public Date getTransEndDate() {
		return transEndDate;
	}
	public void setTransEndDate(Date transEndDate) {
		this.transEndDate = transEndDate;
	}
	public Date getTransStartDate() {
		return transStartDate;
	}
	public void setTransStartDate(Date transStartDate) {
		this.transStartDate = transStartDate;
	}
	public String getStrTransDate() {
		return strTransDate;
	}
	public void setStrTransDate(String strTransDate) {
		this.strTransDate = strTransDate;
	}
	public String getStrTransEndDate() {
		return strTransEndDate;
	}
	public void setStrTransEndDate(String strTransEndDate) {
		this.strTransEndDate = strTransEndDate;
	}
	public String getStrTransStartDate() {
		return strTransStartDate;
	}
	public void setStrTransStartDate(String strTransStartDate) {
		this.strTransStartDate = strTransStartDate;
	}
	
	@Override
	public String toString() {
		return "TransferHistoryVO [transNo=" + transNo + ", empNo=" + empNo + ", psName=" + psName + ", transDate="
				+ transDate + ", transStatus=" + transStatus + ", transEndDate=" + transEndDate + ", transStartDate="
				+ transStartDate + ", strTransDate=" + strTransDate + ", strTransEndDate=" + strTransEndDate
				+ ", strTransStartDate=" + strTransStartDate + ", empName=" + empName + ", empTel=" + empTel
				+ ", empPhoto=" + empPhoto + ", deptCode=" + deptCode + ", psCode=" + psCode + ", empStatus="
				+ empStatus + ", deptName=" + deptName + "]";
	}
	
}
