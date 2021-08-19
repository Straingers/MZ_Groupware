package com.spring.approval.dto;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.spring.command.SearchCriteria;

public class ApprovalVO extends SearchCriteria {


	private int appNo;
	private String empNo; // 기안자 and 작성자
	private String empName;
	private String deptName;
	private String docId;
	private String docName;
	private String appTitle;
	private String appContent;
	private String appTemp;
	
	private String firstEmp;
	private String secondEmp;
	private String thirdEmp;
	
	private String[] helpEmp;
	private String[] refEmp;
	private String[] readEmp;
	
	private String appSign;
	private String appStatus;
	private String appLevel;
	private Date appUpDate;
	
	private int viewcnt;
	
	
	// 로그용
	private String psName;
	private String appType;
	private Date appDate;
	public String getPsName() {
		return psName;
	}
	public void setPsName(String psName) {
		this.psName = psName;
	}
	public String getAppType() {
		return appType;
	}
	public void setAppType(String appType) {
		this.appType = appType;
	}
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	
	

	private List<ApprovalAttachVO> attachList;
	
	private List<ApprovalHistoryVO> approvalHistoryList;
	
	public List<ApprovalHistoryVO> getApprovalHistoryList() {
		return approvalHistoryList;
	}
	public void setApprovalHistoryList(List<ApprovalHistoryVO> approvalHistoryList) {
		this.approvalHistoryList = approvalHistoryList;
	}
	public List<ApprovalAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<ApprovalAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getAppTitle() {
		return appTitle;
	}
	public void setAppTitle(String appTitle) {
		this.appTitle = appTitle;
	}
	public String getAppContent() {
		return appContent;
	}
	public void setAppContent(String appContent) {
		this.appContent = appContent;
	}
	public String getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}
	public Date getAppUpDate() {
		return appUpDate;
	}
	public void setAppUpDate(Date appUpDate) {
		this.appUpDate = appUpDate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public String getFirstEmp() {
		return firstEmp;
	}
	public String getSecondEmp() {
		return secondEmp;
	}
	public String getThirdEmp() {
		return thirdEmp;
	}
	public String[] getHelpEmp() {
		return helpEmp;
	}
	public String[] getRefEmp() {
		return refEmp;
	}
	public String[] getReadEmp() {
		return readEmp;
	}
	public void setFirstEmp(String firstEmp) {
		this.firstEmp = firstEmp;
	}
	public void setSecondEmp(String secondEmp) {
		this.secondEmp = secondEmp;
	}
	public void setThirdEmp(String thirdEmp) {
		this.thirdEmp = thirdEmp;
	}
	public void setHelpEmp(String[] helpEmp) {
		this.helpEmp = helpEmp;
	}
	public void setRefEmp(String[] refEmp) {
		this.refEmp = refEmp;
	}
	public void setReadEmp(String[] readEmp) {
		this.readEmp = readEmp;
	}
	public String getAppTemp() {
		return appTemp;
	}
	public void setAppTemp(String appTemp) {
		this.appTemp = appTemp;
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
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getAppSign() {
		return appSign;
	}
	public void setAppSign(String appSign) {
		this.appSign = appSign;
	}
	public String getAppLevel() {
		return appLevel;
	}
	public void setAppLevel(String appLevel) {
		this.appLevel = appLevel;
	}
	
	
	@Override
	public String toString() {
		return "ApprovalVO [appNo=" + appNo + ", empNo=" + empNo + ", empName=" + empName + ", docId=" + docId
				+ ", appTitle=" + appTitle + ", appContent=" + appContent + ", appTemp=" + appTemp + ", firstEmp="
				+ firstEmp + ", secondEmp=" + secondEmp + ", thirdEmp=" + thirdEmp + ", helpEmp="
				+ Arrays.toString(helpEmp) + ", refEmp=" + Arrays.toString(refEmp) + ", readEmp="
				+ Arrays.toString(readEmp) + ", appStatus=" + appStatus + ", appUpDate=" + appUpDate + ", viewcnt="
				+ viewcnt + ", attachList=" + attachList + ", approvalHistoryList=" + approvalHistoryList + "]";
	}
}
