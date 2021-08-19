package com.spring.pds.controller;

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

import com.spring.dto.AttachVO;
import com.spring.dto.EmployeeVO;
import com.spring.pds.dto.PdsVO;
import com.spring.pds.service.PdsService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("office/pds")
public class PdsController {
	
	@Autowired
	private PdsService pdsService;
	
	@Resource(name="pdsAttachUploadPath")
	private String pdsAttachUploadPath;
	
	@RequestMapping("/list")
	public String list(PdsVO pds, Model model) throws Exception{
		
		Map<String, Object> dataMap = pdsService.getPdsList(pds);
		model.addAttribute("dataMap", dataMap);
		
		return "pdsBoard/list";
	}
	
	@RequestMapping("/detail")
	public String detail(int pdsNo, Model model) throws Exception{
		PdsVO pds = pdsService.getPds(pdsNo);
		// 파일명 재정의
		List<AttachVO> attachList = pds.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setUuidName(attach.getAttachFilename());
				attach.setAttachFilename(fileName);
			}
			pds.setAttachList(attachList);
		}
		model.addAttribute("pds", pds);
		return "pdsBoard/detail";
	}
	
	@RequestMapping("/registForm")
	public String registForm(HttpSession session, Model model) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		model.addAttribute("emp", emp);
		return "pdsBoard/regist";
	}

	@RequestMapping("/regist")
	public String regist(PdsVO pds, HttpSession session) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		pds.setEmpNo(loginUser.getEmpNo());
		
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(pds.getUploadFile(), pdsAttachUploadPath);
		pds.setAttachList(attachList);
		
		pdsService.regist(pds);
		
		return "pdsBoard/regist_success";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(int pdsNo, Model model) throws Exception{
		PdsVO pds = pdsService.getPds(pdsNo);
		// 파일명 재정의
		List<AttachVO> attachList = pds.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		model.addAttribute("pds", pds);
		return "pdsBoard/modify";
	}
	
	@RequestMapping("/modify")
	public String modify(PdsVO pds, HttpServletRequest request, HttpSession session) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		pds.setEmpNo(emp.getEmpNo());
		// 삭제된 파일 삭제
		if(pds.getDeleteFile() != null && pds.getDeleteFile().length > 0) {
			for(int attachNo : pds.getDeleteFile()) {
				String fileName = pdsService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(pdsAttachUploadPath, fileName);
				pdsService.removeAttachByAttachNo(attachNo); // DB 삭제
				if(deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
			}
		}
		
		// 추가 혹은 변경된 파일 저장
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(pds.getUploadFile(), pdsAttachUploadPath);
		
		pds.setAttachList(attachList);
		pds.setTitle((String)request.getAttribute("XSStitle"));
		
		pdsService.modify(pds);
		return "pdsBoard/modify_success";
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public void remove(int pdsNo) throws Exception{
		List<AttachVO> attachList = pdsService.getPds(pdsNo).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		pdsService.remove(pdsNo);
	}
	
	@RequestMapping("/getFiles")
	public String getFile(int attachNo, Model model) throws Exception {
		String url = "downloadFile";
		AttachVO attach = pdsService.getAttachByAttachNo(attachNo);
		
		model.addAttribute("savePath", attach.getAttachUploadpath());
		model.addAttribute("fileName", attach.getAttachFilename());
		
		return url;
	}
}
