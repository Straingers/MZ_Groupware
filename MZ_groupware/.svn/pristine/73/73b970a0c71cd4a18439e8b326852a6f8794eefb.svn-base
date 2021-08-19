package com.spring.approval.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dao.ApprovalHistoryDAO;
import com.spring.approval.dto.ApprovalHistoryVO;

public class ApprovalHistoryServiceImpl implements ApprovalHistoryService {

	private ApprovalHistoryDAO approvalHistoryDAO;
	public void setApprovalHistoryDAO(ApprovalHistoryDAO approvalHistoryDAO) {
		this.approvalHistoryDAO = approvalHistoryDAO;
	}
	
	@Override
	public List<ApprovalHistoryVO> getHistoryListByAppNo(int appNo) throws SQLException {
		return approvalHistoryDAO.selectHistoryListByAppNo(appNo);
	}
	
	@Override
	public void regist(ApprovalHistoryVO approvalHistory) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateSignStatusByFirst(ApprovalHistoryVO approvalHistory) throws SQLException {

		approvalHistoryDAO.updateSignStatusByFirst(approvalHistory);
	}
	@Override
	public void updateSignStatusBySecond(ApprovalHistoryVO approvalHistory) throws SQLException {
		
		approvalHistoryDAO.updateSignStatusBySecond(approvalHistory);
	}
	@Override
	public void updateSignStatusByThird(ApprovalHistoryVO approvalHistory) throws SQLException {

		approvalHistoryDAO.updateSignStatusByThird(approvalHistory);
	}
	
	
	
	
	@Override
	public void updateSignStatus(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		approvalHistoryDAO.updateSignStatus(approvalHistoryVO);
	}
	@Override
	public void updateSignStatusToReject(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		approvalHistoryDAO.updateSignStatusToReject(approvalHistoryVO);
	}
	@Override
	public void updateSignStatusToX(ApprovalHistoryVO approvalHistoryVO) throws SQLException {
		approvalHistoryDAO.updateSignStatusToX(approvalHistoryVO);
	}
}
