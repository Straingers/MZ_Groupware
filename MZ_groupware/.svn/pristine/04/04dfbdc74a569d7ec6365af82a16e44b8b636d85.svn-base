package com.spring.pds.dto;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;

public class PdsVO extends SearchCriteria{
	private int pdsNo;
	private String empNo;
	private String title;
	private String content;
	private String regdate;
	private int viewcnt;
	private String updatedate;
	private String isDel;
	private String empName;
	
	//attach
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private int[] deleteFile;
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getPdsNo() {
		return pdsNo;
	}
	public void setPdsNo(int pdsNo) {
		this.pdsNo = pdsNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
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
		return "PdsVO [pdsNo=" + pdsNo + ", empNo=" + empNo + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", updatedate=" + updatedate + ", isDel=" + isDel + ", attachList="
				+ attachList + ", uploadFile=" + uploadFile + ", deleteFile=" + Arrays.toString(deleteFile) + "]";
	}
	
}
