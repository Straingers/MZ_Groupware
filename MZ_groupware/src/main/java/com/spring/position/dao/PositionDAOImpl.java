package com.spring.position.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.position.dto.PositionVO;

@Repository
public class PositionDAOImpl implements PositionDAO {
	
	private SqlSession session;

	public PositionDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	// 직위 관리 사용 설정
	@Override
	public void updatePositionY(String psCode) throws SQLException {
		session.update("Position-Mapper.updatePositionY",psCode);
	}
	
	// 직위 관리 미사용 설정
	@Override
	public void updatePositionN(String psCode) throws SQLException {
		session.update("Position-Mapper.updatePositionN",psCode);
	}

	@Override
	public List<PositionVO> selectPositionList() throws SQLException {
		return session.selectList("Position-Mapper.selectPositionList");
	}

	// 사용중인 직위 조회
	@Override
	public List<PositionVO> selectPositionListY() throws SQLException {
		return session.selectList("Position-Mapper.selectPositionListY");
	}

	// 상위 레벨 직위
	@Override
	public List<PositionVO> selectPositionHighPosition(String psLevel) throws SQLException {
		return session.selectList("Position-Mapper.selectPositionHighPosition",psLevel);
	}

}
