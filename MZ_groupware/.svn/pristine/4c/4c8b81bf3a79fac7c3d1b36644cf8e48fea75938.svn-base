package com.spring.address.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.address.dto.ContactFavoriteVO;
import com.spring.dto.EmployeeVO;

@Repository
public class ContactFavoriteDAOImpl implements ContactFavoriteDAO {

	private SqlSession session;
	
	public ContactFavoriteDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	// EmpNo 기준 즐겨찾기 조회
	@Override
	public List<ContactFavoriteVO> selectFavoriteByEmpNo(EmployeeVO employee) throws SQLException {
		return session.selectList("Favorite-Mapper.selectFavoriteByEmpNo",employee);
	}

	@Override
	public void insertFavorite(ContactFavoriteVO favorite) throws SQLException {
		session.update("Favorite-Mapper.insertFavorite",favorite);
	}

	@Override
	public void deleteFavorite(ContactFavoriteVO favorite) throws SQLException {
		session.update("Favorite-Mapper.deleteFavorite",favorite);
	}

}
