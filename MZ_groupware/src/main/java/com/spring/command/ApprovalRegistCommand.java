package com.spring.command;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.approval.dto.ApprovalVO;

public class ApprovalRegistCommand {

	private int appNo;
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
	
	// 휴가문서일경우
	private String vacaStartDay;
	private String vacaEndDay;
	private String vacaDay;
	private String vacaReason;
	
	private List<MultipartFile> uploadFile;


	public int getAppNo() {
		return appNo;
	}
	public void setAppNo(int appNo) {
		this.appNo = appNo;
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
	public String getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
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
	public String getVacaStartDay() {
		return vacaStartDay;
	}
	public void setVacaStartDay(String vacaStartDay) {
		this.vacaStartDay = vacaStartDay;
	}
	public String getVacaEndDay() {
		return vacaEndDay;
	}
	public void setVacaEndDay(String vacaEndDay) {
		this.vacaEndDay = vacaEndDay;
	}
	public String getVacaDay() {
		return vacaDay;
	}
	public void setVacaDay(String vacaDay) {
		this.vacaDay = vacaDay;
	}
	public String getVacaReason() {
		return vacaReason;
	}
	public void setVacaReason(String vacaReason) {
		this.vacaReason = vacaReason;
	}
	
	@Override
	public String toString() {
		return "ApprovalRegistCommand [appNo=" + appNo + ", appTitle=" + appTitle + ", appContent=" + appContent
				+ ", empNo=" + empNo + ", appTemp=" + appTemp + ", firstEmp=" + firstEmp + ", secondEmp=" + secondEmp
				+ ", thirdEmp=" + thirdEmp + ", helpEmp=" + Arrays.toString(helpEmp) + ", refEmp="
				+ Arrays.toString(refEmp) + ", readEmp=" + Arrays.toString(readEmp) + ", docId=" + docId
				+ ", appStatus=" + appStatus + ", uploadFile=" + uploadFile + "]";
	}
	
	public ApprovalVO toApprovalVO() {
		ApprovalVO approval = new ApprovalVO();
		
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
