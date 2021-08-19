package com.spring.approval.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.approval.dto.ApprovalVO;
import com.spring.command.SearchCriteria;

public class ApprovalDAOImpl implements ApprovalDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalVO> selectSearchApprovalList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectSearchApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public List<ApprovalVO> selectSearchApprovalByCategory(SearchCriteria cri, ApprovalVO approval) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectSearchApprovalByCategory", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectSearchApprovalListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("Approval-Mapper.selectSearchApprovalListCount", cri);
		
		return count;
	}

	@Override
	public ApprovalVO selectApprovalByAppNo(int appNo) throws SQLException {
		
		ApprovalVO approval = session.selectOne("Approval-Mapper.selectApprovalByAppNo", appNo);
		
		return approval;
	}

	@Override
	public ApprovalVO selectApprovalByFileName(String FileName) throws SQLException {

		ApprovalVO approval = session.selectOne("Approval-Mapper.selectApprovalByFileName", FileName);
		
		return approval;
	}

	@Override
	public int selectApprovalSequenceNextValue() throws SQLException {

		int seq_num = session.selectOne("Approval-Mapper.selectApprovalSequenceNextValue");
		
		return seq_num;
	}

	@Override
	public void insertApproval(ApprovalVO approval) throws SQLException {

		session.update("Approval-Mapper.insertApproval", approval);
	}

	@Override
	public void updateApproval(ApprovalVO approval) throws SQLException {

		session.update("Approval-Mapper.updateApproval", approval);
	}

	@Override
	public void deleteApproval(int appNo) throws SQLException {

		session.update("Approval-Mapper.deleteApproval", appNo);
	}

	@Override
	public ApprovalVO selectTempApproval(ApprovalVO approval) throws SQLException {

		ApprovalVO app = session.selectOne("Approval-Mapper.selectTempApproval", approval);
		
		return app;
	}

	@Override
	public void insertTempApproval(ApprovalVO approval) throws SQLException {
		session.insert("Approval-Mapper.insertTempApproval", approval);
	}

	@Override
	public void updateTempApproval(ApprovalVO approval) throws SQLException {
		session.update("Approval-Mapper.updateTempApproval", approval);
	}

	@Override
	public void deleteTempApproval(ApprovalVO approval) throws SQLException {
		session.update("Approval-Mapper.deleteTempApproval", approval);
	}

	@Override
	public List<ApprovalVO> selectTempApprovalList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectTempApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectTempListCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Approval-Mapper.selectTempListCount", cri);
		
		return count;
	}

	@Override
	public List<ApprovalVO> selectIngApprovalList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectIngApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public List<ApprovalVO> selectCompApprovalList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectCompApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectIngListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("Approval-Mapper.selectIngListCount", cri);
		
		return count;
	}

	@Override
	public int selectCompListCount(SearchCriteria cri) throws SQLException {

		int count = session.selectOne("Approval-Mapper.selectCompListCount", cri);
		
		return count;
	}

	@Override
	public List<ApprovalVO> selectRefApprovalList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectRefApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectRefListCount(SearchCriteria cri) throws SQLException {

		int count = session.selectOne("Approval-Mapper.selectRefListCount", cri);
		
		return count;
	}

	@Override
	public List<ApprovalVO> selectReadApprovalList(SearchCriteria cri) throws SQLException {
	
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectReadApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectReadListCount(SearchCriteria cri) throws SQLException {
	
		int count = session.selectOne("Approval-Mapper.selectReadListCount", cri);
		
		return count;
	}

	@Override
	public void updateAppStatusByAppNo(ApprovalVO approval) throws SQLException {
		session.update("Approval-Mapper.updateAppStatusByAppNo", approval);
	}

	@Override
	public List<ApprovalVO> selectRejApprovalList(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectRejApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectRejListCount(SearchCriteria cri) throws SQLException {

		int count = session.selectOne("Approval-Mapper.selectRejListCount", cri);
		
		return count;
	}

	@Override
	public int selectUncheckCount(String empNo) throws SQLException {
		return session.selectOne("Approval-Mapper.selectUncheckCount", empNo);
	}

	@Override
	public List<ApprovalVO> selectAppLogList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("Approval-Mapper.selectAppLogList", cri, rowBounds);
	}

	@Override
	public int selectAppLogListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Approval-Mapper.selectAppLogListCount");
	}

	@Override
	public List<ApprovalVO> selectAllReceiveList(String empNo) throws SQLException {
		return session.selectList("Approval-Mapper.selectAllReceiveList", empNo);
	}
	
	
}
