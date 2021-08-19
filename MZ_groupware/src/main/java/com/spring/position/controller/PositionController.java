package com.spring.position.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.position.service.PositionService;

@Controller
public class PositionController {
	private final PositionService positionService;

	@Autowired
	public PositionController(PositionService positionService) {
		this.positionService = positionService;
	}
	
	@RequestMapping("admin/comp/group/dept/modifyPositionN")
	@ResponseBody
	public ResponseEntity<String> modifyPositionN(String psCode) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			positionService.modifyPositionN(psCode);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("admin/comp/group/dept/modifyPositionY")
	@ResponseBody
	public ResponseEntity<String> modifyPositionY(String psCode) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			positionService.modifyPositionY(psCode);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
