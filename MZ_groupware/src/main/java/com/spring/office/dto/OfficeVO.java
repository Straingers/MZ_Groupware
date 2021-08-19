package com.spring.office.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public class OfficeVO extends SearchCriteria{
	private int officeNo;
	private String adminId;
	private String officeTitle;
	private String officeContent;
	private String officeRegdate;
	private int officeViewcnt;
	private String officeUpdatedate;
	private String isDel;
	private String adminEmpNo;
	private String adminName;
	
	//attach
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private int[] deleteFile;
	
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminEmpNo() {
		return adminEmpNo;
	}
	public void setAdminEmpNo(String adminEmpNo) {
		this.adminEmpNo = adminEmpNo;
	}
	public int getOfficeNo() {
		return officeNo;
	}
	public void setOfficeNo(int officeNo) {
		this.officeNo = officeNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getOfficeTitle() {
		return officeTitle;
	}
	public void setOfficeTitle(String officeTitle) {
		this.officeTitle = officeTitle;
	}
	public String getOfficeContent() {
		return officeContent;
	}
	public void setOfficeContent(String officeContent) {
		this.officeContent = officeContent;
	}
	public String getOfficeRegdate() {
		return officeRegdate;
	}
	public void setOfficeRegdate(String officeRegdate) {
		this.officeRegdate = officeRegdate;
	}
	public int getOfficeViewcnt() {
		return officeViewcnt;
	}
	public void setOfficeViewcnt(int officeViewcnt) {
		this.officeViewcnt = officeViewcnt;
	}
	public String getOfficeUpdatedate() {
		return officeUpdatedate;
	}
	public void setOfficeUpdatedate(String officeUpdatedate) {
		this.officeUpdatedate = officeUpdatedate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	
	@Override
	public String toString() {
		return "OfficeVO [officeNo=" + officeNo + ", adminId=" + adminId + ", officeTitle=" + officeTitle
				+ ", officeContent=" + officeContent + ", officeRegdate=" + officeRegdate + ", officeViewcnt="
				+ officeViewcnt + ", officeUpdatedate=" + officeUpdatedate + ", isDel=" + isDel + ", adminEmpNo="
				+ adminEmpNo + ", adminName=" + adminName + ", attachList=" + attachList + "]";
	}
	
}
