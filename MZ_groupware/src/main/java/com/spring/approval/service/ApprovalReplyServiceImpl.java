package com.spring.approval.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.approval.dao.ApprovalReplyDAO;
import com.spring.approval.dto.ApprovalReplyVO;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

@Service
public class ApprovalReplyServiceImpl implements ApprovalReplyService{

	private final ApprovalReplyDAO approvalReplyDAO;
	public ApprovalReplyServiceImpl(ApprovalReplyDAO approvalReplyDAO) {
		this.approvalReplyDAO = approvalReplyDAO;
	}
	
	@Override
	public Map<String, Object> getReplyListByAppNo(int appNo, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ApprovalReplyVO> replyList = approvalReplyDAO.selectReplyListByAppNo(appNo, cri);
		int count = approvalReplyDAO.selectReplyCount(appNo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int getReplyCount(int appNo) throws SQLException {
		return approvalReplyDAO.selectReplyCount(appNo);
	}

	@Override
	public void regist(ApprovalReplyVO approvalReplyVO) throws SQLException {
		approvalReplyDAO.insertReply(approvalReplyVO);
	}

	@Override
	public void modify(ApprovalReplyVO approvalReplyVO) throws SQLException {
		approvalReplyDAO.updateReply(approvalReplyVO);
	}

	@Override
	public void delete(ApprovalReplyVO approvalReplyVO) throws SQLException {
		approvalReplyDAO.deleteReply(approvalReplyVO);
	}
}
