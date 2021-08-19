package com.spring.approval.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.approval.dao.ApprovalDocDAO;
import com.spring.approval.dto.ApprovalDocVO;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

@Service
public class ApprovalDocServiceImpl implements ApprovalDocService{

	private final ApprovalDocDAO approvalDocDAO;
	
	public ApprovalDocServiceImpl(ApprovalDocDAO approvalDocDAO) {
		this.approvalDocDAO = approvalDocDAO;
	}

	@Override
	public Map<String, Object> selectApprovalDocList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ApprovalDocVO> approvalDocList = approvalDocDAO.selectSearchApprovalDocList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		dataMap.put("approvalDocList", approvalDocList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectApprovalDocList1(ApprovalDocVO approvalDocVO) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ApprovalDocVO> approvalDocList = approvalDocDAO.selectApprovalDocList(approvalDocVO);
		
		dataMap.put("approvalDocList", approvalDocList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getUseApprovalDocList(ApprovalDocVO approvalDoc) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalDoc", approvalDocDAO.selectSearchApprovalDocByUse(approvalDoc));
		
		return dataMap;
	}

	@Override
	public ApprovalDocVO selectApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		return approvalDocDAO.selectApprovalDocByDocId(approvalDoc);
	}

	@Override
	public int selectApprovalDocTotalCount(SearchCriteria cri) throws SQLException {
		return approvalDocDAO.selectApprovalDocTotalCount(cri);
	}

	@Override
	public void insertApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		approvalDocDAO.insertApprovalDoc(approvalDoc);
	}

	@Override
	public void updateApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		approvalDocDAO.updateApprovalDoc(approvalDoc);
	}

	@Override
	public void updateUse(ApprovalDocVO approvalDoc) throws SQLException {
		approvalDocDAO.updateUse(approvalDoc);
	}

	@Override
	public void deleteApprovalDoc(ApprovalDocVO approvalDoc) throws SQLException {
		approvalDocDAO.deleteApprovalDoc(approvalDoc);
	}


	@Override
	public Map<String, Object> getApprovalDocList() throws SQLException {
		return null;
	}


	@Override
	public ApprovalDocVO getApprovalDoc(String docId) throws SQLException {
		return approvalDocDAO.getApprovalDoc(docId);
	}
}
