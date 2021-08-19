package com.spring.position.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.position.dao.PositionDAO;
import com.spring.position.dto.PositionVO;

@Service
public class PositionServiceImpl implements PositionService {
	
	private final PositionDAO positionDAO;
	
	public PositionServiceImpl(PositionDAO positionDAO) {
		this.positionDAO = positionDAO;
	}

	// 모든 직위 조회
	public List<PositionVO> getList() throws SQLException {
		return positionDAO.selectPositionList();
	}
	
	// 직위 관리 사용 설정
	@Override
	public void modifyPositionY(String psCode) throws SQLException {
		positionDAO.updatePositionY(psCode);
	}

	// 직위 관리 미사용 설정
	@Override
	public void modifyPositionN(String psCode) throws SQLException {
		positionDAO.updatePositionN(psCode);
	}

	// 사용중인 직위 조회
	@Override
	public List<PositionVO> getPositionListY() throws SQLException {
		return positionDAO.selectPositionListY();
	}

	// 상위 레벨 직위
	public List<PositionVO> getPositionHighPosition(String psLevel) throws SQLException {
		return positionDAO.selectPositionHighPosition(psLevel);
	}

}
