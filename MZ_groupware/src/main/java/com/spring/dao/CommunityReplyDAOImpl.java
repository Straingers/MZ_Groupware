package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.CommunityReplyVO;

public class CommunityReplyDAOImpl implements CommunityReplyDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * 내가 쓴 댓글 리스트 조회
	 */
	@Override
	public List<CommunityReplyVO> selectMyReplyListByCommNo(CommunityReplyVO reply) throws SQLException {
		return session.selectList("Community-Reply-Mapper.selectMyReplyListByCommNo", reply);
	}

	@Override
	public List<String> selectMyReplyCommNo(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("Community-Reply-Mapper.selectMyReplyCommNo", cri, rowBounds);
	}
	
	@Override
	public int selectMyReplyListByCommNoCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Community-Reply-Mapper.selectMyReplyListByCommNoCount", cri);
	}
	
	@Override
	public void insertReply(CommunityReplyVO reply) throws SQLException {
		session.update("Community-Reply-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(CommunityReplyVO reply) throws SQLException {
		session.update("Community-Reply-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(int replyNo) throws SQLException {
		session.update("Community-Reply-Mapper.deleteReply", replyNo);
	}

	@Override
	public int selectReplySeqNextValue() throws SQLException {
		
		int rno = (Integer)session.selectOne("Community-Reply-Mapper.selectReplySeqNextValue");
		
		return rno;
	}

	@Override
	public List<CommunityReplyVO> selectReplyListPage(CommunityReplyVO reply, SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<CommunityReplyVO> replyList = session.selectList("Community-Reply-Mapper.selectReplyList", reply, rowBounds);
		return replyList;
	}

	@Override
	public int countReply(CommunityReplyVO reply) throws SQLException {
		
		int count = session.selectOne("Community-Reply-Mapper.countReply", reply);
		
		return count;
	}

	// 커뮤니티 게시글에 해당하는 댓글 조회
	@Override
	public List<CommunityReplyVO> selectReplyList(CommunityBoardVO communityBoard) throws SQLException {
		List<CommunityReplyVO> replyList = session.selectList("Community-Reply-Mapper.selectReplyList", communityBoard);
		return replyList;
	}


}
