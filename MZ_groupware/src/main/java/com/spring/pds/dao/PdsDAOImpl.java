package com.spring.pds.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.pds.dto.PdsVO;

public class PdsDAOImpl implements PdsDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PdsVO> selectPdsList(PdsVO pds) throws SQLException {
		int offset = pds.getStartRowNum();
		int limit = pds.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<PdsVO> pdsList = session.selectList("PdsBoard-Mapper.selectPdsList", pds, rowBounds);
		return pdsList;
	}
	@Override
	public PdsVO selectPdsByPdsNo(int pdsNo) throws SQLException {
		PdsVO pds = session.selectOne("PdsBoard-Mapper.selectPdsByPdsNo", pdsNo);
		return pds;
	}
	@Override
	public int selectPdsListCount(PdsVO pds) throws SQLException {
		int count = session.selectOne("PdsBoard-Mapper.selectPdsListCount", pds);
		return count;
	}
	@Override
	public void insertPdsBoard(PdsVO pds) throws SQLException {
		session.update("PdsBoard-Mapper.insertPdsBoard", pds);
	}
	@Override
	public void updatePdsBoard(PdsVO pds) throws SQLException {
		session.update("PdsBoard-Mapper.updatePdsBoard", pds);
	}
	@Override
	public void deletePdsBoard(int pdsNo) throws SQLException {
		session.update("PdsBoard-Mapper.deletePdsBoard", pdsNo);
	}
	
}
