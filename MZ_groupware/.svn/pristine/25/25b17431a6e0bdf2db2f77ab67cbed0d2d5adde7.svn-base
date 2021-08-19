package com.spring.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.spring.command.CalendarRegistCommand;

public class CalendarVO {
	
	//고쳐
	private int calNo; // 일정이름
	private String empNo; // 사번
	private String typeCode; // 캘린더코드
	private String calName; // 일정이름
	private String calContent; // 일정내용
	private String calLocation; // 일정장소
	private Date calStart; // 일정시작일
	private Date calEnd; // 일정종료일
	private String calStatus; // 일정상태(type)
	private String calAllDay; // 일정상태(type)
	private String typeColor; // 색상
	
	//main페이지 list 출력용
	private String mainCalStart; // main화면 시작일
	private String typeName; // 색상
	private String mainTypeColor; // 색상

	
	public String getMainTypeColor() {
		return mainTypeColor;
	}

	public void setMainTypeColor(String mainTypeColor) {
		this.mainTypeColor = mainTypeColor;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getMainCalStart() {
		return mainCalStart;
	}

	public void setMainCalStart(String mainCalStart) {
		this.mainCalStart = mainCalStart;
	}

	public String getTypeColor() {
		return typeColor;
	}

	public void setTypeColor(String typeColor) {
		this.typeColor = typeColor;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public String getCalName() {
		return calName;
	}

	public void setCalName(String calName) {
		this.calName = calName;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getCalLocation() {
		return calLocation;
	}

	public void setCalLocation(String calLocation) {
		this.calLocation = calLocation;
	}

	public Date getCalStart() {
		return calStart;
	}

	public void setCalStart(Date calStart) {
		this.calStart = calStart;
	}

	public Date getCalEnd() {
		return calEnd;
	}

	public void setCalEnd(Date calEnd) {
		this.calEnd = calEnd;
	}

	public String getCalStatus() {
		return calStatus;
	}

	public void setCalStatus(String calStatus) {
		this.calStatus = calStatus;
	}

	public String getCalAllDay() {
		return calAllDay;
	}

	public void setCalAllDay(String calAllDay) {
		this.calAllDay = calAllDay;
	}

	public CalendarRegistCommand toCalendarRegistCommand() throws ParseException {
		Date form = null;
		String start2 = null; 
		String end2 = null; 
		
		
		if(this.calAllDay.equals("true")) {
			form = this.calStart;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			start2 = transFormat.format(form);
			
			form = this.calEnd;
			end2 = transFormat.format(form);
		}else {
			form = this.calStart;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			start2 = transFormat.format(form);
			
			form = this.calEnd;
			end2 = transFormat.format(form);
		}
		
		CalendarRegistCommand commandCalendar = new CalendarRegistCommand();
		commandCalendar.set_id(this.calNo);
		commandCalendar.setEmpNo(this.empNo);
		commandCalendar.setDeptCode(this.typeCode);
		commandCalendar.setTitle(this.calName);
		commandCalendar.setDescription(this.calContent);
		commandCalendar.setPlace(this.calLocation);
		commandCalendar.setStart(start2);
		commandCalendar.setEnd(end2);
		commandCalendar.setType(this.calStatus);
		commandCalendar.setAllDay(this.calAllDay);
		commandCalendar.setBackgroundColor(this.typeColor);
		
		return commandCalendar;
	}
	
	public CalendarRegistCommand toMainCalendarRegistCommand() throws ParseException {
		Date form = null;
		String start2 = null; 
		String end2 = null; 
		
		form = this.calStart;
		SimpleDateFormat transFormat = new SimpleDateFormat("MM-dd");
		start2 = transFormat.format(form);
		
		form = this.calEnd;
		end2 = transFormat.format(form);

		CalendarRegistCommand commandCalendar = new CalendarRegistCommand();

		if(start2.equals(end2)) {
			commandCalendar.setMainAllday("Y");
		}
		
		commandCalendar.set_id(this.calNo);
		commandCalendar.setEmpNo(this.empNo);
		commandCalendar.setDeptCode(this.typeCode);
		commandCalendar.setTitle(this.calName);
		commandCalendar.setDescription(this.calContent);
		commandCalendar.setPlace(this.calLocation);
		commandCalendar.setStart(start2);
		commandCalendar.setEnd(end2);
		commandCalendar.setType(this.calStatus);
		commandCalendar.setAllDay(this.calAllDay);
		commandCalendar.setMainTypeColor(this.mainTypeColor);
		commandCalendar.setMainTypeName(this.typeName);
		
		
		return commandCalendar;
	}
	
}
