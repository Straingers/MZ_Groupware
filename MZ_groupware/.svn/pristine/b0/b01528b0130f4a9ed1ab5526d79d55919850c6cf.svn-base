package com.spring.member.history.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.SearchCriteria;
import com.spring.member.history.service.TransferHistoryService;

@Controller
public class TransferHistoryController {
	private final TransferHistoryService transferHistoryService;
	
	@Autowired
	public TransferHistoryController(TransferHistoryService transferHistoryService) {
		this.transferHistoryService = transferHistoryService;
	}
	
	// 인사 변경 현황 히스토리 목록 조회 + 검색, 페이징 기능 추가
	@RequestMapping("admin/comp/member/history/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "admin/comp/member/history/list";
		
		Map<String, Object> dataMap = transferHistoryService.getTransferHistoryList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
}
