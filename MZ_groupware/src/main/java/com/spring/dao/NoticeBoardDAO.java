package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.NoticeBoardVO;

public interface NoticeBoardDAO {
	
	// main페이지 게시글 조회
	List<NoticeBoardVO> selectNoticeBoardListCriteria() throws SQLException; 
	// 게시글리스트 조회
	List<NoticeBoardVO> selectNoticeBoardListCriteria(SearchCriteria cri) throws SQLException; 
	// 상단공지 조회
	List<NoticeBoardVO> selectImportantNoticeBoardList() throws SQLException; 
	// 팝업 조회
	List<NoticeBoardVO> selectMainNoticeBoardPopupList() throws SQLException; 
	// 팝업 count
	int popupCount() throws SQLException; 
	// 게시글 등록
	void insertNoticeBoard(NoticeBoardVO noticeBoard)throws SQLException;
	// 게시판 수정
	void updateNoticeBoard(NoticeBoardVO noticeBoard)throws SQLException;
	// 게시판 삭제
	void deleteNoticeBoard(int noticeNo)throws SQLException;
		
	// 조회수 증가
	void increaseViewCnt(int noticeNo)throws SQLException;
	// 게시판 개수 조회
	int selectNoticeBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException; 
	// 관리자 확인 
	int adminCheck(String empNo) throws SQLException; 
	// 게시글 글 번호 기준 조회
	NoticeBoardVO selectNoticeBoardBynoticeNo(int noticeNo)throws SQLException;
	// 관리자 id 조회
	String selectSearchAdminId(String empNo)throws SQLException;
	
	// 시퀀스 가져오기
	int getSeqNextValue() throws SQLException;
	
	void updateNoticePopUpN() throws SQLException;
}

