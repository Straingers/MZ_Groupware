package com.spring.controller;

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

import com.spring.command.CommunityReplyModifyCommand;
import com.spring.command.CommunityReplyRegistCommand;
import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityReplyVO;
import com.spring.service.CommunityReplyService;

@RestController
public class CommunityBoardReplyController {
	@Autowired
	private CommunityReplyService service;
	
	@RequestMapping(value="community/{communityCode}/replies/{commNo}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> replyList(@PathVariable("commNo") int commNo,
														@PathVariable("page") int page,
														@PathVariable("communityCode") String communityCode) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			CommunityReplyVO reply = new CommunityReplyVO();
			
			reply.setCommNo(commNo);
			reply.setCommunityCode(communityCode);
			
			Map<String, Object> dataMap = service.getReplyList(reply, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "community/replies", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommunityReplyRegistCommand registReq) throws Exception {
		ResponseEntity<String> entity = null;
		CommunityReplyVO reply = registReq.toReplyVO();
		
		try {
			service.registReply(reply);
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String,Object> dataMap = service.getReplyList(reply, cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			
			entity = new ResponseEntity<String>("SUCCESS,"+realEndPage,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "community/replies/{replyNo}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("replyNo") int replyNo, @RequestBody CommunityReplyModifyCommand modifyReq)
											throws Exception {
		ResponseEntity<String> entity = null;
		
		CommunityReplyVO reply = modifyReq.toReplyVO();
		reply.setReplyNo(replyNo);
		
		try {
			service.modifyReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/community/replies/{commNo}/{replyNo}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo,
										 @PathVariable("commNo") int commNo) throws Exception{
		ResponseEntity<String> entity=null;
		try{
			service.removeReply(replyNo);

			SearchCriteria cri= new SearchCriteria();
			CommunityReplyVO reply = new CommunityReplyVO();
			reply.setReplyNo(replyNo);
			reply.setCommNo(commNo);

//			Map<String,Object> dataMap=service.getReplyList(reply, cri);
//			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");

//			int realEndPage=pageMaker.getRealEndPage();
//			if(page>realEndPage){page=realEndPage;}


			entity=new ResponseEntity<String>("",HttpStatus.OK);
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
}
