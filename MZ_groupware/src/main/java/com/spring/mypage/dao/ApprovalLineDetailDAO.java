package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.mypage.dto.ApprovalLinePersonalDetailVO;

public interface ApprovalLineDetailDAO {

	List<ApprovalLinePersonalDetailVO> selectLineDetailList(ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO) throws SQLException;
	ApprovalLinePersonalDetailVO selectLineDetail(ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO) throws SQLException;

	void insertLineDetail(ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO) throws SQLException;
	void deleteLineDetail(int lineId) throws SQLException;
	
}
