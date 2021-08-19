package com.spring.cloud.dto;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public class FileVO extends SearchCriteria{
	private int cloudNo;
	private String cloudFolderCode;
	private String cloudUploadpath;
	private String cloudFilename;
	private String filename;
	private String cloudFiletype;
	private String cloudAttacher;
	private String cloudRegdate;
	private String isDel;
	
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private int[] deleteFile;
	
	
	
	// 로그용
	private String cloudFolderName;
	private String empNo;
	private String empName;
	private String deptName;
	private String psName;
	private Date cloudDate;
	public Date getCloudDate() {
		return cloudDate;
	}
	public void setCloudDate(Date cloudDate) {
		this.cloudDate = cloudDate;
	}
	public String getCloudFolderName() {
		return cloudFolderName;
	}
	public void setCloudFolderName(String cloudFolderName) {
		this.cloudFolderName = cloudFolderName;
	}
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	public int getCloudNo() {
		return cloudNo;
	}
	public void setCloudNo(int cloudNo) {
		this.cloudNo = cloudNo;
	}
	public String getCloudFolderCode() {
		return cloudFolderCode;
	}
	public void setCloudFolderCode(String cloudFolderCode) {
		this.cloudFolderCode = cloudFolderCode;
	}
	public String getCloudUploadpath() {
		return cloudUploadpath;
	}
	public void setCloudUploadpath(String cloudUploadpath) {
		this.cloudUploadpath = cloudUploadpath;
	}
	public String getCloudFilename() {
		return cloudFilename;
	}
	public void setCloudFilename(String cloudFilename) {
		this.cloudFilename = cloudFilename;
	}
	public String getCloudFiletype() {
		return cloudFiletype;
	}
	public void setCloudFiletype(String cloudFiletype) {
		this.cloudFiletype = cloudFiletype;
	}
	public String getCloudAttacher() {
		return cloudAttacher;
	}
	public void setCloudAttacher(String cloudAttacher) {
		this.cloudAttacher = cloudAttacher;
	}
	public String getCloudRegdate() {
		return cloudRegdate;
	}
	public void setCloudRegdate(String cloudRegdate) {
		this.cloudRegdate = cloudRegdate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	@Override
	public String toString() {
		return "FileVO [cloudNo=" + cloudNo + ", cloudFolderCode=" + cloudFolderCode + ", cloudUploadpath="
				+ cloudUploadpath + ", cloudFilename=" + cloudFilename + ", cloudFiletype=" + cloudFiletype
				+ ", cloudAttacher=" + cloudAttacher + ", cloudRegdate=" + cloudRegdate + ", isDel=" + isDel
				+ ", attachList=" + attachList + ", uploadFile=" + uploadFile + ", deleteFile="
				+ Arrays.toString(deleteFile) + "]";
	}
	
	
}
