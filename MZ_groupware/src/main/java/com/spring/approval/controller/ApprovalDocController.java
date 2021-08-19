package com.spring.approval.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.approval.dto.ApprovalDocVO;
import com.spring.approval.service.ApprovalDocService;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

@Controller
public class ApprovalDocController {

	private final ApprovalDocService approvalDocService;

	@Autowired
	public ApprovalDocController(ApprovalDocService approvalDocService) {
		this.approvalDocService = approvalDocService;
	}
	
	@RequestMapping("/admin/approval/intestat/list")
	public String list(Model model, SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = approvalDocService.selectApprovalDocList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(approvalDocService.selectApprovalDocTotalCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("dataMap", dataMap);
		
		return "/approval/approvalDoc/list";
	}
	
	@RequestMapping("/admin/approval/intestat/normal/detail")
	public String detail(Model model, ApprovalDocVO approvalDocVO) throws SQLException {

		model.addAttribute("resultBean", approvalDocService.selectApprovalDoc(approvalDocVO));
		
		return "/approval/approvalDoc/detail";
	}
	
	@RequestMapping("/admin/approval/intestat/normal/registForm")
	public String registForm(Model model, ApprovalDocVO approvalDocVO) throws SQLException {
		
		return "/approval/approvalDoc/regist";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/regist",method=RequestMethod.POST)
	public String regist(Model model, ApprovalDocVO approvalDocVO) throws SQLException {
		approvalDocService.insertApprovalDoc(approvalDocVO);
		
		return "/approval/save";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/modifyForm",method=RequestMethod.GET)
	public String modifyForm(Model model, ApprovalDocVO approvalDocVO) throws SQLException {
		
		model.addAttribute("resultBean", approvalDocService.selectApprovalDoc(approvalDocVO));
		
		return "/approval/approvalDoc/modify";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/modify",method=RequestMethod.POST)
	public String modify(Model model, ApprovalDocVO approvalDocVO) throws SQLException {
		approvalDocService.updateApprovalDoc(approvalDocVO);
		
		return "/approval/modify_success";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/update",method=RequestMethod.POST)
	public String update(ApprovalDocVO approvalDocVO) throws SQLException {
		approvalDocService.updateUse(approvalDocVO);
		
		return "/approval/approvalDoc/updateUse";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/remove",method=RequestMethod.POST)
	public String remove(ApprovalDocVO approvalDocVO) throws SQLException {
		approvalDocService.deleteApprovalDoc(approvalDocVO);
		
		return "/approval/remove_success";
	}
	
	@RequestMapping(value="/admin/approval/intestat/normal/remove2",method=RequestMethod.POST)
	public String remove2(ApprovalDocVO approvalDocVO) throws SQLException {
		
		return "/approval/remove_success2";
	}
}

















