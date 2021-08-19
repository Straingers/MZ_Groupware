package com.spring.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.command.ReservationRegistCommand;
import com.spring.dto.EmployeeVO;
import com.spring.dto.ReservationVO;
import com.spring.service.ReservationService;


@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	// main화면 출력
	@RequestMapping("office/reserv/main")
	public String mainList() throws SQLException{
		String url = "reservation/main";
		
		return url;
	}
	
	// list 출력
	@RequestMapping("office/reserv/list")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> reservationlist(@RequestBody Map<String, Object> map) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		

		String resDate = String.valueOf(map.get("resDate"));
		String roomNo = String.valueOf(map.get("roomNo"));
		
		ReservationVO reservation = new ReservationVO();
		reservation.setResDate(resDate);
		reservation.setRoomNo(Integer.parseInt(roomNo));
		
		try {
			
			Map<String, Object> dataMap = service.getReservationList(reservation);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	// 등록
		@RequestMapping("office/reserv/regist")
		@ResponseBody
		public ResponseEntity<String> regist(@RequestBody ReservationRegistCommand registCommand, HttpServletRequest request) throws Exception {
			ResponseEntity<String> entity = null;
			
			ReservationVO reservationVO = registCommand.toReservationVO();
			
			HttpSession session = request.getSession();
			EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
			
			String empNo = emp.getEmpNo();
			
			reservationVO.setEmpNo(empNo);
			
			
			try {
				service.reservationRegist(reservationVO);
				
				entity = new ResponseEntity<String>(HttpStatus.OK);
				
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
	
	// 삭제
	@RequestMapping("office/reserv/remove")
	@ResponseBody
	public ResponseEntity<String> remove(@RequestBody ReservationVO reservationVO) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			service.reservationRemove(reservationVO);;
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
}
