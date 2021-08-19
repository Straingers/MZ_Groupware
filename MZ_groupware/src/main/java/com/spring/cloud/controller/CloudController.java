package com.spring.cloud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cloud.dao.CloudDAO;
import com.spring.cloud.dto.FileVO;
import com.spring.cloud.dto.FolderVO;
import com.spring.cloud.service.CloudService;
import com.spring.cloud.utils.GetCloudAsMultipartFiles;
import com.spring.dto.EmployeeVO;

@Controller
public class CloudController {
	
	@Autowired
	private CloudService cloudService;
	@Autowired
	private CloudDAO cloudDAO;
	
	@RequestMapping("/cloud/main")
	public String main()throws Exception{
		return "cloud/main";
	}
	
	// Folder 리스트 페이지 조회
	@RequestMapping(value="/cloud/folder/list", produces="application/json;charset=utf-8",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> folderList(FolderVO reqfolder, HttpSession session) throws Exception {
//		String url = "cloud/list";
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		reqfolder.setEmpNo(emp.getEmpNo());
		System.out.println(reqfolder.getFlag());
		List<FolderVO> folderList = cloudService.getFolederList(reqfolder);
		
		List < Object > treeList = new ArrayList < Object > ();
	    for(FolderVO folder : folderList) {
	    	Map < String, Object > tree = new HashMap < String, Object > ();
	    	Map < String, Boolean > state = new HashMap < String, Boolean > ();
	    	if(folder.getFolderName().equals("휴지통")) {
	    		tree.put("icon", "fas fa-trash-alt text-success");
	    	} else {
	    		tree.put("icon", "jstree-icon jstree-themeicon fa fa-folder text-warning jstree-themeicon-custom");
	    	}
	    	tree.put("id", String.valueOf(folder.getFolderCode()));
	    	tree.put("parent", folder.getFolderSuper());
	    	tree.put("text", folder.getFolderName());
	    	state.put("opened", true);
	    	state.put("disabled", false);
	    	state.put("selected", false);
	    	tree.put("state", state);
	    	treeList.add(tree);
	    	System.out.println(tree);
	    }

	    Map<String,Object> folderMap = new HashMap<>();
	    folderMap.put("treeList", treeList);
		
		return folderMap;
	}
	
	@RequestMapping("/cloud/folder/registForm")
	public String folderRegistForm() throws Exception{
		return "cloud/folder_regist";
	}
	
	@RequestMapping("/cloud/folder/regist")
	public String folderRegist(FolderVO registFolderData) throws Exception{
		System.out.println("@@@@@@@@");
		FolderVO folder = new FolderVO();
		if(registFolderData.getFolderCode() == "") {
			folder.setFolderSuper("#");
			folder.setFolderLevel(1);
		}else {
			FolderVO upFolder = cloudService.getFolder(registFolderData.getFolderCode());
			int tmpFolderCodeLevel = upFolder.getFolderLevel();
			folder.setFolderSuper(registFolderData.getFolderCode());
			folder.setFolderLevel(tmpFolderCodeLevel+1);
		}
		folder.setFolderName(registFolderData.getFolderName());
		folder.setEmpNo(registFolderData.getEmpNo());
		
		cloudService.makeFolder(folder);
		return "cloud/regist_success";
	}
	
	@RequestMapping(value="/cloud/folder/modifyForm")
	public String folderModifyForm() throws Exception{
		return "cloud/folder_modify";
	}
	@RequestMapping(value="/cloud/folder/modify",method=RequestMethod.POST)
	public String folderModify(FolderVO reqFolder) throws Exception{
		System.out.println(reqFolder.getFolderCode());
		System.out.println(reqFolder.getFolderName());
		cloudService.modifyFolder(reqFolder);
		return "cloud/modify_success";
	}
	
	@RequestMapping(value="/cloud/folder/remove",method=RequestMethod.GET)
	public String folderRemove(String folderCode) throws Exception{
		cloudService.removeFolder(folderCode);
		
		return "cloud/remove_success";
	}
	
	@RequestMapping(value="/cloud/file/remove",method=RequestMethod.GET)
	public String fileRemove(String cloudNoStr) throws Exception{
		String url = "cloud/remove_success";
		if(cloudNoStr != null && cloudNoStr != "") {
			String[] fileCodeList = cloudNoStr.split(",");
			for(int i=0; fileCodeList.length>i; i++) {
				cloudService.removeFile(Integer.parseInt(fileCodeList[i]));
			}
		} else {
			url = "cloud/remove_file_fail";
		}
		
		return url;
	}
	
	@RequestMapping(value="/cloud/trash/remove",method=RequestMethod.GET)
	public String trashRemove(String cloudNoStr) throws Exception{
		String[] cloudNoList = cloudNoStr.split(",");
		for(int i=0; cloudNoList.length>i; i++) {
			cloudService.realRemoveFile(Integer.parseInt(cloudNoList[i]));
		}
		
		return "cloud/remove_success";
	}
	
	@RequestMapping(value="/cloud/file/detail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fileDetail(@RequestBody String cloudNo) throws Exception{
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		if(cloudNo.indexOf(",") != -1) {
			String[] cloudNoList = cloudNo.split(",");
			for(int i=0; cloudNoList.length>i; i++) {
				FileVO file = cloudService.getFile(Integer.parseInt(cloudNoList[i]));
				fileList.add(file);
			}
		} else {
			FileVO file = cloudService.getFile(Integer.parseInt(cloudNo));
			fileList.add(file);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("fileList", fileList);
		return map;
	}

	@RequestMapping("/cloud/file/registForm")
	public String fileRegistForm() throws Exception{
		
		return "cloud/file_regist";
	}
	
	// File리스트 페이지 조회
	@RequestMapping(value="/cloud/file/list", produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> fileList(@RequestBody FileVO file) throws Exception {
		Map <String, Object> fileMap = cloudService.getFileListByFolderCodeAttacher(file);
		return fileMap;
	}
	
	@RequestMapping("/cloud/file/regist")
	public String regist(List<MultipartFile> uploadFile, String cloudFolderCode, HttpSession session)throws Exception{
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		String uploadPath = "";
		
		FolderVO folder = cloudDAO.selectFolderByFolderCode(cloudFolderCode);

		if(cloudFolderCode == "0") {
			uploadPath = "c:/cloud/default";
		} else {
			uploadPath = "c:/cloud/" + emp.getEmpNo() + "/" + folder.getFolderName();
		}
		
		List<FileVO> fileList = GetCloudAsMultipartFiles.save(uploadFile, uploadPath);
		
		for(FileVO tmpfile : fileList) {
			tmpfile.setCloudAttacher(emp.getEmpNo());
			tmpfile.setCloudFolderCode(cloudFolderCode);
			cloudService.uploadFile(tmpfile);
		}
		return "cloud/regist_success";
	}
	@RequestMapping("/cloud/file/trash")
	@ResponseBody
	public Map<String, Object> trashList(@RequestBody FileVO reqfile) throws Exception {
		
		Map <String, Object> fileMap = cloudService.getTrashFileListByAttacher(reqfile);
		return fileMap;
	}
	
	@RequestMapping(value="/cloud/getFiles",method=RequestMethod.GET)
	public String getFile(String cloudNo, Model model) throws Exception {
		String url = "downloadFile";
		
		FileVO file = cloudService.getFile(Integer.parseInt(cloudNo));
		
		model.addAttribute("savePath", file.getCloudUploadpath());
		model.addAttribute("fileName", file.getCloudFilename());
		
		return url;
	}
	
	@RequestMapping("/cloud/board/list")
	public String cloudBoard()throws Exception{
		return "cloud/boardCloudList";
	}
}
