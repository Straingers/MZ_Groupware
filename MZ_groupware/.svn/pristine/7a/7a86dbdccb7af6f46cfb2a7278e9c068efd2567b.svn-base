package com.spring.office.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.AdminVO;
import com.spring.office.dto.OfficeVO;

public class OfficeDAOImpl implements OfficeDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<OfficeVO> selectOfficeList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<OfficeVO> officeList = session.selectList("OfficeBoard-Mapper.selectOfficeList", cri, rowBounds);
		return officeList;
	}
	@Override
	public OfficeVO selectOfficeByOfficeNo(int officeNo) throws SQLException {
		OfficeVO office = session.selectOne("OfficeBoard-Mapper.selectOfficeByOfficeNo", officeNo);
		return office;
	}
	@Override
	public int selectOfficeListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("OfficeBoard-Mapper.selectOfficeListCount", cri);
		return count;
	}
	@Override
	public void insertOfficeBoard(OfficeVO office) throws SQLException {
		session.update("OfficeBoard-Mapper.insertOfficeBoard", office);
	}
	@Override
	public void updateOfficeBoard(OfficeVO office) throws SQLException {
		session.update("OfficeBoard-Mapper.updateOfficeBoard", office);
	}
	@Override
	public void deleteOfficeBoard(int officeNo) throws SQLException {
		session.update("OfficeBoard-Mapper.deleteOfficeBoard", officeNo);
	}
	@Override
	public int checkExistByEmpNo(String empNo) throws SQLException {
		int chk = session.selectOne("OfficeBoard-Mapper.checkExistByEmpNo", empNo);
		return chk;
	}
	@Override
	public AdminVO getAdminByEmpNo(String empNo) throws SQLException {
		AdminVO admin = session.selectOne("OfficeBoard-Mapper.getAdminByEmpNo", empNo);
		return admin;
	}
	
	
}
