package com.spring.ot.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.AdminVO;
import com.spring.ot.dto.OtVO;

public class OtDAOImpl implements OtDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<OtVO> selectOtList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<OtVO> otList = session.selectList("OtBoard-Mapper.selectOtList", cri, rowBounds);
		return otList;
	}
	@Override
	public OtVO selectOtByOtNo(int otNo) throws SQLException {
		OtVO ot = session.selectOne("OtBoard-Mapper.selectOtByOtNo", otNo);
		return ot;
	}
	@Override
	public int selectOtListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("OtBoard-Mapper.selectOtListCount", cri);
		return count;
	}
	@Override
	public void insertOtBoard(OtVO ot) throws SQLException {
		session.update("OtBoard-Mapper.insertOtBoard", ot);
	}
	@Override
	public void updateOtBoard(OtVO ot) throws SQLException {
		session.update("OtBoard-Mapper.updateOtBoard", ot);
	}
	@Override
	public void deleteOtBoard(int otNo) throws SQLException {
		session.update("OtBoard-Mapper.deleteOtBoard", otNo);
	}
	@Override
	public int checkExistByEmpNo(String empNo) throws SQLException {
		int chk = session.selectOne("OtBoard-Mapper.checkExistByEmpNo", empNo);
		return chk;
	}
	@Override
	public AdminVO getAdminByEmpNo(String empNo) throws SQLException {
		AdminVO admin = session.selectOne("OtBoard-Mapper.getAdminByEmpNo", empNo);
		return admin;
	}
	
	
}
