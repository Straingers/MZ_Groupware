package com.spring.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.NoticeBoardVO;

public class NoticeBoardRegistCommand {
	private String noticeTitle;
	private String noticeContent;
	private String empNo;
	private Date noticeStartdate;
	private Date noticeEnddate;
	private String noticePopup ="N";
	private String noticeImportant ="N";
	
	private List<MultipartFile> uploadFile;
	
	
	
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


	public String getEmpNo() {
		return empNo;
	}


	public void setEmpNo(String empNo) {
		this.empNo = empNo;
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
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}


	public NoticeBoardVO toNoticeBoardVO() {
		NoticeBoardVO noticeboard= new NoticeBoardVO();
		noticeboard.setNoticeTitle(this.noticeTitle);
		noticeboard.setNoticeContent(this.noticeContent);
		noticeboard.setNoticePopup(this.noticePopup);
		noticeboard.setNoticeImportant(this.noticeImportant);
		noticeboard.setEmpNo(this.empNo);
		noticeboard.setNoticeStartdate(this.noticeStartdate);
		noticeboard.setNoticeEnddate(this.noticeEnddate);
		
		return noticeboard;
	}
}
