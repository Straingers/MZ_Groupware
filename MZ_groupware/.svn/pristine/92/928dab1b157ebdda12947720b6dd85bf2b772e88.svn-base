package com.spring.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.EmployeeVO;
import com.spring.mypage.dto.ApprovalLinePersonalVO;
import com.spring.mypage.dto.TaskReceiverLineVO;
import com.spring.mypage.service.ApprovalLineService;
import com.spring.mypage.service.TaskReceiverLineService;

@Controller
public class ReceiverLineController {
	
	private final TaskReceiverLineService taskLineService;
	private final ApprovalLineService approvalLineService;
	
	@Autowired
	public ReceiverLineController(TaskReceiverLineService taskLineService, ApprovalLineService approvalLineService) {
		this.taskLineService = taskLineService;
		this.approvalLineService = approvalLineService;
	}
	
	@RequestMapping("/mypage/approval/line/main")
	public String main(Model model,
			           TaskReceiverLineVO taskReceiverLineVO, ApprovalLinePersonalVO approvalLinePersonalVO,
			           HttpSession session) throws Exception {
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		taskReceiverLineVO.setEmpNo(loginUser.getEmpNo());
		approvalLinePersonalVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = taskLineService.getLineList(taskReceiverLineVO);
		
		model.addAttribute("taskLine", dataMap.get("lineList"));
		

		Map<String, Object> appMap = approvalLineService.getLineList(approvalLinePersonalVO);
		
		model.addAttribute("approvalLine", appMap.get("lineList"));
		
		return "/mypage/lineMain";
	}
	
	// 결재선관리
	@RequestMapping("/mypage/line/approvalRegistForm")
	public String approvalRegistForm() throws Exception {
		return "/mypage/approvalRegist";
	}
	
	@RequestMapping(value="/mypage/line/approvalRegist",method=RequestMethod.POST)
	public String approvalRegist(Model model, ApprovalLinePersonalVO approvalLinePersonalVO, HttpSession session) throws Exception {
		approvalLineService.regist(approvalLinePersonalVO);
		return "/mypage/save";
	}
	
	@RequestMapping("mypage/line/approval/remove")
	public String approvalRemove(ApprovalLinePersonalVO approvalLinePersonalVO) throws Exception {
		approvalLineService.delete(approvalLinePersonalVO);
		return "/mypage/remove_success";
	}
	
	@RequestMapping("/mypage/line/approval/detail")
	public String approvalDetail(ApprovalLinePersonalVO approvalLinePersonalVO, Model model) throws Exception {
		Map<String, Object> dataMap = approvalLineService.getLine(approvalLinePersonalVO);
		
		
		model.addAttribute("line", dataMap.get("line"));
		
		return "/mypage/approvalDetail";
	}
	
	@RequestMapping(value="/mypage/line/approval/modify",method=RequestMethod.POST)
	public String approvalModify(ApprovalLinePersonalVO approvalLinePersonalVO, Model model) throws Exception {
		approvalLineService.update(approvalLinePersonalVO);
		
		return "mypage/modify_success";
	}
	
	
	
	// 수신선관리
	@RequestMapping("/mypage/line/receiveRegistForm")
	public String taskReceiveRegistForm() throws Exception {
		return "/mypage/taskReceiveRegist";
	}
	
	@RequestMapping(value="/mypage/line/receiveRegist", method=RequestMethod.POST)
	public String taskReceiveRegist(Model model, TaskReceiverLineVO taskReceiverLineVO, HttpSession session) throws Exception {
		taskLineService.regist(taskReceiverLineVO);
		return "/mypage/save";
	}
	
	@RequestMapping("/mypage/line/taskReceive/remove")
	public String taskReceiveRemove(TaskReceiverLineVO taskReceiverLineVO) throws Exception {
		taskLineService.delete(taskReceiverLineVO);
		return "/mypage/remove_success";
	}
	
	@RequestMapping("/mypage/line/taskReceive/detail")
	public String taskReceiveDetail(TaskReceiverLineVO taskReceiverLineVO, Model model) throws Exception {
		Map<String, Object> dataMap = taskLineService.getLine(taskReceiverLineVO);
		
		model.addAttribute("line", dataMap.get("line"));
		model.addAttribute("rec", dataMap.get("rec"));
		model.addAttribute("cc", dataMap.get("cc"));
		
		return "/mypage/taskReceiveDetail";
	}
	
	@RequestMapping(value="/mypage/line/taskReceive/modify", method=RequestMethod.POST)
	public String taskReceiveModify(TaskReceiverLineVO taskReceiverLineVO, Model model) throws Exception {
		taskLineService.update(taskReceiverLineVO);
		
		return "/mypage/modify_success";
	}
}
