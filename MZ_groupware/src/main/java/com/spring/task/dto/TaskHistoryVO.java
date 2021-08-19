package com.spring.task.dto;

import java.util.Date;

public class TaskHistoryVO {
	
	private String taskReceiver;
	private int taskNo;
	private String taskSign;
	private Date taskConfirmDate;
	private String taskReceiverType;
	private String taskReceiveImportant;
	private String empNo;
	
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	// view 정보 (이름, 부서명, 직위명)
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
	
	
	public String getTaskReceiveImportant() {
		return taskReceiveImportant;
	}
	public void setTaskReceiveImportant(String taskReceiveImportant) {
		this.taskReceiveImportant = taskReceiveImportant;
	}
	public String getTaskReceiver() {
		return taskReceiver;
	}
	public void setTaskReceiver(String taskReceiver) {
		this.taskReceiver = taskReceiver;
	}
	public int getTaskNo() {
		return taskNo;
	}
	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}
	public String getTaskSign() {
		return taskSign;
	}
	public void setTaskSign(String taskSign) {
		this.taskSign = taskSign;
	}
	public Date getTaskConfirmDate() {
		return taskConfirmDate;
	}
	public void setTaskConfirmDate(Date taskConfirmDate) {
		this.taskConfirmDate = taskConfirmDate;
	}
	public String getTaskReceiverType() {
		return taskReceiverType;
	}
	public void setTaskReceiverType(String taskReceiverType) {
		this.taskReceiverType = taskReceiverType;
	}
}
