package com.spring.pds.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.dao.AttachDAO;
import com.spring.dto.AttachVO;
import com.spring.pds.dao.PdsDAO;
import com.spring.pds.dto.PdsVO;

public class PdsServiceImpl implements PdsService {
	private PdsDAO pdsDAO;
	public void setPdsDAO(PdsDAO pdsDAO) {
		this.pdsDAO = pdsDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getPdsList(PdsVO pds) throws SQLException {
		
		List<PdsVO> pdsList = pdsDAO.selectPdsList(pds);
		
		if(pdsList != null)
			for(PdsVO pdsvo : pdsList)
				addAttachList(pdsvo);
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(pds);
		pageMaker.setTotalCount(pdsDAO.selectPdsListCount(pds));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pdsList", pdsList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public PdsVO getPds(int pdsNo) throws SQLException {
		PdsVO pds = pdsDAO.selectPdsByPdsNo(pdsNo);
		addAttachList(pds);
		return pds;
	}

	@Override
	public void regist(PdsVO pds) throws SQLException {
		
		pdsDAO.insertPdsBoard(pds);
		if (pds.getAttachList() != null)
			for (AttachVO attach : pds.getAttachList()) {
				attach.setContentNo(pds.getPdsNo());
				attach.setAttachAttacher(pds.getEmpNo());
				attach.setMenuCode("M060300");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void modify(PdsVO pds) throws SQLException {
		pdsDAO.updatePdsBoard(pds);
		
		if (pds.getAttachList() != null)
			for (AttachVO attach : pds.getAttachList()) {
				attach.setContentNo(pds.getPdsNo());
				attach.setAttachAttacher(pds.getEmpNo());
				attach.setMenuCode("M060300");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void remove(int pdsNo) throws SQLException {
		pdsDAO.deletePdsBoard(pdsNo);
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
	private void addAttachList(PdsVO pds) throws SQLException {
		if (pds == null)
			return;
		
		List<AttachVO> attachList = attachDAO.selectAttachPdsByPdsNo(pds);
		pds.setAttachList(attachList);
	}
}
