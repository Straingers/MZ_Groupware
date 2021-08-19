package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.mypage.dto.ApprovalLinePersonalVO;

@Repository
public class ApprovalLineDAOImpl implements ApprovalLineDAO {

	private final SqlSession session;
	
	public ApprovalLineDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ApprovalLinePersonalVO> selectLineList(ApprovalLinePersonalVO approvalLinePersonalVO)
			throws SQLException {

		List<ApprovalLinePersonalVO> lineList = session.selectList("ApprovalLine-Mapper.selectLineList", approvalLinePersonalVO);
		
		return lineList;
	}

	@Override
	public ApprovalLinePersonalVO selectLine(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		return session.selectOne("ApprovalLine-Mapper.selectLine", approvalLinePersonalVO);
	}

	@Override
	public void insertLine(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		session.insert("ApprovalLine-Mapper.insertLine", approvalLinePersonalVO);
	}

	@Override
	public void updateLine(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		session.update("ApprovalLine-Mapper.updateLine", approvalLinePersonalVO);
	}

	@Override
	public void deleteLine(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		session.update("ApprovalLine-Mapper.deleteLine", approvalLinePersonalVO);
	}

}
