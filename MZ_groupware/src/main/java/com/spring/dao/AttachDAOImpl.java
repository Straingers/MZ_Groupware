package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.NoticeBoardVO;
import com.spring.office.dto.OfficeVO;
import com.spring.ot.dto.OtVO;
import com.spring.pds.dto.PdsVO;

@Repository
public class AttachDAOImpl implements AttachDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) { // setSqlSession set메서드 이름으로 타겟 확인
		this.session=session;
	}
	
	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAllAttach(int pno) throws SQLException {
		session.update("Attach-Mapper.deleteAllAttach",pno);		
	}
	
	//파일 삭제
	@Override
	public void deleteAttach(int attachNo) throws SQLException {
		session.update("Attach-Mapper.deleteAttach",attachNo);		
		
	}

	// 파일 조회
	@Override
	public AttachVO selectAttachByAttachNo(int attachNo)throws SQLException {
		AttachVO attach=session.selectOne("Attach-Mapper.selectAttachByAttachNo",attachNo);
		return attach;
	}
	
	/**	커뮤니티 게시판 - 사내 익명 게시판 */
	// 커뮤니티 - 사내익명
	@Override
	public void deleteAllAnonyAttach(int contentNo)throws SQLException {
		session.update("Attach-Mapper.deleteAllAnonyAttach",contentNo);		
	}
	
	/**	커뮤니티 게시판 - 사내 익명 게시판 */
	// 커뮤니티 통합 게시판 목록 조회
	@Override
	public List<AttachVO> selectAttacheCommunityByContentNo(CommunityBoardVO communityBoard)throws SQLException {
		List<AttachVO> attachList=session.selectList("Attach-Mapper.selectAttachCommunityByContentNo",communityBoard);
		return attachList;
	}

	@Override
	public List<AttachVO> selectAttachApprovalByAppNo(int appNo) throws SQLException {

		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachByAppNo", appNo);
		return attachList;
	}

	@Override
	public void deleteAllApprovalAttach(int appNo) throws SQLException {

		session.update("Attach-Mapper.deleteAllApprovalAttach", appNo);
	}

	@Override
	public List<AttachVO> selectAttachByContentNo(int contentNo) throws SQLException {
		return session.selectList("Attach-Mapper.selectAttachByContentNo", contentNo);
	}
	
	
	
	/** NoticeBoard **/
	@Override
	public List<AttachVO> selectAttacheNoticeByNoticeNo(NoticeBoardVO noticeBoard) throws SQLException {
		List<AttachVO> attachList=session.selectList("Attach-Mapper.selectAttacheNoticeByNoticeno",noticeBoard);
		return attachList;
	}

	@Override
	public List<AttachVO> selectAttachOfficeByOfficeNo(OfficeVO office) throws SQLException {
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachOfficeByOfficeNo", office);
		return attachList;
	}
	
	@Override
	public List<AttachVO> selectAttachOtByOtNo(OtVO ot) throws SQLException {
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachOtByOtNo", ot);
		return attachList;
	}

	@Override
	public List<AttachVO> selectAttachPdsByPdsNo(PdsVO pds) throws SQLException {
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachPdsByPdsNo", pds);
		return attachList;
	}
	
	// Additional Board
	@Override
	public List<AttachVO> selectAttachAdditionalBoard(AttachVO attach) throws SQLException {
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachAdditionalBoard", attach);
		return attachList;
	}
	
	@Override
	public List<AttachVO> selectAllList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("Attach-Mapper.selectAllList", cri, rowBounds);
	}

	@Override
	public int selectAllListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Attach-Mapper.selectAllListCount", cri);
	}
	
	@Override
	public List<AttachVO> deleteAttachList() throws SQLException {
		return session.selectList("Attach-Mapper.deleteAttachList");
	}

	@Override
	public void deleteCommAttach() throws SQLException {
		session.delete("Attach-Mapper.deleteCommAttach");
	}
	
}
