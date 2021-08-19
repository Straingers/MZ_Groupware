package com.spring.office.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.AdminVO;
import com.spring.office.dto.OfficeVO;

public interface OfficeDAO {
	// 회사내규 목록
	List<OfficeVO> selectOfficeList(SearchCriteria cri) throws SQLException;
	
	//회사내규 상세
	OfficeVO selectOfficeByOfficeNo(int officeNo) throws SQLException;
	
	//check admin
	int checkExistByEmpNo(String empNo) throws SQLException;
	
	//if exist then get admin
	AdminVO getAdminByEmpNo(String empNo) throws SQLException;
	
	//totalcount
	int selectOfficeListCount(SearchCriteria cri) throws SQLException;
	
	//등록
	void insertOfficeBoard(OfficeVO office) throws SQLException;
	
	//수정
	void updateOfficeBoard(OfficeVO office) throws SQLException;
	
	//삭제
	void deleteOfficeBoard(int officeNo) throws SQLException;
}
