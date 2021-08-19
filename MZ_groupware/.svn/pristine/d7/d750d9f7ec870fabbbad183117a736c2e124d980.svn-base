package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.admin.additional.dao.AdditionalBoardReplyDAO;
import com.spring.admin.additional.dto.AdditionalBoardReplyVO;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

public class AdditionalBoardReplyServiceImpl implements AdditionalBoardReplyService {

	private AdditionalBoardReplyDAO replyDAO;
	public void setAdditionalBoardReplyDAO(AdditionalBoardReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getReplyListByAddNo(AdditionalBoardReplyVO reply, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<AdditionalBoardReplyVO> replyList = replyDAO.selectBoardReplyList(reply, cri);
		int cnt = replyDAO.selectBoardReplyListCount(reply);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public int getReplyCount(AdditionalBoardReplyVO reply) throws SQLException {
		return replyDAO.selectBoardReplyListCount(reply);
	}

	@Override
	public void registReply(AdditionalBoardReplyVO reply) throws SQLException {
		int replyNo = replyDAO.selectReplySeqNextValue();
		reply.setReplyNo(replyNo);
		replyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(AdditionalBoardReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(AdditionalBoardReplyVO reply) throws SQLException {
		replyDAO.deleteReply(reply);
	}

}
