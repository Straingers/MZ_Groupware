package com.spring.office.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.AttachDAO;
import com.spring.dto.AdminVO;
import com.spring.dto.AttachVO;
import com.spring.office.dao.OfficeDAO;
import com.spring.office.dto.OfficeVO;

public class OfficeServiceImpl implements OfficeService {
	private OfficeDAO officeDAO;
	public void setOfficeDAO(OfficeDAO officeDAO) {
		this.officeDAO = officeDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getOfficeList(SearchCriteria cri) throws SQLException {
		
		List<OfficeVO> officeList = officeDAO.selectOfficeList(cri);
		
		if(officeList != null)
			for(OfficeVO office : officeList)
				addAttachList(office);
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(officeDAO.selectOfficeListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("officeList", officeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public OfficeVO getOffice(int officeNo) throws SQLException {
		OfficeVO office = officeDAO.selectOfficeByOfficeNo(officeNo);
		addAttachList(office);
		return office;
	}

	@Override
	public void regist(OfficeVO office) throws SQLException {
		int chk = officeDAO.checkExistByEmpNo(office.getAdminEmpNo());
		if(chk > 0) {
			AdminVO admin = officeDAO.getAdminByEmpNo(office.getAdminEmpNo());
			office.setAdminId(admin.getAdminId());
			
			officeDAO.insertOfficeBoard(office);
		}
			
		if (office.getAttachList() != null)
			for (AttachVO attach : office.getAttachList()) {
				attach.setContentNo(office.getOfficeNo());
				attach.setAttachAttacher(office.getAdminEmpNo());
				attach.setMenuCode("M060100");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void modify(OfficeVO office) throws SQLException {
		officeDAO.updateOfficeBoard(office);
		
		if (office.getAttachList() != null)
			for (AttachVO attach : office.getAttachList()) {
				attach.setContentNo(office.getOfficeNo());
				attach.setAttachAttacher(office.getAdminEmpNo());
				attach.setMenuCode("M060100");
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void remove(int officeNo) throws SQLException {
		officeDAO.deleteOfficeBoard(officeNo);
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
	private void addAttachList(OfficeVO office) throws SQLException {
		if (office == null)
			return;
		
		List<AttachVO> attachList = attachDAO.selectAttachOfficeByOfficeNo(office);
		office.setAttachList(attachList);
	}
}
