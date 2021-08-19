package com.spring.approval.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.approval.dto.ApprovalAttachVO;
import com.spring.approval.dto.ApprovalDocVO;
import com.spring.approval.dto.ApprovalHistoryVO;
import com.spring.approval.dto.ApprovalVO;
import com.spring.approval.service.ApprovalDocService;
import com.spring.approval.service.ApprovalHistoryService;
import com.spring.approval.service.ApprovalService;
import com.spring.command.ApprovalModifyCommand;
import com.spring.command.ApprovalRegistCommand;
import com.spring.dto.EmployeeVO;
import com.spring.dto.VacationVO;
import com.spring.mypage.dto.ApprovalLinePersonalVO;
import com.spring.mypage.service.ApprovalLineService;
import com.spring.service.EmployeeService;
import com.spring.service.VacationService;
import com.spring.utils.GetApprovalAttachesAsMultipartFiles;


@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	ApprovalHistoryService approvalHistroyService;
	
	@Autowired
	ApprovalLineService approvalLineService;
	
	@Resource(name="attachUploadPath")
	private String attachUploadPath;
	
	private final ApprovalDocService approvalDocService;
	
	@Autowired
	public ApprovalController(ApprovalDocService approvalDocService) {
		this.approvalDocService = approvalDocService;
	}
	
	
	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/main")
	public String main() throws SQLException {
		
		return "approval/main";
	}
	
	@RequestMapping(value="/line/detail",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> approvalLineDetail(@RequestBody ApprovalLinePersonalVO approvalLinePersonalVO, ApprovalDocVO approvalDocVO, Model model) throws Exception {
		Map<String, Object> dataMap = approvalLineService.getLine(approvalLinePersonalVO);
		
		return dataMap;
	}
	
	@RequestMapping("lib/req/list")
	public String reqList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/req_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		approval.setAppStatus("상신");
		approval.setWriter(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "req");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}

	@RequestMapping("lib/rej/list")
	public String rejList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/rej_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		approval.setAppStatus("반려");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getRejApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "rej");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}
	
	@RequestMapping("lib/ing/list")
	public String ingList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/ing_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		approval.setAppStatus("진행중");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getIngApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "ing");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}
	
	@RequestMapping("lib/comp/list")
	public String compList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/comp_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		approval.setAppStatus("결재완료");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getCompApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "comp");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}

	@RequestMapping("lib/temp/list")
	public String tempList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/temp_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		approval.setAppStatus("임시저장");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getTempApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "temp");
		model.addAttribute("pageAppStatus", "approvalStatus");

		return url;
	}
	
	@RequestMapping("lib/ref/list")
	public String refList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/ref_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		approval.setAppStatus("참조");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getRefApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "Ref");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}
	
	@RequestMapping("lib/cir/list")
	public String cirList(Model model, ApprovalVO approval, HttpSession session) throws Exception {
		
		String url = "approval/cir_list";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		approval.setAppStatus("회람");
		approval.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> dataMap = approvalService.getReadApprovalList(approval);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "Read");
		model.addAttribute("pageAppStatus", "approvalStatus");
		
		return url;
	}
	

	@RequestMapping("/registForm")
	public String RegistForm(Model model, ApprovalDocVO approvalDocVO, ApprovalLinePersonalVO approvalLinePersonalVO, HttpSession session) throws Exception {
	
		String url = "approval/regist";
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		approvalLinePersonalVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> lineList = approvalLineService.getLineList(approvalLinePersonalVO);
		Map<String, Object> approvalDocList = approvalDocService.selectApprovalDocList1(approvalDocVO);
		
		model.addAttribute("approvalDocList", approvalDocList.get("approvalDocList"));
		model.addAttribute("lineList", lineList.get("lineList"));
		model.addAttribute("doc", approvalDocService.getApprovalDoc("N01"));
		
		return url;
	}
	
	@RequestMapping("/getDoc")
	public String getDoc(String docId, Model model,ApprovalLinePersonalVO approvalLinePersonalVO, ApprovalDocVO approvalDocVO, HttpSession session) throws Exception {
		String url = "approval/regist";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		approvalLinePersonalVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> lineList = approvalLineService.getLineList(approvalLinePersonalVO);
		Map<String, Object> approvalDocList = approvalDocService.selectApprovalDocList1(approvalDocVO);
		
		model.addAttribute("approvalDocList", approvalDocList.get("approvalDocList"));
		
		ApprovalDocVO doc = approvalDocService.getApprovalDoc(docId);
		
		model.addAttribute("doc", doc);
		model.addAttribute("lineList", lineList.get("lineList"));
		
		return url;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(ApprovalVO approvalVO, ApprovalRegistCommand approvalReq, HttpServletRequest request, Model model) throws Exception {
		String url = "approval/save";
		
		approvalService.removeTempApproval(approvalVO);
		
		ApprovalVO approval = approvalReq.toApprovalVO();
		
		List<ApprovalAttachVO> attachList = GetApprovalAttachesAsMultipartFiles.save(approvalReq.getUploadFile(), attachUploadPath);
		
		approval.setAppTitle((String)request.getAttribute("XSSappTitle"));
		approval.setAttachList(attachList);
		
		approvalService.regist(approval);
		
		model.addAttribute("appTitle", approval.getAppTitle());
		List<ApprovalHistoryVO> historyList = approvalHistroyService.getHistoryListByAppNo(approval.getAppNo());
		String empNo = "";
		for(ApprovalHistoryVO history : historyList) {
			if(history.getAppLevel().equals("1")) {
				empNo = history.getEmpNo();
			}
		}
		model.addAttribute("empNo", empNo);
		model.addAttribute("appNo", approval.getAppNo());
		
		if(approval.getDocId().equals("C01")) {
			VacationVO vaca = new VacationVO();
			vaca.setAppNo(approval.getAppNo());
			vaca.setEmpNo(approval.getEmpNo());
			vaca.setVacStart(approvalReq.getVacaStartDay());
			vaca.setVacEnd(approvalReq.getVacaEndDay());
			vaca.setVacDate(Integer.parseInt(approvalReq.getVacaDay()));
			vaca.setVacDetail(approvalReq.getVacaReason());
			
			vacationService.registVacstion(vaca);
		}
		
		
		return url;
	}
	
	@RequestMapping(value="/sign",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> sign(@RequestBody Map<String, Object> dataMap, HttpSession session) throws Exception {
		
		String appNo = String.valueOf(dataMap.get("appNo"));
		String empNo = String.valueOf(dataMap.get("empNo"));
		String flag = String.valueOf(dataMap.get("flag"));
		String firstEmpNo = String.valueOf(dataMap.get("firstEmpNo"));
		
		if (flag.equals("Y")) {
			ApprovalVO approval = new ApprovalVO();
			approval.setAppNo(Integer.parseInt(appNo));
			approval.setEmpNo(empNo);
			approval.setAppStatus("결재완료");
			
			approvalService.modifyAppStatusByAppNo(approval);
		}
		if (flag.equals("X")) {
			
			ApprovalHistoryVO approvalHistoryVO = new ApprovalHistoryVO();
			
			approvalHistoryVO.setEmpNo(firstEmpNo);
			approvalHistoryVO.setAppNo(Integer.parseInt(appNo));
			
			approvalHistroyService.updateSignStatusToX(approvalHistoryVO);
			
			approvalHistoryVO.setEmpNo(empNo);
			approvalHistroyService.updateSignStatusBySecond(approvalHistoryVO);
		
		}
		

		
		ApprovalHistoryVO approval = new ApprovalHistoryVO();
		approval.setAppNo(Integer.parseInt(appNo));
		approval.setEmpNo(empNo);
//		approval.setEmpNo(loginUser.getEmpNo());
		
//		approvalHistroyService.updateSignStatusByFirst(approval);
//		approvalHistroyService.updateSignStatusBySecond(approval);
//		approvalHistroyService.updateSignStatusByThird(approval);
		
		approvalHistroyService.updateSignStatus(approval);
		
		
		// 휴가문서가 결재 완료시 해당 사용자 연차 차감!
		ApprovalVO tmpApproval = (ApprovalVO) approvalService.getApproval(Integer.parseInt(appNo)).get("approval");
		if(tmpApproval.getDocId().equals("C01") && tmpApproval.getAppStatus().equals("결재완료")) {
			VacationVO vaca = vacationService.getVacationByAppNo(tmpApproval.getAppNo());
			EmployeeVO emp = new EmployeeVO();
			emp.setEmpNo(tmpApproval.getEmpNo());
			emp.setEmpVac(vaca.getVacDate());
			employeeService.minusEmpVac(emp);
		}
		
		return dataMap;
		
	}
	
	@RequestMapping(value="/rejSign",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> rejSign(@RequestBody Map<String, Object> dataMap, HttpSession session) throws Exception {
		
		String appNo = String.valueOf(dataMap.get("appNo"));
		String empNo = String.valueOf(dataMap.get("empNo"));
		String flag = String.valueOf(dataMap.get("flag"));
		
		
		if (flag.equals("R")) {
			
			ApprovalVO approval = new ApprovalVO();
			approval.setAppNo(Integer.parseInt(appNo));
			approval.setEmpNo(empNo);
			approval.setAppStatus("반려");
			
			approvalService.modifyAppStatusByAppNo(approval);
		}
		
		ApprovalHistoryVO approval = new ApprovalHistoryVO();
		approval.setAppNo(Integer.parseInt(appNo));
		approval.setEmpNo(empNo);
		
		approvalHistroyService.updateSignStatusToReject(approval);
		
		return dataMap;
		
	}
	
	@RequestMapping(value="/tempRegist", method=RequestMethod.POST)
	public String tempRegist(ApprovalRegistCommand approvalReq, HttpServletRequest request, HttpSession session) throws Exception {
		
		String url = "approval/save";
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		ApprovalVO approval = approvalReq.toApprovalVO();
		List<ApprovalAttachVO> attachList = GetApprovalAttachesAsMultipartFiles.save(approvalReq.getUploadFile(), attachUploadPath);
		approval.setEmpNo(loginUser.getEmpNo());
		approval.setAttachList(attachList);
		
		approvalService.registTempApproval(approval);
		
		return url;
		
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String tempModifyForm(Model model, int appNo, ApprovalVO approval, ApprovalLinePersonalVO approvalLinePersonalVO, HttpSession session) throws SQLException {

		String url = "approval/modify";
		
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		approvalLinePersonalVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> lineList = approvalLineService.getLineList(approvalLinePersonalVO);
		Map<String, Object> approvalDocList = approvalDocService.selectApprovalDocList(approval);
		
		Map<String, Object> dataMap = approvalService.getTempApproval(approval);
		ApprovalVO app = (ApprovalVO) dataMap.get("app");
		
		List<ApprovalAttachVO> attachList = app.getAttachList();
		if (attachList != null) {
			for (ApprovalAttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		model.addAttribute("approval", dataMap.get("app"));
		model.addAttribute("lineList", lineList.get("lineList"));
		model.addAttribute("approvalDocList", approvalDocList.get("approvalDocList"));
		model.addAttribute("doc", approvalDocService.getApprovalDoc("N01"));
		
		return url;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String tempModify(ApprovalModifyCommand modifyReq, HttpServletRequest request, HttpSession session) throws Exception {
		
		String url = "approval/save";
		
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (int attachNo : modifyReq.getDeleteFile()) {
				String fileName = approvalService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(attachUploadPath, fileName);
				
				approvalService.removeAttachByAttachNo(attachNo);
				
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}
		}
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		ApprovalVO approval = modifyReq.toApprovalVO();
		List<ApprovalAttachVO> attachList = GetApprovalAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), attachUploadPath);
		approval.setEmpNo(loginUser.getEmpNo());
		approval.setAttachList(attachList);
		
		approvalService.modifyTempApproval(approval);
		
		return url;
	}
	
	@RequestMapping(value="/tempRemove",method=RequestMethod.POST)
	public String tempRemove(ApprovalVO approval) throws Exception {
		
		String url = "approval/remove";
		
		approvalService.removeTempApproval(approval);
		
		return url;
	}
	
	@RequestMapping("/lib/req/detail")
	public String reqDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/ing/detail")
	public String ingDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/comp/detail")
	public String compDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/comp_detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/ref/detail")
	public String refDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/cir/detail")
	public String cirDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/rej/detail")
	public String rejDetail(int appNo, Model model, ApprovalVO approvalVO) throws Exception {
		
		String url = "approval/reject_detail";
		
		Map<String, Object> dataMap = approvalService.getApproval(appNo);
		
		ApprovalVO approval = (ApprovalVO) dataMap.get("approval");
		
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
		
		return url;
	}
	
	@RequestMapping("/lib/req/modifyForm")
	public ModelAndView modifyForm(int appNo, ModelAndView mnv) throws Exception {
		
		String url = "approval/req/modify";
		
		ApprovalVO approval = approvalService.getApprovalForModify(appNo);
		
		List<ApprovalAttachVO> attachList = approval.getAttachList();
		if (attachList != null) {
			for (ApprovalAttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("approval", approval);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/lib/req/modify",method=RequestMethod.POST)
	public ModelAndView modifyPost(ApprovalModifyCommand modifyReq, ModelAndView mnv, HttpServletRequest request) throws Exception {
			
		String url = "approval/req/modify_success";
		
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (int  attachNo : modifyReq.getDeleteFile()) {
				String fileName = approvalService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(attachUploadPath, fileName);
				
				approvalService.removeAttachByAttachNo(attachNo);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}
		}
		
		List<ApprovalAttachVO> attachList = GetApprovalAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), attachUploadPath);
		
		ApprovalVO approval = modifyReq.toApprovalVO();
		approval.setAttachList(attachList);
		approval.setAppTitle((String)request.getAttribute("XSSappTitle"));
		
		approvalService.modify(approval);
		mnv.addObject("approval", approval);
		mnv.setViewName(url);
		
		return mnv;
	}

	
	@RequestMapping("/lib/req/getFile")
	public String getFile(int attachNo, Model model) throws Exception {
		
		String url = "downloadFile";
		
		ApprovalAttachVO attach = approvalService.getAttachByAttachNo(attachNo);
		
		model.addAttribute("savePath", attach.getAttachUploadpath());
		model.addAttribute("fileName", attach.getAttachFilename());
		
		return url;
	}
}
