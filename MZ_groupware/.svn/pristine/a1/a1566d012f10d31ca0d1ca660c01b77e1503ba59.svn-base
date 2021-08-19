package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.InoutTimeDAO;
import com.spring.dto.InoutTimeVO;

public class InoutTimeServiceImpl implements InoutTimeService {
	
	private InoutTimeDAO inoutTimeDAO;
	public void setInoutTimeDAO(InoutTimeDAO inoutTimeDAO) {
		this.inoutTimeDAO = inoutTimeDAO;
	}

	@Override
	public List<InoutTimeVO> getTime() throws SQLException {
		return inoutTimeDAO.selectTime();
	}

}
