package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.cloud.dto.FileVO;
import com.spring.cloud.service.CloudService;
import com.spring.command.NoticeBoardModifyCommand;
import com.spring.command.NoticeBoardRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.EmployeeVO;
import com.spring.dto.NoticeBoardVO;
import com.spring.service.NoticeBoardService;
import com.spring.utils.GetAttachesAsMultipartFiles;


@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService service;
	@Autowired
	private CloudService cloudService;
	
	@Resource(name = "attachUploadPath")
	private String attachUploadPath;
	
	
	// 관리자 check
	@RequestMapping(value = "board/adminCheck")
	public ResponseEntity<Integer> list(HttpServletRequest request) throws Exception {
		ResponseEntity<Integer> entity = null;
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		String empNo = emp.getEmpNo();
		
		try {
			int count = service.adminCheck(empNo);
			
			if(count != 0) {
				entity = new ResponseEntity<Integer>(count,HttpStatus.OK);
			}else {
				entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	// 메인페이지 noticeList 출력
	@RequestMapping("board/notice/popupCount")
	@ResponseBody
	public ResponseEntity<String> popupCount() throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			
			int popCount = service.getPopupCount();
			
			String result = null;
			if (popCount < 2){
				result = "ture";
			}else {
				result = "false";
			}
			
			entity = new ResponseEntity<String>(result ,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	// 메인페이지 noticeList 출력
		@RequestMapping("board/notice/mainNoticeList")
		@ResponseBody
		public ResponseEntity<List<NoticeBoardVO>> reservationlist() throws Exception {
			ResponseEntity<List<NoticeBoardVO>> entity = null;
			
			try {
				
				List<NoticeBoardVO> noticeBoardList = service.getNoticeList();
				
				entity = new ResponseEntity<List<NoticeBoardVO>>(noticeBoardList,HttpStatus.OK);
				
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<NoticeBoardVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			return entity;
		}
	
	
	// 전체 목록 조회
	@RequestMapping("board/notice/list")
	public ModelAndView anonyList(HttpServletRequest request, SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "notice/list";
		
		Map<String, Object> dataMap = service.getNoticeList(cri);
		
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 등록 폼 
	@RequestMapping("board/notice/registForm")
	public String anonyRegistForm(){
		String url="notice/regist";		
		return url;
	}
	
	// 등록 처리 
	@RequestMapping("notice/regist")
	public String regist(NoticeBoardRegistCommand registReq, HttpServletRequest request, Model model, String cloudNoStr) throws Exception {
		String url = "notice/regist_success";
		
		NoticeBoardVO noticeBoard = registReq.toNoticeBoardVO();
		
		//사번으로 관리자 id 찾기
		String empNo = registReq.getEmpNo();
		String adminId = service.selectSearchAdminId(empNo);
		noticeBoard.setAdminId(adminId);
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if(cloudNoStr != null && !cloudNoStr.trim().equals("")) {
			System.out.println(cloudNoStr);
			if(cloudNoStr.indexOf(",") != -1) {
				String[] cloudNoList = cloudNoStr.split(",");
				for(int i=0; cloudNoList.length>i; i++) {
					FileVO file = cloudService.getFile(Integer.parseInt(cloudNoList[i]));
					AttachVO attach = new AttachVO();
					attach.setAttachAttacher(empNo);
					attach.setAttachFilename(file.getCloudFilename());
					attach.setAttachUploadpath(file.getCloudUploadpath());
					attachList.add(attach);
				}
			} else {
				FileVO file = cloudService.getFile(Integer.parseInt(cloudNoStr));
				AttachVO attach = new AttachVO();
				attach.setAttachAttacher(empNo);
				attach.setAttachFilename(file.getCloudFilename());
				attach.setAttachFiletype(file.getCloudFilename().substring(file.getCloudFilename().lastIndexOf('.') + 1).toUpperCase());
				attach.setAttachUploadpath(file.getCloudUploadpath());
				attachList.add(attach);
			}
		}else {
//			attachList = GetAttachesAsMultipartFiles.save(office.getUploadFile(), officeRulesAttachUploadPath);
			attachList = GetAttachesAsMultipartFiles.save(registReq.getUploadFile(), attachUploadPath);
		}
		
		noticeBoard.setNoticeTitle(((String)request.getAttribute("XSSnoticeTitle")));
		noticeBoard.setAttachList(attachList);
		
		service.noticeRegist(noticeBoard);
		
		model.addAttribute("noticeNo", noticeBoard.getNoticeNo());
		model.addAttribute("noticeTitle", noticeBoard.getNoticeTitle());
		
		return url;
	}
	
	// 상세 조회
	@RequestMapping("board/notice/detail")
	public ModelAndView noticeDetail(ModelAndView mnv, int noticeNo, String from) throws Exception {
		String url = "notice/detail";
		
		NoticeBoardVO noticeBoard = null;
		if(from != null && from.equals("modify")) {
			noticeBoard = service.getNoticeBoard(noticeNo);
		} else {
			noticeBoard = service.read(noticeNo);
		}
		
		// 파일명 재정의
		List<AttachVO> attachList = noticeBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("noticeBoard", noticeBoard);
		mnv.setViewName(url);
		
		return mnv;
	}

	// 팝업용 
	@RequestMapping("board/notice/popup")
	public ModelAndView noticePopup(ModelAndView mnv, int noticeNo, String from) throws Exception {
		String url = "notice/popup";
		
		NoticeBoardVO noticeBoard = null;
		if(from != null && from.equals("modify")) {
			noticeBoard = service.getNoticeBoard(noticeNo);
		} else {
			noticeBoard = service.read(noticeNo);
		}
		
		// 파일명 재정의
		List<AttachVO> attachList = noticeBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("noticeBoard", noticeBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 폼
	@RequestMapping("board/notice/modifyForm")
	public ModelAndView anonyModifyForm(ModelAndView mnv, int noticeNo) throws Exception {
		String url = "notice/modify";
		
		NoticeBoardVO noticeBoard = service.getNoticeBoard(noticeNo);
		
		// 파일명 재정의
		List<AttachVO> attachList = noticeBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("noticeBoard", noticeBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 처리
		@RequestMapping("board/notice/modify")
		public ModelAndView modifyPOST(NoticeBoardModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv) throws Exception {
			String url = "notice/modify_success";
			// 삭제된 파일 삭제
			if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
				for(int attachNo : modifyReq.getDeleteFile()) {
					String fileName = service.getAttachByAttachNo(attachNo).getAttachFilename();
					File deleteFile = new File(attachUploadPath, fileName);
					service.removeAttachByAttachNo(attachNo); // DB 삭제
					if(deleteFile.exists()) {
						deleteFile.delete(); // File 삭제
					}
				}
			}
			
			// 추가 혹은 변경된 파일 저장
			List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), attachUploadPath);
			
			NoticeBoardVO noticeBoard = modifyReq.toNoticeBoardVO();
			noticeBoard.setAttachList(attachList);
			noticeBoard.setNoticeTitle((String)request.getAttribute("XSSnoticeTitle"));
			
			// DB에 추가
			service.noticeModify(noticeBoard);
			mnv.addObject("noticeBoard",noticeBoard);
			mnv.setViewName(url);
			return mnv;
		}
		
		// 삭제 처리
		@RequestMapping("board/notice/remove")
		public String remove(int noticeNo) throws Exception {
			String url = "notice/remove_success";
			
			List<AttachVO> attachList = service.getNoticeBoard(noticeNo).getAttachList();
			if(attachList != null) {
				for(AttachVO attach : attachList) {
					File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
					if(target.exists()) {
						target.delete();
					}
				}
			}
			service.noticeRemove(noticeNo);
			return url;
		}
	

}
