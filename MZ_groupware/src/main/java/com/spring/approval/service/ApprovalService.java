package com.spring.approval.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.approval.dto.ApprovalVO;

public interface ApprovalService {
	
	//목록조회
	Map<String, Object> getApprovalList(ApprovalVO approval) throws SQLException;
	
	Map<String, Object> getTempApproval(ApprovalVO approval) throws SQLException;
	Map<String, Object> getTempApprovalList(ApprovalVO approval) throws SQLException;
	
	Map<String, Object> getIngApprovalList(ApprovalVO approval) throws SQLException;
	Map<String, Object> getCompApprovalList(ApprovalVO approval) throws SQLException;
	Map<String, Object> getRefApprovalList(ApprovalVO approval) throws SQLException;
	Map<String, Object> getReadApprovalList(ApprovalVO approval) throws SQLException;
	
	Map<String, Object> getRejApprovalList(ApprovalVO approval) throws SQLException;
	
	
	//파일명 찾기
	ApprovalVO findFileInContent(String fileName) throws SQLException;
	
	//상세보기
	Map<String, Object> getApproval(int appNo) throws SQLException;
	
	//수정화면 상세
	ApprovalVO getApprovalForModify(int appNo) throws SQLException;
	
	//등록
	void regist(ApprovalVO approval) throws SQLException;
	void registTempApproval(ApprovalVO approval) throws SQLException;
	
	//수정
	void modify(ApprovalVO approval) throws SQLException;
	void modifyTempApproval(ApprovalVO approval) throws SQLException;
	void modifyAppStatusByAppNo(ApprovalVO approval) throws SQLException;
	
	//삭제
	void remove(int appNo) throws SQLException;
	void removeTempApproval(ApprovalVO approval) throws SQLException;
	
	ApprovalAttachVO getAttachByAttachNo(int attachNo)throws SQLException;
	
	// 파일 삭제
	void removeAttachByAttachNo(int attachNo)throws SQLException;
	
	
	// 미확인결재문서 cnt (메인페이지용)
	int getUncheckAppCount(String empNo) throws SQLException;
	
	// 결재로그용
	Map<String, Object> getLogList(ApprovalVO approval) throws SQLException;
	
	// 메인 리스트 출력
	List<ApprovalVO> getAllList(String empNo) throws SQLException;
}

