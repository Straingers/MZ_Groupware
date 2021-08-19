package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.MenuVO;

public interface MenuDAO {
	// 메인메뉴
	List<MenuVO> selectMainMenu() throws SQLException;
	
	// 서브메뉴
	List<MenuVO> selectSubMenu(String menuCode) throws SQLException;
	
	// 메뉴정보
	MenuVO selectMenuByMcode(String menuCode) throws SQLException;
	MenuVO selectMenuByMname(String menuName) throws SQLException;
	
	void insertMenu(MenuVO menu) throws SQLException;
	void updateMenu(MenuVO menu) throws SQLException;
	void deleteMenu(MenuVO menu) throws SQLException;
} 
