package com.spring.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spring.dao.MenuDAO;
import com.spring.dto.MenuVO;

public class MenuServiceImpl implements MenuService {
	
	private MenuDAO menuDAO;

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectMainMenu();
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String menuCode) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectSubMenu(menuCode);
		List<MenuVO> realMenuList = new ArrayList<MenuVO>();
		for(MenuVO menu : menuList) {
			List<MenuVO> subMenuList = menuDAO.selectSubMenu(menu.getMenuCode());
			menu.setSubMenuList(subMenuList);
			realMenuList.add(menu);
		}
		return realMenuList;
	}

	@Override
	public MenuVO getMenuByMcode(String menuCode) throws SQLException {
		MenuVO menuVO = menuDAO.selectMenuByMcode(menuCode);
		List<MenuVO> subMenuList = menuDAO.selectSubMenu(menuVO.getMenuCode());
		menuVO.setSubMenuList(subMenuList);
		return menuVO;
	}

	@Override
	public MenuVO getMenuByMname(String menuName) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMname(menuName);
		List<MenuVO> subMenuList = menuDAO.selectSubMenu(menu.getMenuCode());
		menu.setSubMenuList(subMenuList);
		return menu;
	}
}
