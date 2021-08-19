package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.command.SearchCriteria;

public class ApprovalAttachDAOImpl implements ApprovalAttachDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalAttachVO> selectAttachByAppNo(int appNo) throws SQLException {

		List<ApprovalAttachVO> attachList = session.selectList("ApprovalAttach-Mapper.selectAttachByAppNo", appNo);
		
		return attachList;
	}

	@Override
	public ApprovalAttachVO selectAttachByAttachNo(int attachNo) throws SQLException {

		ApprovalAttachVO attach = session.selectOne("ApprovalAttach-Mapper.selectAttachByAno", attachNo);
		
		return attach;
	}

	@Override
	public void insertAttach(ApprovalAttachVO attach) throws SQLException {

		session.update("ApprovalAttach-Mapper.insertAttach", attach);
	}

	@Override
	public void deleteAttach(int attachNo) throws SQLException {

		session.update("ApprovalAttach-Mapper.deleteAttach", attachNo);
	}

	@Override
	public void deleteAllAttach(int appNo) throws SQLException {

		session.update("ApprovalAttach-Mapper.deleteAllAttach", appNo);
	}
	@Override
	public List<ApprovalAttachVO> selectAllAppList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("ApprovalAttach-Mapper.selectAllAppList", cri, rowBounds);
	}

	@Override
	public int selectAllAppListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("ApprovalAttach-Mapper.selectAllAppListCount", cri);
	}

}
