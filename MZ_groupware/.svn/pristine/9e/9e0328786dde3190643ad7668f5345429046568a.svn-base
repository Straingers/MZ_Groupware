package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.dto.IpManageVO;

@Repository
public class IpManageDAOImpl implements IpManageDAO {
	
	private final SqlSession session;
	public IpManageDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	@Override
	public List<IpManageVO> selectIpList() throws SQLException {
		return session.selectList("IpManage-Mapper.selectIpList");
	}
	
	@Override
	public List<IpManageVO> selectAvailableIp() throws SQLException {
		return session.selectList("IpManage-Mapper.selectAvailableIp");
	}

	@Override
	public void insertIp(IpManageVO ip) throws SQLException {
		session.insert("IpManage-Mapper.insertIp", ip);
	}

	@Override
	public void updateUse(IpManageVO ip) throws SQLException {
		session.update("IpManage-Mapper.updateUse", ip);
	}

	@Override
	public void deleteIp(IpManageVO ip) throws SQLException {
		session.update("IpManage-Mapper.deleteIp", ip);
	}

}
