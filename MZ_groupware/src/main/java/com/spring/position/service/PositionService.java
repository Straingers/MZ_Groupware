package com.spring.position.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.position.dto.PositionVO;

public interface PositionService {
	// 모든 직위 조회
	public List<PositionVO> getList() throws SQLException;
	
	// 사용중인 직위 조회
	public List<PositionVO> getPositionListY() throws SQLException;
	
	// 직위 관리 사용 설정
	public void modifyPositionY(String psCode) throws SQLException;
	
	// 직위 관리 미사용 설정
	public void modifyPositionN(String psCode) throws SQLException;
	
	// 상위 레벨 직위
	public List<PositionVO> getPositionHighPosition(String psLevel) throws SQLException;
}
