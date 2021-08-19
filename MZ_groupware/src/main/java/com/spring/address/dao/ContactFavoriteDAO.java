package com.spring.address.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.address.dto.ContactFavoriteVO;
import com.spring.dto.EmployeeVO;

public interface ContactFavoriteDAO {
	// EmpNo 기준 즐겨찾기 조회
	public List<ContactFavoriteVO> selectFavoriteByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 즐겨찾기 등록
	void insertFavorite(ContactFavoriteVO favorite) throws SQLException;
	
	// 즐겨찾기 수정
	void deleteFavorite(ContactFavoriteVO favorite) throws SQLException;
}
