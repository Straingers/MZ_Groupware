package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityBoardVO;

public interface CommunityBoardDAO {
	
	List<CommunityBoardVO> selectTotalBoardCriteriaByLoginUser(SearchCriteria cri) throws SQLException; // 내가 쓴 게시글 조회
	
	List<CommunityBoardVO> selectCommunityBoardQnaCriteria(SearchCriteria cri) throws SQLException; // 사내 익명 게시판 조회
	List<CommunityBoardVO> selectCommunityBoardAnonyCriteria(SearchCriteria cri) throws SQLException; // 사내 익명 게시판 조회
	List<CommunityBoardVO> selectCommunityBoardClubCriteria(SearchCriteria cri) throws SQLException; // 동호회 게시판 조회
	List<CommunityBoardVO> selectCommunityBoardCncCriteria(SearchCriteria cri) throws SQLException; // 경조사 게시판 조회
	
	int selectTotalBoardTotalCount(SearchCriteria cri) throws SQLException; // 내가 쓴 게시글 총 갯수 조회
	
	int selectCommunityBoardQnaCriteriaTotalCount(SearchCriteria cri) throws SQLException; // 사내 익명 게시판 개수 조회
	int selectCommunityBoardAnonyCriteriaTotalCount(SearchCriteria cri) throws SQLException; // 사내 익명 게시판 개수 조회
	int selectCommunityBoardClubCriteriaTotalCount(SearchCriteria cri) throws SQLException; // 동호회 게시판 개수 조회
	int selectCommunityBoardCncCriteriaTotalCount(SearchCriteria cri) throws SQLException; // 경조사 게시판 개수 조회
	
	// 게시글 글 번호 기준 조회
	CommunityBoardVO selectCommunityBoardByCommNo(int commNo)throws SQLException;
	
	// 게시글 등록
	void insertCommunityBoard(CommunityBoardVO communityBoard)throws SQLException;
	// 게시판 수정
	void updateCommunityBoard(CommunityBoardVO communityBoard)throws SQLException;
	// 게시판 삭제
	void deleteCommunityBoard(int commNo)throws SQLException;
	
	// 조회수 증가
	void increaseViewCnt(int commNo)throws SQLException;
	
	// 다음 시퀀스 가져오기
	int getSeqNextValue() throws SQLException;
}

