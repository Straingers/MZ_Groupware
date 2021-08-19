package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.CommuteChangeVO;

public interface CommuteChangeDAO {
	
	List<CommuteChangeVO> selectCommuteChangeListByDept(CommuteChangeVO commChange) throws SQLException;
	
	void insertCommuteChange(CommuteChangeVO commChange) throws SQLException;
	
}
