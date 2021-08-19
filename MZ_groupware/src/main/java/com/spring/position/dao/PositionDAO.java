package com.spring.position.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.position.dto.PositionVO;

public interface PositionDAO {
	// 모든 직위 조회
	public List<PositionVO> selectPositionList() throws SQLException;
	
	// 사용중인 직위 조회
	public List<PositionVO> selectPositionListY() throws SQLException;
	
	// 직위 사용 변경
	public void updatePositionY(String psCode) throws SQLException;
	
	// 직위 미사용 변경
	public void updatePositionN(String psCode) throws SQLException;
	
	// 상위 레벨 직위
	public List<PositionVO> selectPositionHighPosition(String psLevel) throws SQLException;
}
