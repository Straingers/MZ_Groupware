package com.spring.task.dto;

import java.util.Date;

public class TaskReplyVO {
	
	private int rno;
	private int taskNo;
	private String taskReplyer;
	private String taskReplytext;
	private Date taskRegdate;
	private String isDel;
	
	
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
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getTaskNo() {
		return taskNo;
	}
	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}
	public String getTaskReplyer() {
		return taskReplyer;
	}
	public void setTaskReplyer(String taskReplyer) {
		this.taskReplyer = taskReplyer;
	}
	public String getTaskReplytext() {
		return taskReplytext;
	}
	public void setTaskReplytext(String taskReplytext) {
		this.taskReplytext = taskReplytext;
	}
	public Date getTaskRegdate() {
		return taskRegdate;
	}
	public void setTaskRegdate(Date taskRegdate) {
		this.taskRegdate = taskRegdate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
}
