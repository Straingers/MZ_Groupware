package com.spring.command;

import com.spring.dto.CommuteVO;

public class CommuteRegistCommand {
	
	private String empNo;
	private String empName;
	private String deptName;
	private String psName;
	private String inTime;
	private String inType;
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPsName() {
		return psName;
	}
	public void setPsName(String psName) {
		this.psName = psName;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getInType() {
		return inType;
	}
	public void setInType(String inType) {
		this.inType = inType;
	}
	
	public CommuteVO toCommuteVO() {
		CommuteVO comm = new CommuteVO();
		comm.setEmpNo(empNo);
		comm.setEmpName(empName);
		comm.setDeptName(deptName);
		comm.setPsName(psName);
		comm.setInTime(inTime);
		comm.setInType(inType);
		return comm;
	}
	
}
