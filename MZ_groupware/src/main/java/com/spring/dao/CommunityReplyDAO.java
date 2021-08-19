package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.CommunityReplyVO;

public interface CommunityReplyDAO {

	// 내가 쓴 댓글 리스트 게시글 번호로 조회
	List<CommunityReplyVO> selectMyReplyListByCommNo(CommunityReplyVO reply) throws SQLException;
	List<String> selectMyReplyCommNo(SearchCriteria cri) throws SQLException;
	
	int selectMyReplyListByCommNoCount(SearchCriteria cri) throws SQLException;
	
	void insertReply(CommunityReplyVO reply) throws SQLException;
	void updateReply(CommunityReplyVO reply) throws SQLException;
	void deleteReply(int replyNo) throws SQLException;
	
	int selectReplySeqNextValue() throws SQLException;
	List<CommunityReplyVO> selectReplyListPage(CommunityReplyVO reply, SearchCriteria cri) throws SQLException;
	int countReply(CommunityReplyVO reply) throws SQLException;
	// 커뮤니티 게시글에 해당하는 댓글 조회
	List<CommunityReplyVO> selectReplyList(CommunityBoardVO communityBoard) throws SQLException;
}
