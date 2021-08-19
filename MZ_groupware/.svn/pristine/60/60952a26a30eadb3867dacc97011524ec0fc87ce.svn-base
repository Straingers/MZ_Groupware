package com.spring.member.history.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.member.history.dto.TransferHistoryVO;

@Repository
public class TransferHistoryDAOImpl implements TransferHistoryDAO {
	
	private SqlSession session;
	
	public TransferHistoryDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}
	
	// 인사 변경 현황 히스토리 목록 조회 + 검색, 페이징 기능 추가
	@Override
	public List<TransferHistoryVO> selectTransferHistorySearchCriteria(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<TransferHistoryVO> transferHistoryList = 
				session.selectList("TransferHistory-Mapper.selectTransferHistorySearchCriteria",cri,rowBounds);
		return transferHistoryList;
	}

	// 인사 변경 현황 히스토리 목록 내 목록 수 조회
	@Override
	public int selectTransferHistoryCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("TransferHistory-Mapper.selectSearchTransferHistoryListCount",cri);
		return count;
	}

	// 특정 직원 히스토리 조회
	@Override
	public List<TransferHistoryVO> selectTransferHistoryEmpNo(String empNo) throws SQLException {
		List<TransferHistoryVO> transferHistoryList = 
				session.selectList("TransferHistory-Mapper.selectTransferHistoryEmpNo",empNo);
		return transferHistoryList;
	}

	// 히스토리 등록 
	@Override
	public void insertTransferHistory(TransferHistoryVO transferHistory) throws SQLException {
		session.update("TransferHistory-Mapper.insertTransferHistory",transferHistory);
	}

}
