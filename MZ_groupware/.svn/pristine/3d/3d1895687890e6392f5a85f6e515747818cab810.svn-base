package com.spring.command;

import com.spring.dto.EmployeeVO;

public class MyInfoCommand {
	private String empNo;
	private String empEmail1;
	private String empEmail2;
	private String empHp;
	private String empZipcode;
	private String empAddr1;
	private String empAddrGu;
	private String empAddr2;
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpEmail1() {
		return empEmail1;
	}
	public void setEmpEmail1(String empEmail1) {
		this.empEmail1 = empEmail1;
	}
	public String getEmpEmail2() {
		return empEmail2;
	}
	public void setEmpEmail2(String empEmail2) {
		this.empEmail2 = empEmail2;
	}
	public String getEmpHp() {
		return empHp;
	}
	public void setEmpHp(String empHp) {
		this.empHp = empHp;
	}
	public String getEmpZipcode() {
		return empZipcode;
	}
	public void setEmpZipcode(String empZipcode) {
		this.empZipcode = empZipcode;
	}
	public String getEmpAddr1() {
		return empAddr1;
	}
	public void setEmpAddr1(String empAddr1) {
		this.empAddr1 = empAddr1;
	}
	public String getEmpAddrGu() {
		return empAddrGu;
	}
	public void setEmpAddrGu(String empAddrGu) {
		this.empAddrGu = empAddrGu;
	}
	public String getEmpAddr2() {
		return empAddr2;
	}
	public void setEmpAddr2(String empAddr2) {
		this.empAddr2 = empAddr2;
	}
	
	public EmployeeVO toEmpVO(MyInfoCommand infoReq) {
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpNo(this.empNo);
		emp.setEmpEmail(this.empEmail1 + "@" + this.empEmail2);
		emp.setEmpHp(this.empHp);
		emp.setEmpZipcode(this.empZipcode);
		emp.setEmpAddr1(this.empAddr1 + this.empAddrGu);
		emp.setEmpAddr2(this.empAddr2);
		
		return emp;
	}
	
}
