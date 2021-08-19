package com.spring.admin.additional.dto;

public class AdditionalTypeVO {
	private String boardCode;
	private String boardName;
	private String replyUse;
	private int attachNum;
	private String attachSize;
	private String attachTotalSize;
	private String isUse;
	private String isDel;
	
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getReplyUse() {
		return replyUse;
	}
	public void setReplyUse(String replyUse) {
		this.replyUse = replyUse;
	}
	public int getAttachNum() {
		return attachNum;
	}
	public void setAttachNum(int attachNum) {
		this.attachNum = attachNum;
	}
	public String getAttachSize() {
		return attachSize;
	}
	public void setAttachSize(String attachSize) {
		this.attachSize = attachSize;
	}
	public String getAttachTotalSize() {
		return attachTotalSize;
	}
	public void setAttachTotalSize(String attachTotalSize) {
		this.attachTotalSize = attachTotalSize;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	
}
