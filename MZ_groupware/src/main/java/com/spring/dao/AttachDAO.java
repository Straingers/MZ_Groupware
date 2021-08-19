package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.NoticeBoardVO;
import com.spring.office.dto.OfficeVO;
import com.spring.ot.dto.OtVO;
import com.spring.pds.dto.PdsVO;

public interface AttachDAO {

	// 파일 번호 조회
	public AttachVO selectAttachByAttachNo(int attachNo)throws SQLException;
	public void insertAttach(AttachVO attach) throws SQLException;
	// 파일 삭제
	public void deleteAttach(int attachNo) throws SQLException;
	public void deleteAllAttach(int contentNo) throws SQLException;
	
	
	// 글 번호로 첨부파일 리스트 조회
	List<AttachVO> selectAttachByContentNo(int contentNo) throws SQLException;
	
	/**	커뮤니티 게시판 - 사내 익명 게시판 */
	// 커뮤니티 통합 게시판 목록 조회
	public List<AttachVO> selectAttacheCommunityByContentNo(CommunityBoardVO communityBoard)throws SQLException;
	
	// 커뮤니티 - 사내익명
	public void deleteAllAnonyAttach(int contentNo)throws SQLException;
	/**	커뮤니티 게시판 - 사내 익명 게시판 */
	
	//전자결재 목록조회
	public List<AttachVO> selectAttachApprovalByAppNo(int appNo) throws SQLException;
	
	public void deleteAllApprovalAttach(int appNo) throws SQLException;
	
	//noticeBorad
	public List<AttachVO> selectAttacheNoticeByNoticeNo(NoticeBoardVO noticeBoard)throws SQLException;
	
	//officeBoard
	public List<AttachVO> selectAttachOfficeByOfficeNo(OfficeVO office)throws SQLException;

	//otBoard
	public List<AttachVO> selectAttachOtByOtNo(OtVO ot)throws SQLException;

	//pdsBoard
	public List<AttachVO> selectAttachPdsByPdsNo(PdsVO pds)throws SQLException;
	
	public List<AttachVO> selectAttachAdditionalBoard(AttachVO attach) throws SQLException;
		
	// 첨부파일 로그
	List<AttachVO> selectAllList(SearchCriteria cri) throws SQLException;
	int selectAllListCount(SearchCriteria cri) throws SQLException;
	
	List<AttachVO> deleteAttachList() throws SQLException;
	void deleteCommAttach() throws SQLException;

}
