package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.approval.dto.ApprovalDocVO;
import com.spring.command.SearchCriteria;
@Repository
public class ApprovalDocDAOImpl implements ApprovalDocDAO{

	private SqlSession session;
	
	public ApprovalDocDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalDocVO> selectSearchApprovalDocList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("ApprovalDoc-Mapper.selectSearchApprovalDocList", cri, rowBounds);
	}
	
	@Override
	public List<ApprovalDocVO> selectApprovalDocList(ApprovalDocVO approvalDocVO) throws SQLException {
		return session.selectList("ApprovalDoc-Mapper.selectApprovalDocList", approvalDocVO);
	}

	@Override
	public List<ApprovalDocVO> selectSearchApprovalDocByUse(ApprovalDocVO approvalDoc) throws SQLException {
		
		return session.selectList("ApprovalDoc-Mapper.selectSearchApprovalDocByUse", approvalDoc);
	}

	@Override
	public void insertApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {

		session.update("ApprovalDoc-Mapper.insertApprovalDoc", approvalDoc);
	}

	@Override
	public void updateApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		
		session.update("ApprovalDoc-Mapper.updateApprovalDoc", approvalDoc);
	}

	@Override
	public void deleteApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		session.update("ApprovalDoc-Mapper.deleteApprovalDoc", approvalDoc);
	}


	@Override
	public ApprovalDocVO selectApprovalDocByDocId(ApprovalDocVO approvalDoc) throws SQLException {
		return session.selectOne("ApprovalDoc-Mapper.selectApprovalDocByDocId", approvalDoc);
	}

	@Override
	public void updateUse(ApprovalDocVO approvalDoc) throws SQLException {
		session.update("ApprovalDoc-Mapper.updateUse", approvalDoc);
	}


	@Override
	public int selectApprovalDocTotalCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("ApprovalDoc-Mapper.selectApprovalDocTotalCount", cri);
	}

	@Override
	public ApprovalDocVO getApprovalDoc(String docId) throws SQLException {
		return session.selectOne("ApprovalDoc-Mapper.selectApprovalDocByDocId", docId);
	}
}
