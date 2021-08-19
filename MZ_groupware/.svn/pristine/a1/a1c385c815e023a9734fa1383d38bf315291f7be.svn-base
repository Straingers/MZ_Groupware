package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.admin.additional.dto.AdditionalTypeVO;

public class AdditionalTypeDAOImpl implements AdditionalTypeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AdditionalTypeVO> selectAdditionalBoardList() throws SQLException {
		return session.selectList("AdditionalType-Mapper.selectAdditionalBoardList");
	}
	
	@Override
	public AdditionalTypeVO selectBoard(String boardCode) throws SQLException {
		return session.selectOne("AdditionalType-Mapper.selectBoard", boardCode);
	}

	@Override
	public String checkExistMenu() throws SQLException {
		return session.selectOne("AdditionalType-Mapper.checkExistMenu");
	}
	
	@Override
	public String insertBoard(AdditionalTypeVO additionalType) throws SQLException {
		session.update("AdditionalType-Mapper.insertBoard", additionalType);
		return session.selectOne("AdditionalType-Mapper.selectBoardCodeLast");
	}

	@Override
	public void updateBoard(AdditionalTypeVO additionalType) throws SQLException {
		session.update("AdditionalType-Mapper.updateBoard", additionalType);
	}

	@Override
	public void deleteBoard(AdditionalTypeVO additionalType) throws SQLException {
		session.update("AdditionalType-Mapper.deleteBoard", additionalType);
	}


}
