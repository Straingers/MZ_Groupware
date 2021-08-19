package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.approval.dto.ApprovalReplyVO;
import com.spring.command.SearchCriteria;

@Repository
public class ApprovalReplyDAOImpl implements ApprovalReplyDAO{

	private final SqlSession session;
	public ApprovalReplyDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalReplyVO> selectReplyListByAppNo(int appNo, SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ApprovalReplyVO> replyList = session.selectList("ApprovalReply-Mapper.selectReplyListByAppNo", appNo, rowBounds);
		
		return replyList;
	}

	@Override
	public int selectReplyCount(int appNo) throws SQLException {
		return session.selectOne("ApprovalReply-Mapper.selectReplyCount", appNo);
	}

	@Override
	public void insertReply(ApprovalReplyVO approvalReplyVO) throws SQLException {
		session.insert("ApprovalReply-Mapper.insertReply", approvalReplyVO);
	}

	@Override
	public void updateReply(ApprovalReplyVO approvalReplyVO) throws SQLException {
		session.insert("ApprovalReply-Mapper.updateReply", approvalReplyVO);
	}

	@Override
	public void deleteReply(ApprovalReplyVO approvalReplyVO) throws SQLException {
		session.insert("ApprovalReply-Mapper.deleteReply", approvalReplyVO);
	}
}
