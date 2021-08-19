package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityBoardVO;

public class CommunityBoardDAOImpl implements CommunityBoardDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) { // setSqlSession set메서드 이름으로 타겟 확인
		this.session=session;
	}
	
	// 마이페이지 - 내가 쓴 글 조회
	@Override
	public List<CommunityBoardVO> selectTotalBoardCriteriaByLoginUser(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("CommunityBoard-Mapper.selectAllCommunityBoardListByLoginUser", cri, rowBounds);
	}
	
	// 마이페이지 - 내가 쓴 글 총 갯수 조회
	@Override
	public int selectTotalBoardTotalCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("CommunityBoard-Mapper.selectAllCommunityBoardListByLoginUserCount", cri);
	}
	
	// 사내 익명 게시판 조회
	@Override
	public List<CommunityBoardVO> selectCommunityBoardAnonyCriteria(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CommunityBoardVO> communityBoardList=
				   session.selectList("CommunityBoard-Mapper.selectSearchCommunityBoardAnonyList",cri,rowBounds);	
		return communityBoardList;
	}

	// 사내 익명 게시판 개수 조회
	@Override
	public int selectCommunityBoardAnonyCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("CommunityBoard-Mapper.selectSearchCommunityBoardAnonyListCount",cri);
		return count;
	}

	// 게시글 글 번호 기준 조회
	@Override
	public CommunityBoardVO selectCommunityBoardByCommNo(int commNo) throws SQLException {
		CommunityBoardVO communityBoard=session.selectOne("CommunityBoard-Mapper.selectCommunityBoardByCommNo",commNo);
		return communityBoard;
	}

	// 게시글 등록
	@Override
	public void insertCommunityBoard(CommunityBoardVO communityBoard) throws SQLException {
		session.update("CommunityBoard-Mapper.insertCommunityBoard",communityBoard);
	}

	// 게시판 수정
	@Override
	public void updateCommunityBoard(CommunityBoardVO communityBoard) throws SQLException {
		session.update("CommunityBoard-Mapper.updateCommunityBoard",communityBoard);
	}

	// 게시판 삭제
	@Override
	public void deleteCommunityBoard(int commNo) throws SQLException {
		session.update("CommunityBoard-Mapper.deleteCommunityBoard",commNo);
	}

	// 조회수 증가
	@Override
	public void increaseViewCnt(int commNo) throws SQLException {
		session.update("CommunityBoard-Mapper.increaseViewCount",commNo);
	}
	
	// 다음 시퀀스 가져오기
	@Override
	public int getSeqNextValue() throws SQLException {
		int commNo=session.selectOne("CommunityBoard-Mapper.selectCommunityBoardSequenceNextValue");
		return commNo;
	}
	
	
	
	///////////////////////////////////////////////////동호회 게시판
	@Override
	public List<CommunityBoardVO> selectCommunityBoardClubCriteria(SearchCriteria cri) throws SQLException { // 동호회 리스트 조회
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CommunityBoardVO> communityBoardList=
				   session.selectList("CommunityBoard-Mapper.selectSearchCommunityBoardClubList",cri,rowBounds);	
		return communityBoardList;
	}

	@Override
	public int selectCommunityBoardClubCriteriaTotalCount(SearchCriteria cri) throws SQLException { // 동호회 개수 조회
		int count=session.selectOne("CommunityBoard-Mapper.selectSearchCommunityBoardClubListCount",cri);
		return count;
	}
	
	///////////////////////////////////////////////////경조사 게시판
	@Override
	public List<CommunityBoardVO> selectCommunityBoardCncCriteria(SearchCriteria cri) throws SQLException { // 경조사 리스트 조회
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<CommunityBoardVO> communityBoardList=
				   session.selectList("CommunityBoard-Mapper.selectSearchCommunityBoardCncList",cri,rowBounds);	
		return communityBoardList;
	}

	@Override
	public int selectCommunityBoardCncCriteriaTotalCount(SearchCriteria cri) throws SQLException { // 경조사 개수 조회
		int count=session.selectOne("CommunityBoard-Mapper.selectSearchCommunityBoardCncListCount",cri);
		return count;
	}
	
	///////////////////////////////////////////////////Qnma 게시판
	@Override
	public List<CommunityBoardVO> selectCommunityBoardQnaCriteria(SearchCriteria cri) throws SQLException { // 경조사 리스트 조회
	int offset = cri.getStartRowNum();
	int limit=cri.getPerPageNum();
	RowBounds rowBounds=new RowBounds(offset,limit);
	
	List<CommunityBoardVO> communityBoardList=
	session.selectList("CommunityBoard-Mapper.selectSearchCommunityBoardQnaList",cri,rowBounds);	
	return communityBoardList;
	}
	
	@Override
	public int selectCommunityBoardQnaCriteriaTotalCount(SearchCriteria cri) throws SQLException { // 경조사 개수 조회
	int count=session.selectOne("CommunityBoard-Mapper.selectSearchCommunityBoardQnaListCount",cri);
	return count;
	}


}
