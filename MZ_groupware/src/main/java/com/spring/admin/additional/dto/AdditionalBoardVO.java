package com.spring.admin.additional.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.AttachVO;

public class AdditionalBoardVO {
	private int addNo;
	private String boardCode;
	private String menuName;
	private String empNo;
	private String empName;
	private String addTitle;
	private String addContent;
	private String addRegdate;
	private int addViewcnt;
	private String addUpdatedate;
	private String isDel;
	
	private List<AttachVO> attachList;
	private List<MultipartFile> uploadFile;
	private int[] deleteFile;
	
	public int getAddNo() {
		return addNo;
	}

	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
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

	public String getAddTitle() {
		return addTitle;
	}

	public void setAddTitle(String addTitle) {
		this.addTitle = addTitle;
	}

	public String getAddContent() {
		return addContent;
	}

	public void setAddContent(String addContent) {
		this.addContent = addContent;
	}

	public String getAddRegdate() {
		return addRegdate;
	}

	public void setAddRegdate(String addRegdate) {
		this.addRegdate = addRegdate;
	}

	public int getAddViewcnt() {
		return addViewcnt;
	}

	public void setAddViewcnt(int addViewcnt) {
		this.addViewcnt = addViewcnt;
	}

	public String getAddUpdatedate() {
		return addUpdatedate;
	}

	public void setAddUpdatedate(String addUpdatedate) {
		this.addUpdatedate = addUpdatedate;
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
		return "AdditionalBoardVO [addNo=" + addNo + ", boardCode=" + boardCode + ", menuName=" + menuName + ", empNo="
				+ empNo + ", empName=" + empName + ", addTitle=" + addTitle + ", addContent=" + addContent
				+ ", addRegdate=" + addRegdate + ", addViewcnt=" + addViewcnt + ", addUpdatedate=" + addUpdatedate
				+ ", isDel=" + isDel + ", attachList=" + attachList + ", uploadFile=" + uploadFile + "]";
	}
	
}
