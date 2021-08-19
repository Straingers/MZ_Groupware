package com.spring.ot.dto;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public class OtVO extends SearchCriteria{
	private int otNo;
	private String adminId;
	private String otTitle;
	private String otContent;
	private String otRegdate;
	private int otViewcnt;
	private String otUpdatedate;
	private String isDel;
	private String adminEmpNo;
	private String adminName;
	
	//attach
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private int[] deleteFile;
	public int getOtNo() {
		return otNo;
	}
	public void setOtNo(int otNo) {
		this.otNo = otNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getOtTitle() {
		return otTitle;
	}
	public void setOtTitle(String otTitle) {
		this.otTitle = otTitle;
	}
	public String getOtContent() {
		return otContent;
	}
	public void setOtContent(String otContent) {
		this.otContent = otContent;
	}
	public String getOtRegdate() {
		return otRegdate;
	}
	public void setOtRegdate(String otRegdate) {
		this.otRegdate = otRegdate;
	}
	public int getOtViewcnt() {
		return otViewcnt;
	}
	public void setOtViewcnt(int otViewcnt) {
		this.otViewcnt = otViewcnt;
	}
	public String getOtUpdatedate() {
		return otUpdatedate;
	}
	public void setOtUpdatedate(String otUpdatedate) {
		this.otUpdatedate = otUpdatedate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getAdminEmpNo() {
		return adminEmpNo;
	}
	public void setAdminEmpNo(String adminEmpNo) {
		this.adminEmpNo = adminEmpNo;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	@Override
	public String toString() {
		return "OtVO [otNo=" + otNo + ", adminId=" + adminId + ", otTitle=" + otTitle + ", otContent=" + otContent
				+ ", otRegdate=" + otRegdate + ", otViewcnt=" + otViewcnt + ", otUpdatedate=" + otUpdatedate
				+ ", isDel=" + isDel + ", adminEmpNo=" + adminEmpNo + ", adminName=" + adminName + ", attachList="
				+ attachList + ", uploadFile=" + uploadFile + ", deleteFile=" + Arrays.toString(deleteFile) + "]";
	}
	
}
