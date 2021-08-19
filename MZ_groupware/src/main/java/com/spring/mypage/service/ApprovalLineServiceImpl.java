package com.spring.mypage.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.mypage.dao.ApprovalLineDAO;
import com.spring.mypage.dao.ApprovalLineDetailDAO;
import com.spring.mypage.dto.ApprovalLinePersonalDetailVO;
import com.spring.mypage.dto.ApprovalLinePersonalVO;

@Service
public class ApprovalLineServiceImpl implements ApprovalLineService{

	private final ApprovalLineDAO lineDAO;
	private final ApprovalLineDetailDAO lineDetailDAO;
	public ApprovalLineServiceImpl(ApprovalLineDAO lineDAO, ApprovalLineDetailDAO lineDetailDAO) {
		this.lineDAO = lineDAO;
		this.lineDetailDAO = lineDetailDAO;
	}

	@Override
	public Map<String, Object> getLineList(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {

		List<ApprovalLinePersonalVO> lineList = lineDAO.selectLineList(approvalLinePersonalVO);
		for(ApprovalLinePersonalVO line : lineList) {
			ApprovalLinePersonalDetailVO detail = new ApprovalLinePersonalDetailVO();
			detail.setLineId(line.getLineId());
			detail = lineDetailDAO.selectLineDetail(detail);
			
			line.setLineFirst(detail.getFirstEmpname());
			line.setLineSecond(detail.getSecondEmpname());
			line.setLineFinal(detail.getFinalEmpname());
		}
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("lineList", lineList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getLine(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {

		ApprovalLinePersonalVO line = lineDAO.selectLine(approvalLinePersonalVO);
		ApprovalLinePersonalDetailVO detail = new ApprovalLinePersonalDetailVO();
		
		detail.setLineId(line.getLineId());
		detail = lineDetailDAO.selectLineDetail(detail);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("line", line);
		
		return dataMap;
	}

	@Override
	public void regist(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		lineDAO.insertLine(approvalLinePersonalVO);
		
		ApprovalLinePersonalDetailVO detail = new ApprovalLinePersonalDetailVO();
		
		detail.setLineId(approvalLinePersonalVO.getLineId());
		detail.setLineFirst(approvalLinePersonalVO.getLineFirst());
		detail.setLineSecond(approvalLinePersonalVO.getLineSecond());
		detail.setLineFinal(approvalLinePersonalVO.getLineFinal());
		
		lineDetailDAO.insertLineDetail(detail);
	}

	@Override
	public void update(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		lineDetailDAO.deleteLineDetail(approvalLinePersonalVO.getLineId());
		lineDAO.updateLine(approvalLinePersonalVO);
		
		ApprovalLinePersonalDetailVO detail = new ApprovalLinePersonalDetailVO();
		
		detail.setLineId(approvalLinePersonalVO.getLineId());
		detail.setLineFirst(approvalLinePersonalVO.getLineFirst());
		detail.setLineSecond(approvalLinePersonalVO.getLineSecond());
		detail.setLineFinal(approvalLinePersonalVO.getLineFinal());
		
		lineDetailDAO.insertLineDetail(detail);
		
	}

	@Override
	public void delete(ApprovalLinePersonalVO approvalLinePersonalVO) throws SQLException {
		lineDAO.deleteLine(approvalLinePersonalVO);
	}
}
