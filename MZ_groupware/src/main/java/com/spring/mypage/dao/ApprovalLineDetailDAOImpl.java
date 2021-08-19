package com.spring.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.mypage.dto.ApprovalLinePersonalDetailVO;

@Repository
public class ApprovalLineDetailDAOImpl implements ApprovalLineDetailDAO{

	private final SqlSession session;
	
	public ApprovalLineDetailDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ApprovalLinePersonalDetailVO> selectLineDetailList(
			ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO) throws SQLException {

		List<ApprovalLinePersonalDetailVO> detailList = session.selectList("ApprovalLineDetail-Mapper.selectLineDetailList", approvalLinePersonalDetailVO);
		
		return detailList;
	}

	@Override
	public ApprovalLinePersonalDetailVO selectLineDetail(ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO)
			throws SQLException {
		
		return session.selectOne("ApprovalLineDetail-Mapper.selectLineDetail", approvalLinePersonalDetailVO);
	}

	@Override
	public void insertLineDetail(ApprovalLinePersonalDetailVO approvalLinePersonalDetailVO) throws SQLException {
		session.insert("ApprovalLineDetail-Mapper.insertLineDetail", approvalLinePersonalDetailVO);
	}

	@Override
	public void deleteLineDetail(int lineId) throws SQLException {
		session.delete("ApprovalLineDetail-Mapper.deleteLineDetail", lineId);
	}

}
