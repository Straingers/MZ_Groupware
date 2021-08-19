package com.spring.ot.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.AdminVO;
import com.spring.ot.dto.OtVO;

public interface OtDAO {
	// 회사내규 목록
	List<OtVO> selectOtList(SearchCriteria cri) throws SQLException;
	
	//회사내규 상세
	OtVO selectOtByOtNo(int otNo) throws SQLException;
	
	//check admin
	int checkExistByEmpNo(String empNo) throws SQLException;
	
	//if exist then get admin
	AdminVO getAdminByEmpNo(String empNo) throws SQLException;
	
	//totalcount
	int selectOtListCount(SearchCriteria cri) throws SQLException;
	
	//등록
	void insertOtBoard(OtVO ot) throws SQLException;
	
	//수정
	void updateOtBoard(OtVO ot) throws SQLException;
	
	//삭제
	void deleteOtBoard(int otNo) throws SQLException;
}
