package com.spring.service;

import java.sql.SQLException;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.CommunityBoardVO;

public interface CommunityBoardService {
	
	Map<String, Object> getMyCommunityList(SearchCriteria cri) throws SQLException; // 마이페이지 - 내가쓴글조회
	
	Map<String, Object> getAnonyList(SearchCriteria cri) throws SQLException; // 사내 익명 게시판 조회
	Map<String, Object> getQnaList(SearchCriteria cri) throws SQLException; // 동호회 게시판 조회
	Map<String, Object> getClubList(SearchCriteria cri) throws SQLException; // 동호회 게시판 조회
	Map<String, Object> getCncList(SearchCriteria cri) throws SQLException; // 동호회 게시판 조회

	// 게시글 글 번호 기준 조회
	CommunityBoardVO getCommunityBoard(int commNo) throws SQLException;

	// 게시글 등록
	void regist(CommunityBoardVO communityBoard) throws SQLException;

	// 게시판 수정
	void modify(CommunityBoardVO communityBoard) throws SQLException;

	// 게시판 삭제
	void remove(int commNo) throws SQLException;

	// 조회수 증가
	CommunityBoardVO read(int commNo) throws SQLException;
	
	// 파일 번호 조회
	AttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	
	// 파일 삭제
	void removeAttachByAttachNo(int attachNo)throws SQLException;
}
