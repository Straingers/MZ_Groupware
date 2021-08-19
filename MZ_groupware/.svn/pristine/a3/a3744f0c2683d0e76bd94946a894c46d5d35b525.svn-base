package com.spring.task.controller;

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

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskReplyVO;
import com.spring.task.dto.TaskReportVO;
import com.spring.task.service.TaskReplyService;
import com.spring.task.service.TaskService;

@RestController
public class TaskReplyController {
	
	private final TaskReplyService taskReplyService;
	private final TaskService taskService;

	@Autowired
	public TaskReplyController(TaskReplyService taskReplyService, TaskService taskService) {
		this.taskReplyService = taskReplyService;
		this.taskService = taskService;
	}
	
	
	
	@RequestMapping(value="/task/reply/{taskNo}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("taskNo") int taskNo,
														 @PathVariable("page") int page) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			TaskReplyVO reply = new TaskReplyVO();
			reply.setTaskNo(taskNo);
			
			Map<String, Object> dataMap = taskReplyService.getReplyListByTno(taskNo, cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/task/reply", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody TaskReplyVO taskReplyVO) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			taskReplyService.regist(taskReplyVO);
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = taskReplyService.getReplyListByTno(taskReplyVO.getTaskNo(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			
			Map<String, Object> map = taskService.getTaskReport(taskReplyVO.getTaskNo());
			TaskReportVO task = (TaskReportVO) map.get("task");
			entity = new ResponseEntity<String>("SUCCESS," + realEndPage + "," + task.getEmpNo() + "," + task.getTaskTitle(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/task/reply/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("rno") int rno, @RequestBody TaskReplyVO taskReplyVO) throws Exception {
		ResponseEntity<String> entity = null;
		
		taskReplyVO.setRno(rno);
		
		try {
			taskReplyService.modify(taskReplyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/task/reply/{taskNo}/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("taskNo") int taskNo,
										 @PathVariable("rno") int rno,
										 TaskReplyVO taskReplyVO) throws Exception {
		ResponseEntity<String> entity=null;
		try{
			taskReplyService.delete(taskReplyVO);
			
			SearchCriteria cri = new SearchCriteria();
			TaskReplyVO reply = new TaskReplyVO();
			reply.setTaskNo(taskNo);
			reply.setRno(rno);
			
			entity=new ResponseEntity<String>("",HttpStatus.OK);
			
		}catch(SQLException e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
}
