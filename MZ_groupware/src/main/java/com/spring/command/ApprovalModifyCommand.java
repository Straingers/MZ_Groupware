package com.spring.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.approval.dto.ApprovalVO;

public class ApprovalModifyCommand extends ApprovalRegistCommand{

	private int appNo;
	private int[] deleteFile;
	
	private String appTitle;
	private String appContent;
	private String empNo;
	private String appTemp;
	
	private String firstEmp;
	private String secondEmp;
	private String thirdEmp;
	
	private String[] helpEmp;
	private String[] refEmp;
	private String[] readEmp;
	
	private String docId;
	private String appStatus;
	
	private List<MultipartFile> uploadFile;
	
	public int getAppNo() {
		return appNo;
	}

	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}

	public int[] getDeleteFile() {
		return deleteFile;
	}
	
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	public String getAppTitle() {
		return appTitle;
	}
	
	public String getAppContent() {
		return appContent;
	}
	
	public String getEmpNo() {
		return empNo;
	}
	
	public String getAppTemp() {
		return appTemp;
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
	
	public String getDocId() {
		return docId;
	}
	
	public String getAppStatus() {
		return appStatus;
	}
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	
	public void setAppTitle(String appTitle) {
		this.appTitle = appTitle;
	}
	
	public void setAppContent(String appContent) {
		this.appContent = appContent;
	}
	
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	public void setAppTemp(String appTemp) {
		this.appTemp = appTemp;
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
	
	public void setDocId(String docId) {
		this.docId = docId;
	}
	
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}
	
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	@Override
	public ApprovalVO toApprovalVO() {

		ApprovalVO approval = super.toApprovalVO();
		approval.setAppNo(this.appNo);
		
		approval.setAppTitle(this.appTitle);
		approval.setAppContent(this.appContent);
		approval.setEmpNo(this.empNo);
		approval.setAppUpDate(new Date());
		approval.setAppTemp(this.appTemp);
		
		approval.setFirstEmp(this.firstEmp);
		approval.setSecondEmp(this.secondEmp);
		approval.setThirdEmp(this.thirdEmp);
		approval.setHelpEmp(this.helpEmp);
		approval.setRefEmp(this.refEmp);
		approval.setReadEmp(this.readEmp);
		
		approval.setDocId(this.docId);
		approval.setAppStatus(this.appStatus);
		
		return approval;
	}

}
