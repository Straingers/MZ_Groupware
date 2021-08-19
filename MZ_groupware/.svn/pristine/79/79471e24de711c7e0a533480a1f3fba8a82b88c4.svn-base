package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.approval.dto.ApprovalVO;
import com.spring.approval.service.ApprovalService;
import com.spring.cloud.dto.FileVO;
import com.spring.cloud.service.CloudService;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.IpManageVO;
import com.spring.service.AttachService;
import com.spring.service.IpManageService;
import com.spring.task.dto.TaskAttachVO;

@Controller
public class LogController {
	
	private final IpManageService ipManagerService;
	private final ApprovalService approvalService;
	private final AttachService attachService;
	
	@Autowired
	private CloudService cloudService;
	
	@Autowired
	public LogController(IpManageService ipManagerService, ApprovalService approvalService, AttachService attachService) {
		this.ipManagerService = ipManagerService;
		this.approvalService = approvalService;
		this.attachService = attachService;
	}
	
	// 출/퇴근 IP 관리
	@RequestMapping("/admin/log/ipManage/list")
	public String list(Model model) throws SQLException {
		model.addAttribute("resultList", ipManagerService.getIpList());
		return "/admin/log/ipManage";
	}

	@RequestMapping(value="/admin/log/ipManage/regist", method = RequestMethod.POST)
	public String regist(IpManageVO ipManageVO) throws SQLException {
		ipManagerService.regist(ipManageVO);
		return "/admin/log/regist_success";
	}
	
	@RequestMapping(value="/admin/log/ipManage/update")
	public String update(IpManageVO ipManageVO) throws SQLException {
		ipManagerService.modify(ipManageVO);
		return "/admin/log/modify_success";
	}
	
	@RequestMapping(value="/admin/log/ipManage/remove", method = RequestMethod.POST)
	public String remove(IpManageVO ipManageVO) throws SQLException {
		ipManagerService.remove(ipManageVO);
		return "/admin/log/remove_success";
	}
	
	
	// 결재로그 조회
	@RequestMapping(value="/admin/log/approval/list")
	public String appList(Model model,
            			  ApprovalVO approval) throws SQLException {
		
		Map<String, Object> dataMap = approvalService.getLogList(approval);
		model.addAttribute("dataMap", dataMap);
   		
		return "/admin/log/appList";
	}
	
	@RequestMapping(value="/admin/log/approval/detail")
	public String appDetail(Model model, int appNo, ApprovalVO approval) throws Exception {
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		ApprovalVO app = (ApprovalVO) dataMap.get("approval");
		
		List<ApprovalAttachVO> attachList = approval.getAttachList();
		if (attachList != null) {
			for (ApprovalAttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		model.addAttribute("approval", dataMap.get("approval"));
		
		model.addAttribute("first", dataMap.get("first"));
		model.addAttribute("second", dataMap.get("second"));
		model.addAttribute("third", dataMap.get("third"));

		model.addAttribute("help", dataMap.get("help"));
		model.addAttribute("ref", dataMap.get("ref"));
		model.addAttribute("read", dataMap.get("read"));
		
		return "/admin/log/appDetail";
	}
	
	
	// 첨부파일 로그
	@RequestMapping(value="/admin/log/attach/attach/list")
	public String attList(Model model, AttachVO attach, SearchCriteria cri) throws Exception {
		
		Map<String, Object> dataMap = attachService.getAllList(cri);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("pageType", "attach");
		
		return "/admin/log/attLogList";
	}
	
	@RequestMapping("/admin/log/attach/deleteFile")
	public String removeAttach() throws Exception {
		String url = "admin/log/attachRemove_success";
		
		List<AttachVO> deleteAttachList = attachService.getDeleteAttachList();
		for(AttachVO delete : deleteAttachList) {
			String fileName = delete.getAttachFilename();
			File deleteFile = new File(delete.getAttachUploadpath(), fileName);
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		attachService.getDeleteAttachList();
		
		return url;
	}
	
	// 결재파일 로그
	@RequestMapping(value="/admin/log/attach/app/list")
	public String appAttList(Model model, ApprovalAttachVO attach, SearchCriteria cri) throws Exception {
		
		Map<String, Object> dataMap = attachService.getAppList(cri);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("pageType", "app");
		
		return "/admin/log/attAppLogList";
	}
	
	// 업무보고 로그
	@RequestMapping(value="/admin/log/attach/task/list")
	public String taskAttList(Model model, TaskAttachVO attach, SearchCriteria cri) throws Exception {
		
		Map<String, Object> dataMap = attachService.getTaskList(cri);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("pageType", "task");
		
		return "/admin/log/attTaskLogList";
	}
	
	// 클라우드 로그
	@RequestMapping(value="/admin/log/attach/cloud/list")
	public String cloudAttList(Model model, FileVO file, SearchCriteria cri) throws Exception {
		Map<String, Object> dataMap = cloudService.getClougLog(file);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("pageType", "cloud");
		
		return "/admin/log/attCloudLogList";
	}
	
	@RequestMapping("/admin/log/attach/cloud/deleteFile")
	public String removeCloudFile() throws Exception {
		List<FileVO> deleteCloudList = cloudService.getDeleteAttachList();
		for(FileVO delete : deleteCloudList) {
			String fileName = delete.getCloudFilename();
			File deleteFile = new File(delete.getCloudUploadpath(), fileName);
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		cloudService.getDeleteAttachList();
		
		return "/admin/log/removeCloud_success";
	}
	
	
	
	
	
	
	
}