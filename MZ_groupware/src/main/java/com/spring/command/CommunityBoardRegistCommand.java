package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.CommunityBoardVO;

public class CommunityBoardRegistCommand {
	private String commTitle;
	private String commContent;
	private String empNo;
	private String communityCode;
	
	public String getCommunityCode() {
		return communityCode;
	}

	public void setCommunityCode(String communityCode) {
		this.communityCode = communityCode;
	}

	private List<MultipartFile> uploadFile;

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	

	@Override
	public String toString() {
		return "CommunityBoardRegistCommand [commTitle=" + commTitle + ", commContent=" + commContent + ", empNo="
				+ empNo + ", communityCode=" + communityCode + ", uploadFile=" + uploadFile + "]";
	}

	public CommunityBoardVO toCommunityBoardVO() {
		CommunityBoardVO communityboard = new CommunityBoardVO();
		communityboard.setCommContent(this.commContent);
		communityboard.setCommTitle(this.commTitle);
		communityboard.setEmpNo(this.empNo);
		communityboard.setCommunityCode(this.communityCode);
		
		return communityboard;
	}
}
