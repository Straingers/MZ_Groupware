package com.spring.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.commute.dto.HolidayVO;
import com.spring.admin.commute.service.HolidayService;
import com.spring.command.CalendarRegistCommand;
import com.spring.dto.CalendarVO;
import com.spring.dto.EmployeeVO;
import com.spring.service.CalendarService;

@Controller
@RequestMapping("/cal")
public class CalendarController {
	
	
	@Autowired
	private CalendarService service;
	
	@Autowired
	private HolidayService holidayService;
	
	@RequestMapping(value = "/main")
	public String main() {
		return "calendar/main";
	}
	
	
	@RequestMapping(value = "/main/list")
	@ResponseBody
	public ResponseEntity<List<CalendarRegistCommand>> mainPageList(@RequestBody CalendarRegistCommand calCommand, HttpServletRequest request) throws Exception {
		ResponseEntity<List<CalendarRegistCommand>> entity = null;
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		String empNo = emp.getEmpNo();
		
		CalendarVO calendarvo = calCommand.toMainCalendarVO();
		
		calendarvo.setEmpNo(empNo);
		
		
		HolidayVO holidayVO = new HolidayVO();
		
		holidayVO.setHolidayDate(calendarvo.getMainCalStart());
		
		try {
			List<CalendarVO> calList = service.getMainCalendarList(calendarvo);
			
			List<CalendarRegistCommand> calendarList = new ArrayList<CalendarRegistCommand>();
			
			for(CalendarVO calendar : calList) {
				
				CalendarRegistCommand calReq = calendar.toMainCalendarRegistCommand();
				calendarList.add(calReq);
			}
			

			List<HolidayVO> holidayList = holidayService.getHolidayMainList(holidayVO);
			
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			for(HolidayVO holiday : holidayList) {
				
				CalendarVO holiCal = new CalendarVO();
				
				holiCal.setCalName("사내휴일");
				holiCal.setMainTypeColor("#E2E2E2");
				holiCal.setTypeName("사내일정");
				holiCal.setCalStart(format.parse(holiday.getHolidayDate()));
				holiCal.setCalEnd(format.parse(holiday.getHolidayDate()));
				CalendarRegistCommand calReq = holiCal.toMainCalendarRegistCommand();
				
				calendarList.add(calReq);
			}
			
			entity = new ResponseEntity<List<CalendarRegistCommand>>(calendarList,HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CalendarRegistCommand>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping(value = "/list")
	public ResponseEntity<List<CalendarRegistCommand>> list(HttpServletRequest request) throws Exception {
		ResponseEntity<List<CalendarRegistCommand>> entity = null;
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		String empNo = emp.getEmpNo();
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			List<CalendarVO> calList = service.getCalendarList(empNo);
			
			List<CalendarRegistCommand> calendarList = new ArrayList<CalendarRegistCommand>();
			
			for(CalendarVO calendar : calList) {
				CalendarRegistCommand calReq = calendar.toCalendarRegistCommand();
				calendarList.add(calReq);
			}
			
			entity = new ResponseEntity<List<CalendarRegistCommand>>(calendarList,HttpStatus.OK);

			List<HolidayVO> holidayList = holidayService.getHolidayList();
			
			for(HolidayVO holiday : holidayList) {
				CalendarVO holiCal = new CalendarVO();
				
				holiCal.setCalNo(service.getNextSeq());
				holiCal.setCalName("사내휴일");
				holiCal.setCalContent(holiday.getHolidayName());
				holiCal.setCalStart(format.parse(holiday.getHolidayDate()));
				holiCal.setCalEnd(format.parse(holiday.getHolidayDate()));
				holiCal.setCalAllDay("true");
				holiCal.setTypeCode("1");
				CalendarRegistCommand calReq = holiCal.toCalendarRegistCommand();
				
				calendarList.add(calReq);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CalendarRegistCommand>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	
	@RequestMapping(value = "/regist")
	public ResponseEntity<String> regist(@RequestBody CalendarRegistCommand calCommand) throws Exception {
		ResponseEntity<String> entity = null;
		
		CalendarVO calendar = calCommand.toCalendarVO();
		
		try {
			service.registCalendar(calendar);
			entity = new ResponseEntity<String>("등록성공!", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/update")
	public ResponseEntity<String> update(@RequestBody CalendarRegistCommand calCommand) throws Exception {
		ResponseEntity<String> entity = null;
		
		CalendarVO calendar = calCommand.toCalendarVO();
		
		try {
			service.modifyCalendar(calendar);
			entity = new ResponseEntity<String>("수정성공!", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/updateDate")
	public ResponseEntity<String> updateDate(@RequestBody CalendarRegistCommand calCommand) throws Exception {
		ResponseEntity<String> entity = null;
		
		CalendarVO calendar = calCommand.toCalendarVO();

		try {
			service.modifyCalendarDate(calendar);
			entity = new ResponseEntity<String>("수정성공!", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/delete")
	public ResponseEntity<String> delete(@RequestBody CalendarRegistCommand calCommand) throws Exception {
		ResponseEntity<String> entity = null;
		
		CalendarVO calendar = calCommand.toCalendarVO();

		try {
			service.deleteCalendar(calendar);
			entity = new ResponseEntity<String>("삭제성공!", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}






