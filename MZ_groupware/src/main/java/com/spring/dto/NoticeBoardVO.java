package com.spring.dto;

import java.util.Date;
import java.util.List;

public class NoticeBoardVO {
	
	private int noticeNo;
	private String adminId;
	private String empName;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegdate;
	private String stringNoticeRegdate;
	private int noticeViewcnt;
	private Date noticeStartdate;
	private Date  noticeEnddate;
	private Date  noticeUpdatedate;
	private String noticePopup = "N";
	private String noticeImportant = "N";
	private String isDel;
	
	private List<AttachVO> attachList;
	
	private String empNo;
	
	
	
	
	
	public String getStringNoticeRegdate() {
		return stringNoticeRegdate;
	}
	public void setStringNoticeRegdate(String stringNoticeRegdate) {
		this.stringNoticeRegdate = stringNoticeRegdate;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeRegdate() {
		return noticeRegdate;
	}
	public void setNoticeRegdate(Date noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	public int getNoticeViewcnt() {
		return noticeViewcnt;
	}
	public void setNoticeViewcnt(int noticeViewcnt) {
		this.noticeViewcnt = noticeViewcnt;
	}
	public Date getNoticeStartdate() {
		return noticeStartdate;
	}
	public void setNoticeStartdate(Date noticeStartdate) {
		this.noticeStartdate = noticeStartdate;
	}
	public Date getNoticeEnddate() {
		return noticeEnddate;
	}
	public void setNoticeEnddate(Date noticeEnddate) {
		this.noticeEnddate = noticeEnddate;
	}
	public Date getNoticeUpdatedate() {
		return noticeUpdatedate;
	}
	public void setNoticeUpdatedate(Date noticeUpdatedate) {
		this.noticeUpdatedate = noticeUpdatedate;
	}
	public String getNoticePopup() {
		return noticePopup;
	}
	public void setNoticePopup(String noticePopup) {
		this.noticePopup = noticePopup;
	}
	public String getNoticeImportant() {
		return noticeImportant;
	}
	public void setNoticeImportant(String noticeImportant) {
		this.noticeImportant = noticeImportant;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	@Override
	public String toString() {
		return "NoticeBoardVO [noticeNo=" + noticeNo + ", adminId=" + adminId + ", empName=" + empName
				+ ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeRegdate="
				+ noticeRegdate + ", stringNoticeRegdate=" + stringNoticeRegdate + ", noticeViewcnt=" + noticeViewcnt
				+ ", noticeStartdate=" + noticeStartdate + ", noticeEnddate=" + noticeEnddate + ", noticeUpdatedate="
				+ noticeUpdatedate + ", noticePopup=" + noticePopup + ", noticeImportant=" + noticeImportant
				+ ", isDel=" + isDel + ", attachList=" + attachList + ", empNo=" + empNo + "]";
	}
	 
}
