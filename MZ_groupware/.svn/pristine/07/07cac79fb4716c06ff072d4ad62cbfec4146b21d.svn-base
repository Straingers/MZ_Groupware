package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.admin.additional.dao.AdditionalTypeDAO;
import com.spring.admin.additional.dto.AdditionalTypeVO;
import com.spring.dao.MenuDAO;
import com.spring.dto.MenuVO;

public class AdditionalTypeServiceImpl implements AdditionalTypeService {

	private AdditionalTypeDAO additionTypeDAO;
	public void setAdditionalTypeDAO(AdditionalTypeDAO additionalTypeDAO) {
		this.additionTypeDAO = additionalTypeDAO;
	}

	private MenuDAO menuDAO;
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public List<AdditionalTypeVO> getAdditionalBoardList() throws SQLException {
		return additionTypeDAO.selectAdditionalBoardList();
	}

	@Override
	public AdditionalTypeVO getBoard(String boardCode) throws SQLException {
		return additionTypeDAO.selectBoard(boardCode);
	}
	
	@Override
	public void reigstBoard(AdditionalTypeVO additionalType) throws SQLException {
		String boardCode = "";
		if(getBoard(additionTypeDAO.checkExistMenu()) != null) {
			additionalType.setBoardCode(additionTypeDAO.checkExistMenu());
			additionalType.setIsDel("N");
			modifyBoard(additionalType);
			boardCode = additionalType.getBoardCode();
		} else {
			boardCode = additionTypeDAO.insertBoard(additionalType);
		}
		MenuVO menu = new MenuVO();
		menu.setMenuCode(boardCode);
		menu.setMenuName(additionalType.getBoardName());
		menu.setMenuIsnav(1);
		menu.setMenUpcode("M050000");
		menu.setMenuUrl("board/additional/list.do?tempStr=" + boardCode);
		menuDAO.insertMenu(menu);
	}

	@Override
	public void modifyBoard(AdditionalTypeVO additionalType) throws SQLException {
		MenuVO menu = new MenuVO();
		menu.setMenuCode(additionalType.getBoardCode());
		menu.setMenuName(additionalType.getBoardName());
		if(additionalType.getIsUse().equals("Y")) {
			menu.setMenuIsnav(1);
		} else {
			menu.setMenuIsnav(0);
		}
		menuDAO.updateMenu(menu);
		additionalType.setIsDel("N");
		additionTypeDAO.updateBoard(additionalType);
	}

	@Override
	public void removeBoard(AdditionalTypeVO additionalType) throws SQLException {
		MenuVO menu = new MenuVO();
		menu.setMenuCode(additionalType.getBoardCode());
		menuDAO.deleteMenu(menu);
		
		additionTypeDAO.deleteBoard(additionalType);
	}


}
