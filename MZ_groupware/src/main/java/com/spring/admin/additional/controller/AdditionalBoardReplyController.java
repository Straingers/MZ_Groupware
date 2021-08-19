package com.spring.admin.additional.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.admin.additional.dto.AdditionalBoardReplyVO;
import com.spring.admin.additional.service.AdditionalBoardReplyService;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;

@RestController
public class AdditionalBoardReplyController {
	
	@Autowired
	private AdditionalBoardReplyService replyService;
	
	@RequestMapping(value="/admin/{boardCode}/reply/{addNo}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("boardCode") String boardCode,
														 @PathVariable("addNo") int addNo,
														 @PathVariable("page") int page) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			AdditionalBoardReplyVO reply = new AdditionalBoardReplyVO();
			reply.setAddNo(addNo);
			reply.setBoardCode(boardCode);
			Map<String, Object> dataMap = replyService.getReplyListByAddNo(reply, cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/admin/{boardCode}", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@PathVariable("boardCode") String boardCode, @RequestBody AdditionalBoardReplyVO reply) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			replyService.registReply(reply);
			SearchCriteria cri = new SearchCriteria();
			reply.setBoardCode(boardCode);
			Map<String, Object> dataMap = replyService.getReplyListByAddNo(reply, cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			entity = new ResponseEntity<String>("SUCCESS," + realEndPage, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/admin/board/reply/{replyNo}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("replyNo") int replyNo
									   , @RequestBody AdditionalBoardReplyVO reply) throws SQLException {
		ResponseEntity<String> entity = null;
		
		reply.setReplyNo(replyNo);
		try {
			replyService.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/admin/{boardCode}/reply/{addNo}/{replyNo}/{page}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("boardCode") String boardCode,
										 @PathVariable("replyNo") int replyNo,
										 @PathVariable("addNo") int addNo,
										 @PathVariable("page") int page) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			AdditionalBoardReplyVO reply = new AdditionalBoardReplyVO();
			reply.setReplyNo(replyNo);
			replyService.removeReply(reply);
			
			SearchCriteria cri = new SearchCriteria();
			reply.setBoardCode(boardCode);
			Map<String , Object> dataMap = replyService.getReplyListByAddNo(reply, cri);
			
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			
			int realEndPage = pageMaker.getRealEndPage();
			if(page > realEndPage) {
				page = realEndPage;
			}
			entity = new ResponseEntity<String>("" + page, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
