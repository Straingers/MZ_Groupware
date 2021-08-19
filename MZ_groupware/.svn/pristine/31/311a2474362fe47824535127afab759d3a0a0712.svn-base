package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.NoticeBoardVO;

public interface NoticeBoardService {
	
	// 리스트 조회
	List<NoticeBoardVO> getNoticeList() throws SQLException; 

	// 리스트 조회
	Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException; 

	// popup공지 조회
	List<NoticeBoardVO> getNoticePopupList() throws SQLException; 

	// popup공지 count
	int getPopupCount() throws SQLException; 

	// 공지사항 글 번호 기준 조회
	NoticeBoardVO getNoticeBoard(int noticeNo) throws SQLException;
	
	// 공지사항 글 번호 기준 조회수 증가 조회
	NoticeBoardVO read(int noticeNo) throws SQLException;

	// 관리자 확인
	int adminCheck(String empNo) throws SQLException;

	// 공지사항 등록
	void noticeRegist(NoticeBoardVO noticeBoard) throws SQLException;

	// 공지사항 수정
	void noticeModify(NoticeBoardVO noticeBoard) throws SQLException;

	// 공지사항 삭제
	void noticeRemove(int noticeNo) throws SQLException;

	// 조회수 증가
	NoticeBoardVO viewCnt(int noticeNo) throws SQLException;
	
	// 파일 번호 조회
	AttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	
	// 파일 삭제
	void removeAttachByAttachNo(int attachNo)throws SQLException;
	
	// 관리자id 조회
	String selectSearchAdminId(String empNo)throws SQLException;
}
