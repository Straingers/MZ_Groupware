package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.NoticeBoardVO;

public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<NoticeBoardVO> selectNoticeBoardListCriteria() throws SQLException {
		List<NoticeBoardVO> NoticeBoardList= session.selectList("NoticeBoard-Mapper.selectMainNoticeBoardList");	
		return NoticeBoardList;
	}
	
	@Override
	public List<NoticeBoardVO> selectNoticeBoardListCriteria(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<NoticeBoardVO> NoticeBoardList= session.selectList("NoticeBoard-Mapper.selectNoticeBoardList",cri,rowBounds);	
		return NoticeBoardList;
	}
	
	@Override
	public List<NoticeBoardVO> selectImportantNoticeBoardList() throws SQLException {
		List<NoticeBoardVO> ImportantNoticeBoardList= session.selectList("NoticeBoard-Mapper.selectImportantNoticeBoardList");	
		return ImportantNoticeBoardList;
	}

	@Override
	public List<NoticeBoardVO> selectMainNoticeBoardPopupList() throws SQLException {
		List<NoticeBoardVO> PopupNoticeBoardList= session.selectList("NoticeBoard-Mapper.selectMainNoticeBoardPopupList");	
		return PopupNoticeBoardList;
	}
	
	@Override
	public void insertNoticeBoard(NoticeBoardVO noticeBoard) throws SQLException {
		session.update("NoticeBoard-Mapper.insertNoticeBoard",noticeBoard);
		
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO noticeBoard) throws SQLException {
		session.update("NoticeBoard-Mapper.updateNoticeBoard",noticeBoard);
	}

	@Override
	public void deleteNoticeBoard(int noticeNo) throws SQLException {
		session.update("NoticeBoard-Mapper.deleteNoticeBoard",noticeNo);
	}

	@Override
	public void increaseViewCnt(int noticeNo) throws SQLException {
		session.update("NoticeBoard-Mapper.increaseViewCount",noticeNo);
	}

	@Override
	public int selectNoticeBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("NoticeBoard-Mapper.selectSearchNoticeBoardListCount",cri);
		return count;
	}

	@Override
	public NoticeBoardVO selectNoticeBoardBynoticeNo(int noticeNo) throws SQLException {
		NoticeBoardVO noticeBoard=session.selectOne("NoticeBoard-Mapper.selectNoticeBoardByNoticeNo",noticeNo);
		return noticeBoard;
	}

	@Override
	public String selectSearchAdminId(String empNo) throws SQLException {
		String aminId =session.selectOne("NoticeBoard-Mapper.selectSearchAdminId",empNo);
		return aminId;
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int noticeNo=session.selectOne("NoticeBoard-Mapper.selectNoticeBoardSequenceNextValue");
		return noticeNo;
	}

	@Override
	public int adminCheck(String empNo) throws SQLException {
		int count =session.selectOne("NoticeBoard-Mapper.adminCheck",empNo);
		return count;
	}

	@Override
	public int popupCount() throws SQLException {
		int count =session.selectOne("NoticeBoard-Mapper.popupCount");
		return count;
	}

	@Override
	public void updateNoticePopUpN() throws SQLException {
		session.update("NoticeBoard-Mapper.updateNoticePopUpN");
	}

}
