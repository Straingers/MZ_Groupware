package com.spring.dto;

import java.util.Date;
import java.util.List;

public class CommunityBoardVO {
	private String communityCode;
	private String communityName;
	private int commNo;
	private String empNo;
	private String commTitle;
	private String commContent;
	private String commWriter;
	private Date commRegdate;
	private int commViewcnt;
	private Date commUpdatedate;
	private String isDel;
	
	
	private String empName;
	private List<CommunityReplyVO> replyList;
	
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	private List<AttachVO> attachList;
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public String getCommunityCode() {
		return communityCode;
	}
	public void setCommunityCode(String communityCode) {
		this.communityCode = communityCode;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getCommTitle() {
		return commTitle;
	}
	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}
	public String getCommWriter() {
		return commWriter;
	}
	public void setCommWriter(String commWriter) {
		this.commWriter = commWriter;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public Date getCommRegdate() {
		return commRegdate;
	}
	public void setCommRegdate(Date commRegdate) {
		this.commRegdate = commRegdate;
	}
	public int getCommViewcnt() {
		return commViewcnt;
	}
	public void setCommViewcnt(int commViewcnt) {
		this.commViewcnt = commViewcnt;
	}
	public Date getCommUpdatedate() {
		return commUpdatedate;
	}
	public void setCommUpdatedate(Date commUpdatedate) {
		this.commUpdatedate = commUpdatedate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public List<CommunityReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<CommunityReplyVO> replyList) {
		this.replyList = replyList;
	}
	
	@Override
	public String toString() {
		return "CommunityBoardVO [communityCode=" + communityCode + ", communityName=" + communityName + ", commNo="
				+ commNo + ", empNo=" + empNo + ", commTitle=" + commTitle + ", commContent=" + commContent
				+ ", commWriter=" + commWriter + ", commRegdate=" + commRegdate + ", commViewcnt=" + commViewcnt
				+ ", commUpdatedate=" + commUpdatedate + ", isDel=" + isDel + ", empName=" + empName + ", replyList="
				+ replyList + ", attachList=" + attachList + "]";
	}
}
