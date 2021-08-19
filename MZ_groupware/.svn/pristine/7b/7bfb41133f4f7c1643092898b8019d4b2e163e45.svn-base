package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.EmployeeVO;

public class EmployeeModifyCommand {
	private String empNo;
	private String oldPicture;
	private MultipartFile picture;
	private String empTel;
	private String qrCode;
	
	public String getQrCode() {
		return qrCode;
	}
	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	
	@Override
	public String toString() {
		return "EmployeeModifyCommand [empNo=" + empNo + ", oldPicture=" + oldPicture + ", picture=" + picture
				+ ", empTel=" + empTel + "]";
	}
	
	public EmployeeVO toEmployee() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(empNo);
		employee.setEmpTel(empTel);
		employee.setQrCode(qrCode);
		
		return employee;
	}
}
