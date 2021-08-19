package com.spring.mypage.dto;

public class TaskReceiverLineDetailVO {
	
	private int tasklineId;
	private String tasklineEmpno;
	private String tasklineType;
	

	
	private String empName;
	private String deptName;
	private String psName;
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
	
	
	
	public int getTasklineId() {
		return tasklineId;
	}
	public void setTasklineId(int tasklineId) {
		this.tasklineId = tasklineId;
	}
	public String getTasklineEmpno() {
		return tasklineEmpno;
	}
	public void setTasklineEmpno(String tasklineEmpno) {
		this.tasklineEmpno = tasklineEmpno;
	}
	public String getTasklineType() {
		return tasklineType;
	}
	public void setTasklineType(String tasklineType) {
		this.tasklineType = tasklineType;
	}
}
