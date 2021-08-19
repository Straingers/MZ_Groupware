package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityReplyVO;

public interface CommunityReplyService {
	
	// 내가 쓴 댓글 글번호로 조회
	List<CommunityReplyVO> getMyReplyListByCommNo(CommunityReplyVO reply) throws SQLException;
	
	Map<String, Object> getReplyList(CommunityReplyVO reply, SearchCriteria cri) throws SQLException;
	
	Map<String, Object> getReplyCommNoList(SearchCriteria cri) throws SQLException;
	
	// int 리스트 개수
	int getReplyListCount(CommunityReplyVO reply) throws SQLException;
	
	// 등록
	void registReply(CommunityReplyVO reply)throws SQLException;
	
	// 수정
	void modifyReply(CommunityReplyVO reply)throws SQLException;
	
	//삭제
	void removeReply(int replyNo)throws SQLException;
}
