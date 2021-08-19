package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dao.IpManageDAO;
import com.spring.dto.IpManageVO;

@Service
public class IpManageServiceImpl implements IpManageService {
	
	private final IpManageDAO ipManageDAO;
	public IpManageServiceImpl(IpManageDAO ipManageDAO) {
		this.ipManageDAO = ipManageDAO;
	}

	@Override
	public List<IpManageVO> getIpList() throws SQLException {
		List<IpManageVO> ipList = ipManageDAO.selectIpList();
		return ipList;
	}
	
	@Override
	public List<IpManageVO> getAvailableList() throws SQLException {
		List<IpManageVO> ipList = ipManageDAO.selectAvailableIp();
		return ipList;
	}

	@Override
	public void regist(IpManageVO ip) throws SQLException {
		ipManageDAO.insertIp(ip);
	}

	@Override
	public void modify(IpManageVO ip) throws SQLException {
		ipManageDAO.updateUse(ip);
	}

	@Override
	public void remove(IpManageVO ip) throws SQLException {
		ipManageDAO.deleteIp(ip);
	}

}
