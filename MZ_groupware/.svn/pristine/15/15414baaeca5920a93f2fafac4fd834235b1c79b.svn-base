package com.spring.office.controller;

import java.io.File;
import java.util.ArrayList;
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

import com.spring.cloud.dto.FileVO;
import com.spring.cloud.service.CloudService;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.EmployeeVO;
import com.spring.office.dto.OfficeVO;
import com.spring.office.service.OfficeService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("office/rules")
public class OfficeController {
	
	@Autowired
	private OfficeService officeService;
	@Autowired
	private CloudService cloudService;
	
	@Resource(name="officeRulesAttachUploadPath")
	private String officeRulesAttachUploadPath;
	
	@RequestMapping("/list")
	public String list(SearchCriteria cri, Model model) throws Exception{
		
		Map<String, Object> dataMap = officeService.getOfficeList(cri);
		model.addAttribute("dataMap", dataMap);
		
		return "officeBoard/list";
	}
	
	@RequestMapping("/detail")
	public String detail(int officeNo, Model model) throws Exception{
		OfficeVO office = officeService.getOffice(officeNo);
		// 파일명 재정의
		List<AttachVO> attachList = office.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setUuidName(attach.getAttachFilename());
				attach.setAttachFilename(fileName);
			}
			office.setAttachList(attachList);
		}
		model.addAttribute("office", office);
		return "officeBoard/detail";
	}
	
	@RequestMapping("/registForm")
	public String registForm(HttpSession session, Model model) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		model.addAttribute("emp", emp);
		return "officeBoard/regist";
	}

	@RequestMapping("/regist")
	public String regist(OfficeVO office, HttpSession session, String cloudNoStr) throws Exception{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		office.setAdminEmpNo(loginUser.getEmpNo());
		if(cloudNoStr != null && !cloudNoStr.trim().equals("")) {
			System.out.println(cloudNoStr);
			if(cloudNoStr.indexOf(",") != -1) {
				String[] cloudNoList = cloudNoStr.split(",");
				for(int i=0; cloudNoList.length>i; i++) {
					FileVO file = cloudService.getFile(Integer.parseInt(cloudNoList[i]));
					AttachVO attach = new AttachVO();
					attach.setAttachAttacher(loginUser.getEmpNo());
					attach.setAttachFilename(file.getCloudFilename());
					attach.setAttachUploadpath(file.getCloudUploadpath());
					attachList.add(attach);
				}
			} else {
				FileVO file = cloudService.getFile(Integer.parseInt(cloudNoStr));
				AttachVO attach = new AttachVO();
				attach.setAttachAttacher(loginUser.getEmpNo());
				attach.setAttachFilename(file.getCloudFilename());
				attach.setAttachFiletype(file.getCloudFilename().substring(file.getCloudFilename().lastIndexOf('.') + 1).toUpperCase());
				attach.setAttachUploadpath(file.getCloudUploadpath());
				attachList.add(attach);
			}
		}else {
			attachList = GetAttachesAsMultipartFiles.save(office.getUploadFile(), officeRulesAttachUploadPath);
		}
		
		office.setAttachList(attachList);
		
		officeService.regist(office);
		
		return "officeBoard/regist_success";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(int officeNo, Model model) throws Exception{
		OfficeVO office = officeService.getOffice(officeNo);
		// 파일명 재정의
		List<AttachVO> attachList = office.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		model.addAttribute("office", office);
		return "officeBoard/modify";
	}
	
	@RequestMapping("/modify")
	public String modify(OfficeVO office, HttpServletRequest request, HttpSession session) throws Exception{
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		office.setAdminEmpNo(emp.getEmpNo());
		// 삭제된 파일 삭제
		if(office.getDeleteFile() != null && office.getDeleteFile().length > 0) {
			for(int attachNo : office.getDeleteFile()) {
				String fileName = officeService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(officeRulesAttachUploadPath, fileName);
				officeService.removeAttachByAttachNo(attachNo); // DB 삭제
				if(deleteFile.exists()) {
					deleteFile.delete(); // File 삭제
				}
			}
		}
		
		// 추가 혹은 변경된 파일 저장
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(office.getUploadFile(), officeRulesAttachUploadPath);
		
		office.setAttachList(attachList);
		office.setOfficeTitle((String)request.getAttribute("XSSofficeTitle"));
		
		officeService.modify(office);
		return "officeBoard/modify_success";
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public void remove(int officeNo) throws Exception{
		List<AttachVO> attachList = officeService.getOffice(officeNo).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		officeService.remove(officeNo);
	}
	
	@RequestMapping("/getFiles")
	public String getFile(int attachNo, Model model) throws Exception {
		String url = "downloadFile";
		AttachVO attach = officeService.getAttachByAttachNo(attachNo);
		
		model.addAttribute("savePath", attach.getAttachUploadpath());
		model.addAttribute("fileName", attach.getAttachFilename());
		
		return url;
	}
}
