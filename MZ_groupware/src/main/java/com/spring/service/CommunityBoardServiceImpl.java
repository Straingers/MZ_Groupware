package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dao.CommunityBoardDAO;
import com.spring.dao.CommunityReplyDAO;
import com.spring.dto.AttachVO;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.CommunityReplyVO;

public class CommunityBoardServiceImpl implements CommunityBoardService {
	
	private CommunityBoardDAO communityBoardDAO;

	public void setCommunityBoardDAO(CommunityBoardDAO communityBoardDAO) {
		this.communityBoardDAO = communityBoardDAO;
	}
	
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	private CommunityReplyDAO replyDAO;
	public void setCommunityReplyDAO(CommunityReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	// 마이페이지 - 내가 쓴 글 조회
	@Override
	public Map<String, Object> getMyCommunityList(SearchCriteria cri) throws SQLException {
		List<CommunityBoardVO> communityList = communityBoardDAO.selectTotalBoardCriteriaByLoginUser(cri);
		
		if(communityList != null) {
			for(CommunityBoardVO community : communityList) {
				List<AttachVO> attachList = attachDAO.selectAttachByContentNo(community.getCommNo());
				community.setAttachList(attachList);
			}
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(communityBoardDAO.selectTotalBoardTotalCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("communityList", communityList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	// 사내 익명 게시판 조회
	@Override
	public Map<String, Object> getAnonyList(SearchCriteria cri) throws SQLException {
		List<CommunityBoardVO> communityBoardList = communityBoardDAO.selectCommunityBoardAnonyCriteria(cri);
		
		if (communityBoardList != null)
			for (CommunityBoardVO communityBoard : communityBoardList)
				addAttachList(communityBoard);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(communityBoardDAO.selectCommunityBoardAnonyCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("communityBoardList", communityBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 게시글 글 번호 기준 조회
	@Override
	public CommunityBoardVO getCommunityBoard(int commNo) throws SQLException {
		CommunityBoardVO communityBoard = communityBoardDAO.selectCommunityBoardByCommNo(commNo);
		addAttachList(communityBoard);

		return communityBoard;
	}

	// 게시글 등록
	@Override
	public void regist(CommunityBoardVO communityBoard) throws SQLException {
		int commNo = communityBoardDAO.getSeqNextValue();
		communityBoard.setCommNo(commNo);
		
		communityBoardDAO.insertCommunityBoard(communityBoard);
		
		if (communityBoard.getAttachList() != null)
			for (AttachVO attach : communityBoard.getAttachList()) {
				attach.setContentNo(commNo);
				attach.setAttachAttacher(communityBoard.getEmpNo());
				attach.setMenuCode(communityBoard.getCommunityCode());
				attachDAO.insertAttach(attach);
			}
	}

	// 게시판 수정
	@Override
	public void modify(CommunityBoardVO communityBoard) throws SQLException {
		communityBoardDAO.updateCommunityBoard(communityBoard);
		// attachDAO.deleteAllAttach(pds.getPno());

		if (communityBoard.getAttachList() != null)
			for (AttachVO attach : communityBoard.getAttachList()) {
				attach.setContentNo(communityBoard.getCommNo());
				attach.setAttachAttacher(communityBoard.getEmpNo());
				attach.setMenuCode(communityBoard.getCommunityCode());
				attachDAO.insertAttach(attach);
			}
	}

	// 게시판 삭제
	@Override
	public void remove(int commNo) throws SQLException {
		communityBoardDAO.deleteCommunityBoard(commNo);
	}

	// 게시글 글 번호 기준 조회
	@Override
	public CommunityBoardVO read(int commNo) throws SQLException {
		CommunityBoardVO communityboard = communityBoardDAO.selectCommunityBoardByCommNo(commNo);
		communityBoardDAO.increaseViewCnt(commNo);

		addAttachList(communityboard);

		return communityboard;
	}

	// 파일 조회
	@Override
	public AttachVO getAttachByAttachNo(int attachNo) throws SQLException {
		AttachVO attach = attachDAO.selectAttachByAttachNo(attachNo);

		return attach;
	}

	//파일 삭제
	@Override
	public void removeAttachByAttachNo(int attachNo) throws SQLException {
		attachDAO.deleteAttach(attachNo);
	}
	
	// 파일 목록 조회 후 파일 보드에 저장
	private void addAttachList(CommunityBoardVO communityBoard) throws SQLException {
		if (communityBoard == null)
			return;

		List<AttachVO> attachList = attachDAO.selectAttacheCommunityByContentNo(communityBoard);
		communityBoard.setAttachList(attachList);
	}
	
	
	////////////////////////////////////////////////////////////동호회 게시판
	// 목록 조회
	@Override
	public Map<String, Object> getClubList(SearchCriteria cri) throws SQLException {
		List<CommunityBoardVO> communityBoardList = communityBoardDAO.selectCommunityBoardClubCriteria(cri);
		
		if (communityBoardList != null)
			for (CommunityBoardVO communityBoard : communityBoardList)
				addAttachList(communityBoard);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(communityBoardDAO.selectCommunityBoardClubCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("communityBoardList", communityBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	/////////////////////////////////////////////////////////////경조사 게시판
	// 목록 조회
	@Override
	public Map<String, Object> getCncList(SearchCriteria cri) throws SQLException {
		List<CommunityBoardVO> communityBoardList = communityBoardDAO.selectCommunityBoardCncCriteria(cri);
		
		if (communityBoardList != null)
			for (CommunityBoardVO communityBoard : communityBoardList)
				addAttachList(communityBoard);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(communityBoardDAO.selectCommunityBoardCncCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("communityBoardList", communityBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	/////////////////////////////////////////////////////////////Qna 게시판
	// 목록 조회
	@Override
	public Map<String, Object> getQnaList(SearchCriteria cri) throws SQLException {
	List<CommunityBoardVO> communityBoardList = communityBoardDAO.selectCommunityBoardQnaCriteria(cri);
	
	if (communityBoardList != null)
	for (CommunityBoardVO communityBoard : communityBoardList) {
		addAttachList(communityBoard);
		addreplyList(communityBoard);
	}
	
	PageMaker pageMaker = new PageMaker();
	pageMaker.setCri(cri);
	pageMaker.setTotalCount(communityBoardDAO.selectCommunityBoardQnaCriteriaTotalCount(cri));
	
	Map<String, Object> dataMap = new HashMap<String, Object>();
	dataMap.put("communityBoardList", communityBoardList);
	dataMap.put("pageMaker", pageMaker);
	
	return dataMap;
	}
	
	// 댓글 목록 조회 후 파일 보드에 저장
	private void addreplyList(CommunityBoardVO communityBoard) throws SQLException {
		if (communityBoard == null)
			return;

		List<CommunityReplyVO> replyList = replyDAO.selectReplyList(communityBoard);
		communityBoard.setReplyList(replyList);
	}

}
