package com.spring.command;

import java.util.Arrays;

import com.spring.dto.CommunityBoardVO;

public class CommunityBoardModifyCommand extends CommunityBoardRegistCommand{
	private int commNo = 0;
	private int[] deleteFile;
	
	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public String toString() {
		return "CommunityBoardModifyCommand [commNo=" + commNo + ", deleteFile=" + Arrays.toString(deleteFile) + "]";
	}

	@Override
	public CommunityBoardVO toCommunityBoardVO() {
		CommunityBoardVO communityBoard = super.toCommunityBoardVO();
		communityBoard.setCommNo(this.commNo);
		communityBoard.setCommunityCode(this.getCommunityCode());
		
		return communityBoard;
	}
}
