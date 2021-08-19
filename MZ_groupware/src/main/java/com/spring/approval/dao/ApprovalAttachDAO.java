package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.command.SearchCriteria;

public interface ApprovalAttachDAO {

	public List<ApprovalAttachVO> selectAttachByAppNo(int appNo) throws SQLException;
	public ApprovalAttachVO selectAttachByAttachNo(int attachNo) throws SQLException;
	
	public void insertAttach(ApprovalAttachVO attach) throws SQLException;
	
	public void deleteAttach(int attachNo) throws SQLException;
	
	public void deleteAllAttach(int appNo) throws SQLException;
	
	List<ApprovalAttachVO> selectAllAppList(SearchCriteria cri) throws SQLException;
	int selectAllAppListCount(SearchCriteria cri) throws SQLException;
}
