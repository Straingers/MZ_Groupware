package com.spring.approval.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.approval.dto.ApprovalReplyVO;
import com.spring.approval.dto.ApprovalVO;
import com.spring.approval.service.ApprovalReplyService;
import com.spring.approval.service.ApprovalService;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

@RestController
public class ApprovalReplyController {

	private final ApprovalReplyService approvalReplyService;
	private final ApprovalService approvalService;
	
	@Autowired
	public ApprovalReplyController(ApprovalReplyService approvalReplyService, ApprovalService approvalService) {
		this.approvalReplyService = approvalReplyService;
		this.approvalService = approvalService;
	}
	
	@RequestMapping(value="/approval/reply/{appNo}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("appNo") int appNo, @PathVariable("page") int page) throws SQLException {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			ApprovalReplyVO reply = new ApprovalReplyVO();
			reply.setAppNo(appNo);
			
			Map<String, Object> dataMap = approvalReplyService.getReplyListByAppNo(appNo, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);		
		}
		return entity;
	}
	
	@RequestMapping(value="/approval/reply", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ResponseEntity<String> regist(@RequestBody ApprovalReplyVO approvalReplyVO) throws Exception {

		ResponseEntity<String> entity = null;
		
		try {
			approvalReplyService.regist(approvalReplyVO);
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = approvalReplyService.getReplyListByAppNo(approvalReplyVO.getAppNo(), cri);
			
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			
			Map<String, Object> map = approvalService.getApproval(approvalReplyVO.getAppNo());
			ApprovalVO approval = (ApprovalVO) map.get("approval");
			
			entity = new ResponseEntity<String>("SUCCESS," + realEndPage + "," + approval.getEmpNo() + "," + approval.getAppTitle(), HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/approval/reply/{replyNo}",method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("replyNo") int replyNo, @RequestBody ApprovalReplyVO approvalReplyVO) throws Exception {
		
		ResponseEntity<String> entity = null;
		approvalReplyVO.setReplyNo(replyNo);
		
		approvalReplyVO.setReplyNo(replyNo);
		
		try {
			approvalReplyService.modify(approvalReplyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/approval/reply/{appNo}/{replyNo}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("appNo") int appNo,
										 @PathVariable("replyNo") int replyNo,
										 ApprovalReplyVO approvalReplyVO) throws Exception {
		ResponseEntity<String> entity=null;
		try {
			approvalReplyService.delete(approvalReplyVO);
			
			SearchCriteria cri = new SearchCriteria();
			ApprovalReplyVO reply = new ApprovalReplyVO();
			reply.setAppNo(appNo);
			reply.setReplyNo(replyNo);
			
			entity=new ResponseEntity<String>("",HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
