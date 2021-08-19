package com.spring.command;

import java.util.Date;

import com.spring.dto.CommunityReplyVO;

public class CommunityReplyRegistCommand {
	private int commNo; // 글번호
	private String replyer; //댓글 작성자
	private String replytext; //댓글 내용
	private String communityCode; //커뮤니티 게시판 코드.
	
	public String getCommunityCode() {
		return communityCode;
	}

	public void setCommunityCode(String communityCode) {
		this.communityCode = communityCode;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	

	@Override
	public String toString() {
		return "CommunityReplyRegistCommand [commNo=" + commNo + ", replyer=" + replyer + ", replytext=" + replytext
				+ ", communityCode=" + communityCode + "]";
	}

	public CommunityReplyVO toReplyVO() { // Service 호출하기 위해서 ReplyVO에 담을 메서드 생성 (vo에 담을때는 최대한 vo 데이터 넣을 수 있는것은 넣어야 함. => 나중에 없어서 문제될 수 있는 것을 방지함)
		CommunityReplyVO reply = new CommunityReplyVO();
		reply.setCommNo(commNo);
		reply.setReplyer(replyer);
		reply.setReplytext(replytext);
		reply.setCommunityCode(communityCode);
		reply.setRegdate(new Date());
		reply.setIsDel("N");
		
		return reply;
	}
	
}
