package com.spring.command;

import com.spring.dto.NoticeBoardVO;

public class NoticeBoardModifyCommand extends NoticeBoardRegistCommand{
	private int noticeNo = 0;
	private int[] deleteFile;
	

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	

	@Override
	public NoticeBoardVO toNoticeBoardVO() {
		NoticeBoardVO noticeBoard = super.toNoticeBoardVO();
		noticeBoard.setNoticeNo(this.noticeNo);
		
		return noticeBoard;
	}
}
