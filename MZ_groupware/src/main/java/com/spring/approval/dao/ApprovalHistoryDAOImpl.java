package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.approval.dto.ApprovalHistoryVO;

public class ApprovalHistoryDAOImpl implements ApprovalHistoryDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalHistoryVO> selectHistoryListByAppNo(int appNo) throws SQLException {
		return session.selectList("ApprovalHistory-Mapper.selectHistoryListByAppNo", appNo);
	}

	
	@Override
	public void insertApprovalHistory(ApprovalHistoryVO approvalHistory) throws SQLException {
		session.insert("ApprovalHistory-Mapper.insertApprovalHistroy", approvalHistory);
	}

	@Override
	public void insertAppHistroy(ApprovalHistoryVO approvalHistory) throws SQLException {
		session.insert("ApprovalHistory-Mapper.insertAppHistroy", approvalHistory);
	}

	@Override
	public ApprovalHistoryVO selectHistoryByFirst(int appNo) throws SQLException {
		return session.selectOne("ApprovalHistory-Mapper.selectHistoryByFirst", appNo);
	}

	@Override
	public ApprovalHistoryVO selectHistoryBySecond(int appNo) throws SQLException {
		return session.selectOne("ApprovalHistory-Mapper.selectHistoryBySecond", appNo);
	}

	@Override
	public ApprovalHistoryVO selectHistoryByThird(int appNo) throws SQLException {
		return session.selectOne("ApprovalHistory-Mapper.selectHistoryByThird", appNo);
	}

	@Override
	public void updateSignStatusByFirst(ApprovalHistoryVO approvalHistory) throws SQLException {
		session.update("ApprovalHistory-Mapper.updateSignStatusByFirst", approvalHistory);
	}

	@Override
	public void updateSignStatusBySecond(ApprovalHistoryVO approvalHistory) throws SQLException {
		session.update("ApprovalHistory-Mapper.updateSignStatusBySecond", approvalHistory);
	}

	@Override
	public void updateSignStatusByThird(ApprovalHistoryVO approvalHistory) throws SQLException {
		session.update("ApprovalHistory-Mapper.updateSignStatusByThird", approvalHistory);
	}

	@Override
	public List<ApprovalHistoryVO> selectHistoryByHelp(int appNo) throws SQLException {

		return session.selectList("ApprovalHistory-Mapper.selectHistoryByHelp", appNo);
	}

	@Override
	public List<ApprovalHistoryVO> selectHistoryByRef(int appNo) throws SQLException {
		return session.selectList("ApprovalHistory-Mapper.selectHistoryByRef", appNo);
	}

	@Override
	public List<ApprovalHistoryVO> selectHistoryByRead(int appNo) throws SQLException {
		return session.selectList("ApprovalHistory-Mapper.selectHistoryByRead", appNo);
	}
	
	@Override
	public void updateSignStatus(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		session.selectList("ApprovalHistory-Mapper.updateSignStatus", approvalHistoryVO);
	}

	@Override
	public void updateSignStatusToReject(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		session.selectList("ApprovalHistory-Mapper.updateSignStatusToReject", approvalHistoryVO);
	}

	@Override
	public void updateSignStatusToX(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		session.selectList("ApprovalHistory-Mapper.updateSignStatusToX", approvalHistoryVO);
		
	}
}
