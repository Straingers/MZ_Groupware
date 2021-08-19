package com.spring.admin.additional.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.additional.dto.AdditionalTypeVO;
import com.spring.admin.additional.service.AdditionalTypeService;

@Controller
@RequestMapping("/admin")
public class AdditionalTypeController {

	@Autowired
	AdditionalTypeService additionalTypeService;

	@RequestMapping("/board/list")
	public String main(Model model) throws Exception {
		String url = "admin/board/boardList";
		
		List<AdditionalTypeVO> boardList = additionalTypeService.getAdditionalBoardList();
		model.addAttribute("boardList", boardList);
		
		return url;
	}
	
	@RequestMapping("/board/getBoard")
	@ResponseBody
	public Map<String, Object> getBoard(@RequestBody Map<String, Object> map) throws Exception {
		AdditionalTypeVO board = additionalTypeService.getBoard(String.valueOf(map.get("boardCode")));
		map.put("board", board);
		return map;
	}
	
	@RequestMapping("/board/regist")
	public String regist(AdditionalTypeVO additionalType) throws Exception {
		String url = "admin/board/regist_success";
		additionalTypeService.reigstBoard(additionalType);
		return url;
	}
	
	@RequestMapping("/board/modify")
	public String modify(AdditionalTypeVO additionalType) throws Exception {
		String url = "admin/board/modify_success";
		additionalTypeService.modifyBoard(additionalType);
		return url;
	}
	
	@RequestMapping("/board/remove")
	public String remove(AdditionalTypeVO additionalType) throws Exception {
		String url = "admin/board/remove_success";
		additionalTypeService.removeBoard(additionalType);
		return url;
	}
	
}
