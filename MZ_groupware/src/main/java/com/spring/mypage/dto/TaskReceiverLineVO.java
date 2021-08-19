package com.spring.mypage.dto;

public class TaskReceiverLineVO {

	private int tasklineId;
	private String empNo;
	private String tasklineName;
	private String isDel;

	private String tasklineEmpno;
	private String tasklineType;
	private String empName;
	private String deptName;
	private String psName;
	
	// 수신, 참조자
    private String recEmp;
	private String ccEmp;
    public String getRecEmp() {
		return recEmp;
	}
	public void setRecEmp(String recEmp) {
		this.recEmp = recEmp;
	}
	public String getCcEmp() {
		return ccEmp;
	}
	public void setCcEmp(String ccEmp) {
		this.ccEmp = ccEmp;
	}
	
	// 리스트용
	private String ccEmpNo;
	private String ccEmpName;
	private String recEmpNo;
	private String recEmpName;
	
	public String getCcEmpNo() {
		return ccEmpNo;
	}
	public void setCcEmpNo(String ccEmpNo) {
		this.ccEmpNo = ccEmpNo;
	}
	public String getCcEmpName() {
		return ccEmpName;
	}
	public void setCcEmpName(String ccEmpName) {
		this.ccEmpName = ccEmpName;
	}
	public String getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(String recEmpNo) {
		this.recEmpNo = recEmpNo;
	}
	public String getRecEmpName() {
		return recEmpName;
	}
	public void setRecEmpName(String recEmpName) {
		this.recEmpName = recEmpName;
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

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getTasklineName() {
		return tasklineName;
	}

	public void setTasklineName(String tasklineName) {
		this.tasklineName = tasklineName;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
}
