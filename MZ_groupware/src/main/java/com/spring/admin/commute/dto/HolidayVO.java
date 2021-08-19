package com.spring.admin.commute.dto;

public class HolidayVO {
	private String holidayDate;
	private String holidayName;
	
	public String getHolidayDate() {
		return holidayDate;
	}
	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}
	public String getHolidayName() {
		return holidayName;
	}
	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}
	
	@Override
	public String toString() {
		return "HolidayVO [holidayDate=" + holidayDate + ", holidayName=" + holidayName + "]";
	}
}
