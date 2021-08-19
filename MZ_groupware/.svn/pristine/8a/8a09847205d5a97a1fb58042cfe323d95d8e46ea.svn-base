package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.CommunityBoardModifyCommand;
import com.spring.command.CommunityBoardRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.CommunityBoardVO;
import com.spring.service.CommunityBoardService;
import com.spring.utils.GetAttachesAsMultipartFiles;


@Controller
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService service;
	
	@Resource(name = "attachUploadPath")
	private String attachUploadPath;
	
	
	///////////////////////////////////////////////////// Q&A 게시판
	// 전체 목록 조회
	@RequestMapping("board/qna/list")
	public ModelAndView qnaList(SearchCriteria cri, ModelAndView mnv) throws SQLException{
	String url = "board/qna/list";
	
	Map<String, Object> dataMap = service.getQnaList(cri);
	mnv.addObject("dataMap", dataMap);
	mnv.setViewName(url);
	return mnv;
	}
	
	// 등록 폼 
	@RequestMapping("board/qna/registForm")
	public String qnaRegistForm(){
	String url="board/qna/regist";		
	return url;
	}
	
	// 상세 조회
	@RequestMapping("board/qna/detail")
	public ModelAndView qnaDetail(ModelAndView mnv, int commNo, String from) throws Exception {
	String url = "board/qna/detail";
	
	CommunityBoardVO communityBoard = null;
	if(from != null && from.equals("modify")) {
	communityBoard = service.getCommunityBoard(commNo);
	} else {
	communityBoard = service.read(commNo);
	}
	
	// 파일명 재정의
	List<AttachVO> attachList = communityBoard.getAttachList();
	if(attachList != null) {
	for(AttachVO attach : attachList) {
	String fileName = attach.getAttachFilename().split("\\$\\$")[1];
	/* 파일 '...' 치환 코드
	if(fileName.length() > 5) {
	StringBuffer sb = new StringBuffer();
	
	sb.append(fileName);
	sb.replace(10, fileName.length(), "...");
	fileName = sb.toString();
	}
	*/
	attach.setAttachFilename(fileName);
	}
	}
	
	mnv.addObject("communityBoard", communityBoard);
	mnv.setViewName(url);
	
	return mnv;
	}
	
	// 수정 폼
	@RequestMapping("board/qna/modifyForm")
	public ModelAndView qnaModifyForm(ModelAndView mnv, int commNo) throws Exception {
	String url = "board/qna/modify";
	
	CommunityBoardVO communityBoard = service.getCommunityBoard(commNo);
	
	// 파일명 재정의
	List<AttachVO> attachList = communityBoard.getAttachList();
	if(attachList != null) {
	for(AttachVO attach : attachList) {
	String fileName = attach.getAttachFilename().split("\\$\\$")[1];
	attach.setAttachFilename(fileName);
	}
	}
	
	mnv.addObject("communityBoard", communityBoard);
	mnv.setViewName(url);
	
	return mnv;
	}
	
	////////////////////////////////////////////////////////////////////Q&A 게시판 끝
	
	
	
	/////////////////////////////////////////////////////사내 익명 게시판
	// 전체 목록 조회
	@RequestMapping("board/anony/list")
	public ModelAndView anonyList(HttpServletRequest request, SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "board/anony/list";
		
		Map<String, Object> dataMap = service.getAnonyList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 등록 폼 
	@RequestMapping("board/anony/registForm")
	public String anonyRegistForm(){
		String url="board/anony/regist";		
		return url;
	}
	
	// 상세 조회
	@RequestMapping("board/anony/detail")
	public ModelAndView anonyDetail(ModelAndView mnv, int commNo, String from) throws Exception {
		String url = "board/anony/detail";
		
		CommunityBoardVO communityBoard = null;
		if(from != null && from.equals("modify")) {
			communityBoard = service.getCommunityBoard(commNo);
		} else {
			communityBoard = service.read(commNo);
		}
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				/* 파일 '...' 치환 코드
				if(fileName.length() > 5) {
					StringBuffer sb = new StringBuffer();
					
					sb.append(fileName);
					sb.replace(10, fileName.length(), "...");
					fileName = sb.toString();
				}
				*/
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 폼
	@RequestMapping("board/anony/modifyForm")
	public ModelAndView anonyModifyForm(ModelAndView mnv, int commNo) throws Exception {
		String url = "board/anony/modify";
		
		CommunityBoardVO communityBoard = service.getCommunityBoard(commNo);
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	////////////////////////////////////////////////////////////////////사내 익명 게시판 끝
	
	
	
	/////////////////////////////////////////////////////////////////// 동호회
	// 전체 목록 조회
	@RequestMapping("board/club/list")
	public ModelAndView clubList(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "board/club/list";
	      
		Map<String, Object> dataMap = service.getClubList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
  
		return mnv;
	}
	
	// 등록 폼
	@RequestMapping("board/club/registForm")
	public String clubRegistForm(){
		String url="board/club/regist";		
		return url;
	}
	
	// 상세 조회
	@RequestMapping("board/club/detail")
	public ModelAndView clubDetail(ModelAndView mnv, int commNo, String from) throws Exception {
		String url = "board/club/detail";
		
		CommunityBoardVO communityBoard = null;
		if(from != null && from.equals("modify")) {
			communityBoard = service.getCommunityBoard(commNo);
		} else {
			communityBoard = service.read(commNo);
		}
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 폼
	@RequestMapping("board/club/modifyForm")
	public ModelAndView clubModifyForm(ModelAndView mnv, int commNo) throws Exception {
		String url = "board/club/modify";
		
		CommunityBoardVO communityBoard = service.getCommunityBoard(commNo);
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	/////////////////////////////////////////////////////////////////// 동호회 끝
	
	/////////////////////////////////////////////////////////////////// 경조사
	// 전체 목록 조회
	@RequestMapping("board/cnc/list")
	public ModelAndView cncList(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "board/cnc/list";
	      
		Map<String, Object> dataMap = service.getCncList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
  
		return mnv;
	}
	
	// 등록 폼
	@RequestMapping("board/cnc/registForm")
	public String cncRegistForm(){
		String url="board/cnc/regist";		
		return url;
	}
	
	// 상세 조회
	@RequestMapping("board/cnc/detail")
	public ModelAndView cncDetail(ModelAndView mnv, int commNo, String from) throws Exception {
		String url = "board/cnc/detail";
		
		CommunityBoardVO communityBoard = null;
		if(from != null && from.equals("modify")) {
			communityBoard = service.getCommunityBoard(commNo);
		} else {
			communityBoard = service.read(commNo);
		}
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 폼
	@RequestMapping("board/cnc/modifyForm")
	public ModelAndView cncModifyForm(ModelAndView mnv, int commNo) throws Exception {
		String url = "board/cnc/modify";
		
		CommunityBoardVO communityBoard = service.getCommunityBoard(commNo);
		
		// 파일명 재정의
		List<AttachVO> attachList = communityBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		
		mnv.addObject("communityBoard", communityBoard);
		mnv.setViewName(url);
		
		return mnv;
	}
	
/////////////////////////////////////////////////////////////////// 경조사 끝
	
	///////////////////////////////////////////////////////////////공통
	// [공통] 등록 처리 
	@RequestMapping("board/regist")
	public String regist(CommunityBoardRegistCommand registReq, HttpServletRequest request) throws Exception {
		String url = "board/regist_success";
		
		CommunityBoardVO communityBoard = registReq.toCommunityBoardVO();
		
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(registReq.getUploadFile(), attachUploadPath);
		communityBoard.setCommTitle((String)request.getAttribute("XSScommTitle"));
		communityBoard.setAttachList(attachList);
		
		service.regist(communityBoard);
		
		return url;
	}
	
	// [공통] 파일 조회 처리
	@RequestMapping("board/getFiles")
	public String getFile(int attachNo, Model model) throws Exception {
		String url = "downloadFile";
		
		AttachVO attach = service.getAttachByAttachNo(attachNo);
		
		model.addAttribute("savePath", attach.getAttachUploadpath());
		model.addAttribute("fileName", attach.getAttachFilename());
		
		return url;
	}
	
	// [공통] 수정 처리
	@RequestMapping("board/modify")
	public ModelAndView modifyPOST(CommunityBoardModifyCommand modifyReq, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "board/modify_success";
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
		
		CommunityBoardVO communityBoard = modifyReq.toCommunityBoardVO();
		communityBoard.setAttachList(attachList);
		communityBoard.setCommTitle((String)request.getAttribute("XSScommTitle"));
		
		// DB에 추가
		service.modify(communityBoard);
		mnv.addObject("communityBoard",communityBoard);
		mnv.setViewName(url);
		return mnv;
	}
	
	// [공통] 삭제 처리
	@RequestMapping("board/remove")
	public String remove(int commNo) throws Exception {
		String url = "board/remove_success";
		
		List<AttachVO> attachList = service.getCommunityBoard(commNo).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		service.remove(commNo);
		return url;
	}
}
