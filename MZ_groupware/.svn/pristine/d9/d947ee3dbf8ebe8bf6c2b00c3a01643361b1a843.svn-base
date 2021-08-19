package com.spring.approval.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.approval.dao.ApprovalAttachDAO;
import com.spring.approval.dao.ApprovalDAO;
import com.spring.approval.dao.ApprovalDocDAO;
import com.spring.approval.dao.ApprovalHistoryDAO;
import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.approval.dto.ApprovalHistoryVO;
import com.spring.approval.dto.ApprovalVO;
import com.spring.command.PageMaker;
import com.spring.dao.ReplyDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	private ApprovalDAO approvalDAO;
	private ApprovalHistoryDAO approvalHistoryDAO;
	private ApprovalDocDAO approvalDocDAO;
	private ApprovalAttachDAO approvalAttachDAO;
	private ReplyDAO replyDAO;
	
	public ApprovalServiceImpl(ApprovalDAO approvalDAO, ApprovalHistoryDAO approvalHistoryDAO, ApprovalDocDAO approvalDocDAO, ApprovalAttachDAO approvalAttachDAO, ReplyDAO replyDAO) {
		this.approvalDAO = approvalDAO;
		this.approvalHistoryDAO = approvalHistoryDAO;
		this.approvalDocDAO = approvalDocDAO;
		this.approvalAttachDAO = approvalAttachDAO;
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getApprovalList(ApprovalVO approval) throws SQLException {


		List<ApprovalVO> approvalList = approvalDAO.selectSearchApprovalList(approval);

		if (approvalList != null) {
			for (ApprovalVO app : approvalList) {
				addAttachList(app);
			}
		}
		
		for (ApprovalVO app : approvalList) {
			int replycnt = replyDAO.countReply(approval.getAppNo());
			approval.setViewcnt(replycnt);
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectSearchApprovalListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public ApprovalVO findFileInContent(String fileName) throws SQLException {
		
		ApprovalVO approval = approvalDAO.selectApprovalByFileName(fileName);
		
		return approval;
	}

	@Override
	public Map<String, Object> getApproval(int appNo) throws SQLException {
	
		ApprovalVO approval = approvalDAO.selectApprovalByAppNo(appNo);
		addAttachList(approval);

		ApprovalHistoryVO approvalHistoryFirst = approvalHistoryDAO.selectHistoryByFirst(appNo);
		ApprovalHistoryVO approvalHistorySecond = approvalHistoryDAO.selectHistoryBySecond(appNo);
		ApprovalHistoryVO approvalHistoryThird = approvalHistoryDAO.selectHistoryByThird(appNo);
		
		List<ApprovalHistoryVO> approvalHistoryHelp = approvalHistoryDAO.selectHistoryByHelp(appNo);
		List<ApprovalHistoryVO> approvalHistoryRef = approvalHistoryDAO.selectHistoryByRef(appNo);
		List<ApprovalHistoryVO> approvalHistoryRead = approvalHistoryDAO.selectHistoryByRead(appNo);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("approval", approval);
		dataMap.put("first", approvalHistoryFirst);
		dataMap.put("second", approvalHistorySecond);
		dataMap.put("third", approvalHistoryThird);

		dataMap.put("help", approvalHistoryHelp);
		dataMap.put("ref", approvalHistoryRef);
		dataMap.put("read", approvalHistoryRead);
		
		return dataMap;
	}

	@Override
	public ApprovalVO getApprovalForModify(int appNo) throws SQLException {

		ApprovalVO approval = approvalDAO.selectApprovalByAppNo(appNo);
		
		addAttachList(approval);
		
		return approval;
	}

	@Override
	public void regist(ApprovalVO approval) throws SQLException {
	
		int appNo = approvalDAO.selectApprovalSequenceNextValue();
		approval.setAppNo(appNo);
		
		approvalDAO.insertApproval(approval);

		String firstEmp = approval.getFirstEmp();
		String secondEmp = approval.getSecondEmp();
		String thirdEmp = approval.getThirdEmp();
		
		String[] helpEmp = approval.getHelpEmp();
		String[] refEmp = approval.getRefEmp();
		String[] readEmp = approval.getReadEmp();

		ApprovalHistoryVO approvalHistory = new ApprovalHistoryVO();
		ApprovalHistoryVO appHis = new ApprovalHistoryVO();
		
		
		appHis.setEmpNo(approval.getEmpNo());
		appHis.setAppType("상신자");
		appHis.setAppLevel("0");
		appHis.setAppNo(appNo);
		appHis.setAppSign("U");
		approvalHistoryDAO.insertAppHistroy(appHis);
		
		if (firstEmp != null) {
			approvalHistory.setEmpNo(firstEmp);
			approvalHistory.setAppType("1차결재권자");
			approvalHistory.setAppLevel("1");
			approvalHistory.setAppNo(appNo);
			approvalHistoryDAO.insertApprovalHistory(approvalHistory);
		}
		
		
		if (secondEmp != null) {
			approvalHistory.setEmpNo(secondEmp);
			approvalHistory.setAppType("2차결재권자");
			approvalHistory.setAppLevel("2");
			approvalHistory.setAppNo(appNo);
			approvalHistoryDAO.insertApprovalHistory(approvalHistory);
			
		}
		
		if (thirdEmp != null) {
			approvalHistory.setEmpNo(thirdEmp);
			approvalHistory.setAppType("최종결재권자");
			approvalHistory.setAppLevel("3");
			approvalHistory.setAppNo(appNo);
			approvalHistoryDAO.insertApprovalHistory(approvalHistory);
			
		}
		
		if(helpEmp != null) {
			for(String emp : helpEmp) {
				approvalHistory.setEmpNo(emp);
				approvalHistory.setAppType("협조");
				approvalHistory.setAppNo(appNo);
				approvalHistory.setAppLevel("협조");
				approvalHistoryDAO.insertApprovalHistory(approvalHistory);
			}
		}
		
		if(refEmp != null) {
			for(String emp : refEmp) {
				approvalHistory.setEmpNo(emp);
				approvalHistory.setAppType("참조");
				approvalHistory.setAppNo(appNo);
				approvalHistory.setAppLevel("참조");
				approvalHistoryDAO.insertApprovalHistory(approvalHistory);
			}
		}
		
		if(readEmp != null) {
			for(String emp : readEmp) {
				approvalHistory.setEmpNo(emp);
				approvalHistory.setAppType("회람");
				approvalHistory.setAppNo(appNo);
				approvalHistory.setAppLevel("회람");
				approvalHistoryDAO.insertApprovalHistory(approvalHistory);
			}
		}
		
		
		if (approval.getAttachList() != null) {
			for (ApprovalAttachVO attach : approval.getAttachList()) {
				attach.setAppNo(appNo);
				attach.setAttachAttacher(approval.getEmpNo());
				
				approvalAttachDAO.insertAttach(attach);
			}
		}
	}

	@Override
	public void modify(ApprovalVO approval) throws SQLException {

		if (approval.getAttachList() != null) {
			for (ApprovalAttachVO attach : approval.getAttachList()) {
				attach.setAppNo(approval.getAppNo());
				attach.setAttachAttacher(approval.getEmpNo());
				approvalAttachDAO.insertAttach(attach);
			}
		}
		
		approvalDAO.updateApproval(approval);
	}

	@Override
	public void remove(int appNo) throws SQLException {

		approvalDAO.deleteApproval(appNo);
	}

	@Override
	public ApprovalAttachVO getAttachByAttachNo(int attachNo) throws SQLException {
		
		ApprovalAttachVO attach = approvalAttachDAO.selectAttachByAttachNo(attachNo);
		
		return attach;
	}

	@Override
	public void removeAttachByAttachNo(int attachNo) throws SQLException {

		approvalAttachDAO.deleteAttach(attachNo);
	}
	
	private void addAttachList(ApprovalVO approval) throws SQLException {
		if(approval == null)
			return;
		
		int appNo = approval.getAppNo();
		
		List<ApprovalAttachVO> attachList = approvalAttachDAO.selectAttachByAppNo(appNo);
		
		approval.setAttachList(attachList);
	}

	@Override
	public Map<String, Object> getTempApprovalList(ApprovalVO approval) throws SQLException {

		List<ApprovalVO> approvalList = approvalDAO.selectTempApprovalList(approval);
		
		if (approvalList != null) 
			for (ApprovalVO app : approvalList) 
				addAttachList(app);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectTempListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
				
		return dataMap;
	}

	@Override
	public void registTempApproval(ApprovalVO approval) throws SQLException {

		approval.setAppStatus("임시저장");
		approvalDAO.insertTempApproval(approval);
		if (approval.getAttachList() != null) {
			for (ApprovalAttachVO attach : approval.getAttachList()) {
				attach.setAppNo(approval.getAppNo());
				attach.setAttachAttacher(approval.getEmpNo());
				approvalAttachDAO.insertAttach(attach);
			}
		}
	}

	@Override
	public Map<String, Object> getTempApproval(ApprovalVO approval) throws SQLException {

		ApprovalVO app = approvalDAO.selectTempApproval(approval);
		addAttachList(app);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("app", app);
		
		return dataMap;
	}

	@Override
	public void modifyTempApproval(ApprovalVO approval) throws SQLException {

		approvalDAO.updateTempApproval(approval);
		
		if (approval.getAttachList() != null) {
			for (ApprovalAttachVO attach : approval.getAttachList()) {
				attach.setAppNo(approval.getAppNo());
				attach.setAttachAttacher(approval.getEmpNo());
				approvalAttachDAO.insertAttach(attach);
			}
		}
	}

	@Override
	public void removeTempApproval(ApprovalVO approval) throws SQLException {
		approvalDAO.deleteTempApproval(approval);
	}

	@Override
	public Map<String, Object> getIngApprovalList(ApprovalVO approval) throws SQLException {

		List<ApprovalVO> approvalList = approvalDAO.selectIngApprovalList(approval);
		
		if (approvalList != null) 
			for (ApprovalVO app : approvalList) 
				addAttachList(app);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectIngListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
				
		return dataMap;
	}

	@Override
	public Map<String, Object> getCompApprovalList(ApprovalVO approval) throws SQLException {
	
		List<ApprovalVO> approvalList = approvalDAO.selectCompApprovalList(approval);
		
		if (approvalList != null) {
			for (ApprovalVO app : approvalList) {
				addAttachList(app);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectCompListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getRefApprovalList(ApprovalVO approval) throws SQLException {

		List<ApprovalVO> approvalList = approvalDAO.selectRefApprovalList(approval);
		
		if (approvalList != null) {
			for (ApprovalVO app : approvalList) {
				addAttachList(app);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectRefListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getReadApprovalList(ApprovalVO approval) throws SQLException {

		List<ApprovalVO> approvalList = approvalDAO.selectReadApprovalList(approval);
		
		if (approvalList != null) {
			for (ApprovalVO app : approvalList) {
				addAttachList(app);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectReadListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void modifyAppStatusByAppNo(ApprovalVO approval) throws SQLException {
		approvalDAO.updateAppStatusByAppNo(approval);
	}

	@Override
	public Map<String, Object> getRejApprovalList(ApprovalVO approval) throws SQLException {

		List<ApprovalVO> approvalList = approvalDAO.selectRejApprovalList(approval);
		
		if (approvalList != null) {
			for (ApprovalVO app : approvalList) {
				addAttachList(app);
			}
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectRejListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int getUncheckAppCount(String empNo) throws SQLException {
		int cnt = approvalDAO.selectUncheckCount(empNo);
		return cnt;
	}

	@Override
	public Map<String, Object> getLogList(ApprovalVO approval) throws SQLException {
		List<ApprovalVO> logList = approvalDAO.selectAppLogList(approval);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(approval);
		pageMaker.setTotalCount(approvalDAO.selectAppLogListCount(approval));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("logList", logList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<ApprovalVO> getAllList(String empNo) throws SQLException {
		List<ApprovalVO> appList = approvalDAO.selectAllReceiveList(empNo);
		return appList;
	}

}



