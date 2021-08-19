package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.admin.additional.dto.AdditionalBoardReplyVO;
import com.spring.command.SearchCriteria;

public class AdditionalBoardReplyDAOImpl implements AdditionalBoardReplyDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AdditionalBoardReplyVO> selectBoardReplyList(AdditionalBoardReplyVO reply, SearchCriteria cri)
			throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("AdditionalBoardReply-Mapper.selectBoardReplyList", reply, rowBounds);
	}

	@Override
	public int selectBoardReplyListCount(AdditionalBoardReplyVO reply) throws SQLException {
		return session.selectOne("AdditionalBoardReply-Mapper.selectBoardReplyListCount", reply);
	}

	@Override
	public int selectReplySeqNextValue() throws SQLException {
		return session.selectOne("AdditionalBoardReply-Mapper.selectReplySeqNextValue");
	}

	@Override
	public void insertReply(AdditionalBoardReplyVO reply) throws SQLException {
		session.update("AdditionalBoardReply-Mapper.insertReply", reply);
	}

	@Override
	public void updateReply(AdditionalBoardReplyVO reply) throws SQLException {
		session.update("AdditionalBoardReply-Mapper.updateReply", reply);
	}

	@Override
	public void deleteReply(AdditionalBoardReplyVO reply) throws SQLException {
		session.update("AdditionalBoardReply-Mapper.deleteReply", reply);
	}

}
