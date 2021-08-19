package com.spring.admin.additional.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.additional.dto.AdditionalBoardVO;
import com.spring.admin.additional.service.AdditionalBoardService;
import com.spring.admin.additional.service.AdditionalTypeService;
import com.spring.command.SearchCriteria;
import com.spring.dto.AttachVO;
import com.spring.dto.MenuVO;
import com.spring.service.MenuService;
import com.spring.utils.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board/additional")
public class AdditionalBoardController {

	@Autowired
	private AdditionalTypeService additionalTypeService;
	
	@Autowired
	private AdditionalBoardService additionalBoardService;
	
	@Autowired
	private MenuService menuService;
	
	@Resource(name="attachUploadPath")
	private String attachUploadPath;
	
	@RequestMapping("/list")
	public String main(SearchCriteria cri, Model model) throws Exception {
		String url = "admin/board/additionalBoardList";
		
		MenuVO menu = menuService.getMenuByMcode(cri.getTempStr());
		model.addAttribute("menu", menu);
		Map<String, Object> dataMap = additionalBoardService.getAdditionalBoardList(cri);
		model.addAttribute("dataMap", dataMap);
		
		return url;
	}
	
	@RequestMapping("/detail")
	public String detail(AdditionalBoardVO board, Model model, String from) throws Exception {
		String url = "admin/board/boardDetail";
		
		AdditionalBoardVO addBoard = null;
		if(from != null && from.equals("modify")) {
			addBoard = additionalBoardService.getAdditionalBoard(board);
		} else {
			addBoard = additionalBoardService.readBoard(board);
		}
		
		List<AttachVO> attachList = addBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		model.addAttribute("board", addBoard);
		MenuVO menu = menuService.getMenuByMcode(addBoard.getBoardCode());
		model.addAttribute("menu", menu);
		model.addAttribute("addType", additionalTypeService.getBoard(addBoard.getBoardCode()));
		return url;
	}
	
	@RequestMapping("/registForm")
	public String registForm(String boardCode, Model model) throws Exception {
		String url = "admin/board/regist";
		
		MenuVO menu = menuService.getMenuByMcode(boardCode);
		model.addAttribute("menu", menu);
		model.addAttribute("addType", additionalTypeService.getBoard(boardCode));
		
		return url;
	}
	
	@RequestMapping("/regist")
	public String reigst(AdditionalBoardVO board, HttpServletRequest request) throws Exception {
		String url = "admin/board/registBoard_success";
		
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(board.getUploadFile(), attachUploadPath);
		board.setAddTitle((String)request.getAttribute("XSSaddTitle"));
		board.setAttachList(attachList);
		
		additionalBoardService.registBoard(board);
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(Model model, AdditionalBoardVO board) throws Exception {
		String url = "admin/board/modifyBoard";
		
		AdditionalBoardVO addBoard = additionalBoardService.getAdditionalBoard(board);
		
		List<AttachVO> attachList = addBoard.getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getAttachFilename().split("\\$\\$")[1];
				attach.setAttachFilename(fileName);
			}
		}
		model.addAttribute("board", addBoard);
		MenuVO menu = menuService.getMenuByMcode(addBoard.getBoardCode());
		model.addAttribute("menu", menu);
		model.addAttribute("addType", additionalTypeService.getBoard(addBoard.getBoardCode()));
		return url;
	}
	
	@RequestMapping("/modify")
	public String modify(AdditionalBoardVO board, HttpServletRequest request, Model model) throws Exception {
		String url = "admin/board/modifyBoard_success";
		
		if(board.getDeleteFile() != null && board.getDeleteFile().length > 0) {
			for(int attachNo : board.getDeleteFile()) {
				String fileName = additionalBoardService.getAttachByAttachNo(attachNo).getAttachFilename();
				File deleteFile = new File(attachUploadPath, fileName);
				additionalBoardService.removeAttatchByAttachNo(attachNo);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
			}
		}
		List<AttachVO> attachList = GetAttachesAsMultipartFiles.save(board.getUploadFile(), attachUploadPath);
		board.setAttachList(attachList);
		board.setAddTitle((String)request.getAttribute("XSSaddTitle"));
		additionalBoardService.modifyBoard(board);
		model.addAttribute("board", board);
		
		return url;
	}
	
	@RequestMapping("/remove")
	public String remove(AdditionalBoardVO board) throws Exception {
		String url = "admin/board/removeBoard_success";
		
		List<AttachVO> attachList = additionalBoardService.getAdditionalBoard(board).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachUploadpath(), attach.getAttachFilename());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		additionalBoardService.removeBoard(board);
		return url;
	}
}
