package com.spring.admin.additional.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.admin.additional.dao.AdditionalBoardDAO;
import com.spring.admin.additional.dto.AdditionalBoardVO;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dto.AttachVO;

public class AdditionalBoardServiceImpl implements AdditionalBoardService {

	private AdditionalBoardDAO additionalBoardDAO;
	public void setAdditionalBoardDAO(AdditionalBoardDAO additionalBoardDAO) {
		this.additionalBoardDAO = additionalBoardDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getAdditionalBoardList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();
		List<AdditionalBoardVO> boardList = additionalBoardDAO.selectBoardListByBoardCode(cri);
		if(boardList != null) {
			for(AdditionalBoardVO board : boardList) {
				if (board != null) {
					AttachVO attach = new AttachVO();
					attach.setMenuCode(board.getBoardCode());
					attach.setContentNo(board.getAddNo());
					List<AttachVO> attachList = attachDAO.selectAttachAdditionalBoard(attach);
					board.setAttachList(attachList);
				}
			}
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(additionalBoardDAO.selectBoardListByBoardCodeCount(cri));
		dataMap.put("boardList", boardList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public AdditionalBoardVO getAdditionalBoard(AdditionalBoardVO board) throws SQLException {
		AdditionalBoardVO addBoard = additionalBoardDAO.selectBoardByAddNo(board);
		if (addBoard != null) {
			AttachVO attach = new AttachVO();
			attach.setMenuCode(addBoard.getBoardCode());
			attach.setContentNo(addBoard.getAddNo());
			List<AttachVO> attachList = attachDAO.selectAttachAdditionalBoard(attach);
			addBoard.setAttachList(attachList);
		}
		return addBoard;
	}

	@Override
	public AdditionalBoardVO readBoard(AdditionalBoardVO board) throws SQLException {
		AdditionalBoardVO addBoard = additionalBoardDAO.selectBoardByAddNo(board);
		additionalBoardDAO.increaseViewCount(addBoard);
		if (addBoard != null) {
			AttachVO attach = new AttachVO();
			attach.setMenuCode(addBoard.getBoardCode());
			attach.setContentNo(addBoard.getAddNo());
			List<AttachVO> attachList = attachDAO.selectAttachAdditionalBoard(attach);
			addBoard.setAttachList(attachList);
		}
		return addBoard;
	}

	@Override
	public void registBoard(AdditionalBoardVO board) throws SQLException {
		int addNo = additionalBoardDAO.insertBoard(board);
		if(board.getAttachList() != null) {
			for(AttachVO attach : board.getAttachList()) {
				attach.setContentNo(addNo);
				attach.setAttachAttacher(board.getEmpNo());
				attach.setMenuCode(board.getBoardCode());
				attachDAO.insertAttach(attach);
			}
		}
	}

	@Override
	public void modifyBoard(AdditionalBoardVO board) throws SQLException {
		additionalBoardDAO.updateBoard(board);
		
		if(board.getAttachList() != null) {
			for(AttachVO attach : board.getAttachList()) {
				attach.setContentNo(board.getAddNo());
				attach.setAttachAttacher(board.getEmpNo());
				attach.setMenuCode(board.getBoardCode());
				attachDAO.insertAttach(attach);
			}
		}
	}

	@Override
	public void removeBoard(AdditionalBoardVO board) throws SQLException {
		additionalBoardDAO.deleteBoard(board);
	}

	@Override
	public AttachVO getAttachByAttachNo(int attachNo) throws SQLException {
		return attachDAO.selectAttachByAttachNo(attachNo);
	}

	@Override
	public void removeAttatchByAttachNo(int attachNo) throws SQLException {
		attachDAO.deleteAttach(attachNo);
	}
	
	
}
