package com.spring.address.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.address.dao.ContactFavoriteDAO;
import com.spring.address.dto.ContactFavoriteVO;
import com.spring.dto.EmployeeVO;

@Service
public class ContactFavoriteServiceImpl implements ContactFavoriteService {
	
	private final ContactFavoriteDAO contactFavoriteDAO;
	
	public ContactFavoriteServiceImpl(ContactFavoriteDAO contactFavoriteDAO) {
		this.contactFavoriteDAO = contactFavoriteDAO;
	}
	
	// EmpNo 기준 즐겨찾기 조회
	@Override
	public List<ContactFavoriteVO> getFavoriteByEmpNo(EmployeeVO employee) throws SQLException {
		return contactFavoriteDAO.selectFavoriteByEmpNo(employee);
	}

	@Override
	public void regist(ContactFavoriteVO favorite) throws SQLException {
		contactFavoriteDAO.insertFavorite(favorite);
	}

	@Override
	public void remove(ContactFavoriteVO favorite) throws SQLException {
		contactFavoriteDAO.deleteFavorite(favorite);
	}


}
