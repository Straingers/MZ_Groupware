package com.spring.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.spring.dto.CalendarVO;

public class CalendarRegistCommand {
	
	private int _id;
	private String deptCode;
	private String empNo;
	private String title;
	private String description;
	private String place;
	private String start;
	private String end;
	private String type;
	private String allDay;
	private String backgroundColor;
	
	//main페이지 list 출력용
	private String mainCalStart; // main화면 시작일
	private String mainAllday;
	private String mainTypeColor; // 색상
	private String mainTypeName; // 이름
	
	

	public String getMainTypeName() {
		return mainTypeName;
	}

	public void setMainTypeName(String mainTypeName) {
		this.mainTypeName = mainTypeName;
	}

	public String getMainTypeColor() {
		return mainTypeColor;
	}

	public void setMainTypeColor(String mainTypeColor) {
		this.mainTypeColor = mainTypeColor;
	}

	public String getMainAllday() {
		return mainAllday;
	}

	public void setMainAllday(String mainAllday) {
		this.mainAllday = mainAllday;
	}

	public String getMainCalStart() {
		return mainCalStart;
	}

	public void setMainCalStart(String mainCalStart) {
		this.mainCalStart = mainCalStart;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}


	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public CalendarVO toCalendarVO() throws ParseException {
		String form = null;
		Date start2 = null; 
		Date end2 = null; 
		
		if (this.allDay != null) {
			if(this.allDay.equals("false")) {
				form = this.start;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				start2 = transFormat.parse(form);
				
				form= this.end;
				end2 = transFormat.parse(form);
			}else {
				form = this.start;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				start2 = transFormat.parse(form);
				
				form= this.end;
				end2 = transFormat.parse(form);
			}
		}
		
		CalendarVO calendar = new CalendarVO();
		calendar.setCalNo(this._id);
		calendar.setEmpNo(this.empNo);
		calendar.setTypeCode(this.deptCode);
		calendar.setCalName(this.title);
		calendar.setCalContent(this.description);
		calendar.setCalLocation(this.place);
		calendar.setCalStart(start2);
		calendar.setCalEnd(end2);
		calendar.setCalStatus(this.type);
		calendar.setCalAllDay(this.allDay);
		calendar.setTypeColor(this.backgroundColor);
		
		if ("내 일정".equals(this.type)) {
			calendar.setTypeCode("2");
		}else {
		}
		
		return calendar;
	}

	public CalendarVO toMainCalendarVO() throws ParseException {
		
		CalendarVO calendar = new CalendarVO();
		calendar.setMainCalStart(this.mainCalStart);
		
		return calendar;
	}
}
