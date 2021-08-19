package com.spring.ot.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dto.AdminVO;
import com.spring.dto.AttachVO;
import com.spring.ot.dao.OtDAO;
import com.spring.ot.dto.OtVO;

public class OtServiceImpl implements OtService {
	private OtDAO otDAO;
	public void setOtDAO(OtDAO otDAO) {
		this.otDAO = otDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getOtList(SearchCriteria cri) throws SQLException {
		
		List<OtVO> otList = otDAO.selectOtList(cri);
		
		if(otList != null)
			for(OtVO ot : otList)
				addAttachList(ot);
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(otDAO.selectOtListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("otList", otList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public OtVO getOt(int otNo) throws SQLException {
		OtVO ot = otDAO.selectOtByOtNo(otNo);
		addAttachList(ot);
		return ot;
	}

	@Override
	public void regist(OtVO ot) throws SQLException {
		int chk = otDAO.checkExistByEmpNo(ot.getAdminEmpNo());
		if(chk > 0) {
			AdminVO admin = otDAO.getAdminByEmpNo(ot.getAdminEmpNo());
			ot.setAdminId(admin.getAdminId());
			
			otDAO.insertOtBoard(ot);
		}
		if (ot.getAttachList() != null)
			for (AttachVO attach : ot.getAttachList()) {
				attach.setContentNo(ot.getOtNo());
				attach.setAttachAttacher(ot.getAdminEmpNo());
				attach.setMenuCode("M060200");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void modify(OtVO ot) throws SQLException {
		otDAO.updateOtBoard(ot);
		
		if (ot.getAttachList() != null)
			for (AttachVO attach : ot.getAttachList()) {
				attach.setContentNo(ot.getOtNo());
				attach.setAttachAttacher(ot.getAdminEmpNo());
				attach.setMenuCode("M060200");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void remove(int otNo) throws SQLException {
		otDAO.deleteOtBoard(otNo);
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
	private void addAttachList(OtVO ot) throws SQLException {
		if (ot == null)
			return;
		
		List<AttachVO> attachList = attachDAO.selectAttachOtByOtNo(ot);
		ot.setAttachList(attachList);
	}
}
