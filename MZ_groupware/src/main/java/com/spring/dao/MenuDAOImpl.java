package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.MenuVO;

public class MenuDAOImpl implements MenuDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session =  session;
	}
	
	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		return session.selectList("Menu-Mapper.selectMainMenu");
	}

	@Override
	public List<MenuVO> selectSubMenu(String menuCode) throws SQLException {
		return session.selectList("Menu-Mapper.selectSubMenu", menuCode);
	}

	@Override
	public MenuVO selectMenuByMcode(String menuCode) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMcode", menuCode);
	}

	@Override
	public MenuVO selectMenuByMname(String menuName) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMname", menuName);
	}

	@Override
	public void insertMenu(MenuVO menu) throws SQLException {
		session.update("Menu-Mapper.insertMenu", menu);
	}

	@Override
	public void deleteMenu(MenuVO menu) throws SQLException {
		session.update("Menu-Mapper.deleteMenu", menu);
	}

	@Override
	public void updateMenu(MenuVO menu) throws SQLException {
		session.update("Menu-Mapper.updateMenu", menu);
	}
}
