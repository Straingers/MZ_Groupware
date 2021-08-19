package com.spring.address.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.address.dto.ContactFavoriteVO;
import com.spring.dto.EmployeeVO;

public interface ContactFavoriteService {
	// EmpNo 기준 즐겨찾기 조회
	public List<ContactFavoriteVO> getFavoriteByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 즐겨찾기 등록
	void regist(ContactFavoriteVO favorite) throws SQLException;
	
	// 즐겨찾기 삭제
	void remove(ContactFavoriteVO favorite) throws SQLException;
}
