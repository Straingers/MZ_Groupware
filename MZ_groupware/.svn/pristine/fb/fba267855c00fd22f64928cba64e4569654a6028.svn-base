package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.CommunityReplyDAO;
import com.spring.dto.CommunityReplyVO;

public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	private CommunityReplyDAO replyDAO;
	public void setCommunityReplyDAO(CommunityReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public List<CommunityReplyVO> getMyReplyListByCommNo(CommunityReplyVO reply) throws SQLException {
		return replyDAO.selectMyReplyListByCommNo(reply);
	}

	@Override
	public Map<String, Object> getReplyCommNoList(SearchCriteria cri) throws SQLException {
		List<String> commNoList = replyDAO.selectMyReplyCommNo(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(replyDAO.selectMyReplyListByCommNoCount(cri));
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("commNoList", commNoList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getReplyList(CommunityReplyVO reply, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<CommunityReplyVO> replyList = replyDAO.selectReplyListPage(reply, cri);
		int count = replyDAO.countReply(reply);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker",  pageMaker);
		
		return dataMap;
	}

	@Override
	public int getReplyListCount(CommunityReplyVO reply) throws SQLException {
			int count = replyDAO.countReply(reply);
			return count;
	}

	@Override
	public void registReply(CommunityReplyVO reply) throws SQLException {
			int replyNo = replyDAO.selectReplySeqNextValue();
			reply.setReplyNo(replyNo);
			
			replyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(CommunityReplyVO reply) throws SQLException {
			replyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(int replyNo) throws SQLException {
			replyDAO.deleteReply(replyNo);
	}

}
