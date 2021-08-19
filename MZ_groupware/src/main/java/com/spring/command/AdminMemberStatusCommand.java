package com.spring.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.spring.dto.EmployeeVO;
import com.spring.member.history.dto.TransferHistoryVO;

public class AdminMemberStatusCommand {
	private String empNo;
	private String psCode;
	private String empName;
	private String transStatus;
	private String deptCode;
	private String transStartDate;
	private String transEndDate;
	
	public String getTransStartDate() {
		return transStartDate;
	}
	public void setTransStartDate(String transStartDate) {
		this.transStartDate = transStartDate;
	}
	public String getTransEndDate() {
		return transEndDate;
	}
	public void setTransEndDate(String transEndDate) {
		this.transEndDate = transEndDate;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getTransStatus() {
		return transStatus;
	}
	public void setTransStatus(String transStatus) {
		this.transStatus = transStatus;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	
	@Override
	public String toString() {
		return "AdminMemberStatusCommand [empNo=" + empNo + ", psCode=" + psCode + ", empName=" + empName
				+ ", transStatus=" + transStatus + ", deptCode=" + deptCode + "]";
	}
	
	public EmployeeVO toEmployeeVO() {
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(empNo);
		employee.setPsCode(psCode);
		employee.setDeptCode(deptCode);
		if("휴직".equals(transStatus)) {
			employee.setEmpStatus("휴직");
		}
		if("복직".equals(transStatus)) {
			employee.setEmpStatus("재직");
		}
		if("퇴사".equals(transStatus)) {
			employee.setEmpStatus("퇴직");
		}
		
		return employee;
	}
	
	public TransferHistoryVO toTransferHistoryVO() throws ParseException {
		TransferHistoryVO transferHistory = new TransferHistoryVO();
		transferHistory.setEmpNo(empNo);
		transferHistory.setEmpName(empName);
		transferHistory.setTransStatus(transStatus);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
		if(transStartDate != null) {
			transferHistory.setTransStartDate(transFormat.parse(transStartDate));
		}
		if(transEndDate != null) {
			transferHistory.setTransEndDate(transFormat.parse(transEndDate));
		}
		
		return transferHistory;
	}
}
