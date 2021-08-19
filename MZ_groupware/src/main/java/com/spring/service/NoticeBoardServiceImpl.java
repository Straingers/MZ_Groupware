package com.spring.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dao.NoticeBoardDAO;
import com.spring.dto.AttachVO;
import com.spring.dto.NoticeBoardVO;

public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	private NoticeBoardDAO noticeBoardDAO;

	public void setNoticeBoardDAO(NoticeBoardDAO noticeBoardDAO) {
		this.noticeBoardDAO = noticeBoardDAO;
	}
	
	private AttachDAO attachDAO;

	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public List<NoticeBoardVO> getNoticeList() throws SQLException {
		List<NoticeBoardVO> noticeBoardList = noticeBoardDAO.selectNoticeBoardListCriteria();
		
		for(NoticeBoardVO date : noticeBoardList) {
			Date noticeRegdate = date.getNoticeRegdate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd");
			String stringRegDate = simpleDateFormat.format(noticeRegdate);
			date.setStringNoticeRegdate(stringRegDate);
		}
		
		return noticeBoardList;
	}
	
	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException {
		List<NoticeBoardVO> noticeBoardList = noticeBoardDAO.selectNoticeBoardListCriteria(cri);
		List<NoticeBoardVO> importantNoticeBoardList = noticeBoardDAO.selectImportantNoticeBoardList();
		

		if (noticeBoardList != null)
			for (NoticeBoardVO noticeBoard : noticeBoardList)
				addAttachList(noticeBoard);
		if (importantNoticeBoardList != null)
			for (NoticeBoardVO importantNoticeBoard : importantNoticeBoardList)
				addAttachList(importantNoticeBoard);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeBoardDAO.selectNoticeBoardCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("noticeBoardList", noticeBoardList);
		dataMap.put("importantNoticeBoardList", importantNoticeBoardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public List<NoticeBoardVO> getNoticePopupList() throws SQLException {
		noticeBoardDAO.updateNoticePopUpN();
		
		List<NoticeBoardVO> noticeBoardList = noticeBoardDAO.selectMainNoticeBoardPopupList();

		if (noticeBoardList != null)
			for (NoticeBoardVO noticeBoard : noticeBoardList)
				addAttachList(noticeBoard);

		return noticeBoardList;
	}
	
	
	@Override
	public NoticeBoardVO getNoticeBoard(int noticeNo) throws SQLException {
		NoticeBoardVO noticeBoard = noticeBoardDAO.selectNoticeBoardBynoticeNo(noticeNo);
		addAttachList(noticeBoard);

		return noticeBoard;
	}
	
	@Override
	public NoticeBoardVO read(int noticeNo) throws SQLException {
		NoticeBoardVO noticeBoard = noticeBoardDAO.selectNoticeBoardBynoticeNo(noticeNo);
		noticeBoardDAO.increaseViewCnt(noticeNo);

		addAttachList(noticeBoard);

		return noticeBoard;
	}
	
	@Override
	public void noticeRegist(NoticeBoardVO noticeBoard) throws SQLException {
		int noticeNo = noticeBoardDAO.getSeqNextValue();
		noticeBoard.setNoticeNo(noticeNo);
		
		noticeBoardDAO.insertNoticeBoard(noticeBoard);
		
		if (noticeBoard.getAttachList() != null)
			for (AttachVO attach : noticeBoard.getAttachList()) {
				attach.setContentNo(noticeNo);
				attach.setAttachAttacher(noticeBoard.getEmpNo());
				attach.setMenuCode("M050100");
				attachDAO.insertAttach(attach);
			}
		
	}
	@Override
	public void noticeModify(NoticeBoardVO noticeBoard) throws SQLException {
		noticeBoardDAO.updateNoticeBoard(noticeBoard);

		if (noticeBoard.getAttachList() != null)
			for (AttachVO attach : noticeBoard.getAttachList()) {
				attach.setContentNo(noticeBoard.getNoticeNo());
				attach.setAttachAttacher(noticeBoard.getEmpNo());
				attach.setMenuCode("M050100");
				attachDAO.insertAttach(attach);
			}
	}
	@Override
	public void noticeRemove(int noticeNo) throws SQLException {
		noticeBoardDAO.deleteNoticeBoard(noticeNo);
	}
	@Override
	public NoticeBoardVO viewCnt(int noticeNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public AttachVO getAttachByAttachNo(int attachNo) throws SQLException {
		AttachVO attach = attachDAO.selectAttachByAttachNo(attachNo);
		return attach;
	}
	@Override
	public void removeAttachByAttachNo(int attachNo) throws SQLException {
		attachDAO.deleteAttach(attachNo);
	}
	
	// 파일 목록 조회 후 파일 보드에 저장
	private void addAttachList(NoticeBoardVO noticeBoard) throws SQLException {
		if (noticeBoard == null)
			return;

		List<AttachVO> attachList = attachDAO.selectAttacheNoticeByNoticeNo(noticeBoard);
		noticeBoard.setAttachList(attachList);
	}


	@Override
	public String selectSearchAdminId(String empNo) throws SQLException {
		String adminId = noticeBoardDAO.selectSearchAdminId(empNo);
		return adminId;
	}


	@Override
	public int adminCheck(String empNo) throws SQLException {
		int count = noticeBoardDAO.adminCheck(empNo);
		return count;
	}

	@Override
	public int getPopupCount() throws SQLException {
		int count = noticeBoardDAO.popupCount();
		return count;
	}

}
