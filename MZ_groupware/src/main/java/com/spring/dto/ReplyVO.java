package com.spring.dto;

import java.util.Date;

public class ReplyVO {

	private int replyNo;		
	private String appNo;		
	private String replytext;	
	private String replyer;		
	private Date replyRegdate;	
	private String isDel;	
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getAppNo() {
		return appNo;
	}
	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(Date replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", appNo=" + appNo + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", replyRegdate=" + replyRegdate + ", isDel=" + isDel + "]";
	}
}
