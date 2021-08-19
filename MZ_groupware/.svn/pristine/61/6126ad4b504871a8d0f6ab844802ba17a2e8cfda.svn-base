package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.MenuVO;

public interface MenuService {
	
	List<MenuVO> getMainMenuList() throws SQLException;
	
	List<MenuVO> getSubMenuList(String menuCode) throws SQLException;
	
	MenuVO getMenuByMcode(String menuCode) throws SQLException;
	
	MenuVO getMenuByMname(String menuName) throws SQLException;
}
