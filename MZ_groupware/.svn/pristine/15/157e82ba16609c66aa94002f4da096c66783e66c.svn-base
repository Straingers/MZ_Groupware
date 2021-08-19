package com.spring.admin.additional.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.admin.additional.dto.AdditionalBoardVO;
import com.spring.command.SearchCriteria;

public class AdditionalBoardDAOImpl implements AdditionalBoardDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<AdditionalBoardVO> selectBoardListByBoardCode(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("AdditionalBoard-Mapper.selectBoardListByBoardCode", cri, rowBounds);
	}

	@Override
	public int selectBoardListByBoardCodeCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("AdditionalBoard-Mapper.selectBoardListByBoardCodeCount", cri);
	}

	@Override
	public AdditionalBoardVO selectBoardByAddNo(AdditionalBoardVO board) throws SQLException {
		return session.selectOne("AdditionalBoard-Mapper.selectBoardByAddNo", board);
	}
	
	@Override
	public void increaseViewCount(AdditionalBoardVO board) throws SQLException {
		session.update("AdditionalBoard-Mapper.increaseViewCount", board);
	}

	@Override
	public int insertBoard(AdditionalBoardVO board) throws SQLException {
		session.update("AdditionalBoard-Mapper.insertBoard", board);
		return session.selectOne("AdditionalBoard-Mapper.getLastAddNo");
	}

	@Override
	public void updateBoard(AdditionalBoardVO board) throws SQLException {
		session.update("AdditionalBoard-Mapper.updateBoard", board);
	}

	@Override
	public void deleteBoard(AdditionalBoardVO board) throws SQLException {
		session.update("AdditionalBoard-Mapper.deleteBoard", board);
	}

}
