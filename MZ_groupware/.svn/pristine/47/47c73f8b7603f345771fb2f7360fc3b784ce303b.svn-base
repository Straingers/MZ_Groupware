package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.CommuteChangeDAO;
import com.spring.dto.CommuteChangeVO;

public class CommuteChangeServiceImpl implements CommuteChangeService {
	
	private CommuteChangeDAO commuteChangeDAO;
	public void setCommuteChangeDAO(CommuteChangeDAO commuteChangeDAO) {
		this.commuteChangeDAO = commuteChangeDAO;
	}
	
	@Override
	public List<CommuteChangeVO> getCommuteChangeListByDept(CommuteChangeVO commChange) throws SQLException {
		return commuteChangeDAO.selectCommuteChangeListByDept(commChange);
	}
	
	@Override
	public void reigstCommuteChange(CommuteChangeVO commuteChange) throws SQLException {
		commuteChangeDAO.insertCommuteChange(commuteChange);
	}
	
}
