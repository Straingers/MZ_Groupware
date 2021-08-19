package com.spring.ot.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.EmployeeVO;
import com.spring.ot.dto.OtVO;
import com.spring.ot.service.OtService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("office/ot")
public class OtController {
	
	@Autowired
	private OtService otService;
	
	@Resource(name="otAttachUploadPath")
	private String otAttachUploadPath;
	
	@RequestMapping("/list")
	public String list(SearchCriteria cri, Model model) throws Exception{
		
		Map<String, Object> dataMap = otService.getOtList(cri);
		model.addAttribute("dataMap", dataMap);
		
		return "otBoard/list";
	}
	
	@RequestMapping("/detail")
	public String detail(int otNo, Model model) throws Exception{
		OtVO ot = otService.getOt(otNo);
		// 파일명 재정의
		List<AttachVO> attachList = ot.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setUuidName(attach.getAttachFilename());
				attach.setAttachFilename(fileName);
			}
			ot.setAttachList(attachList);
		}
		model.addAttribute("ot", ot);
		return "otBoard/detail";
	}
	
	@RequestMapping("/registForm")
	public String registForm(HttpSession session, Model model) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		model.addAttribute("emp", emp);
		return "otBoard/regist";
	}

	@RequestMapping("/regist")
	public String regist(OtVO ot, HttpSession session) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		ot.setAdminEmpNo(loginUser.getEmpNo());
		
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(ot.getUploadFile(), otAttachUploadPath);
		ot.setAttachList(attachList);
		
		otService.regist(ot);
		
		return "otBoard/regist_success";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(int otNo, Model model) throws Exception{
		OtVO ot = otService.getOt(otNo);
		// 파일명 재정의
		List<AttachVO> attachList = ot.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		model.addAttribute("ot", ot);
		return "otBoard/modify";
	}
	
	@RequestMapping("/modify")
	public String modify(OtVO ot, HttpServletRequest request, HttpSession session) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		ot.setAdminEmpNo(emp.getEmpNo());
		// 삭제된 파일 삭제
		if(ot.getDeleteFile() != null && ot.getDeleteFile().length > 0) {
			for(int attachNo : ot.getDeleteFile()) {
				String fileName = otService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(otAttachUploadPath, fileName);
				otService.removeAttachByAttachNo(attachNo); // DB 삭제
				if(deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
			}
		}
		
		// 추가 혹은 변경된 파일 저장
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(ot.getUploadFile(), otAttachUploadPath);
		
		ot.setAttachList(attachList);
		ot.setOtTitle((String)request.getAttribute("XSSotTitle"));
		
		otService.modify(ot);
		return "otBoard/modify_success";
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public void remove(int otNo) throws Exception{
		List<AttachVO> attachList = otService.getOt(otNo).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		otService.remove(otNo);
	}
	
	@RequestMapping("/getFiles")
	public String getFile(int attachNo, Model model) throws Exception {
		String url = "downloadFile";
		AttachVO attach = otService.getAttachByAttachNo(attachNo);
		
		model.addAttribute("savePath", attach.getAttachUploadpath());
		model.addAttribute("fileName", attach.getAttachFilename());
		
		return url;
	}
}
