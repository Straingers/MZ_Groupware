package com.spring.command;

import java.text.ParseException;

import com.spring.dto.ReservationVO;

public class ReservationRegistCommand {
	
	private int resNo;
	private int roomNo;
	private String empNo;
	private String resDate;
	private String resStartdate;
	private String resEnddate;
	        

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResStartdate() {
		return resStartdate;
	}

	public void setResStartdate(String resStartdate) {
		this.resStartdate = resStartdate;
	}

	public String getResEnddate() {
		return resEnddate;
	}

	public void setResEnddate(String resEnddate) {
		this.resEnddate = resEnddate;
	}


	public ReservationVO toReservationVO() throws ParseException{

		ReservationVO reservation= new ReservationVO();
		reservation.setEmpNo(this.empNo);
		reservation.setRoomNo(roomNo);
		reservation.setEmpNo(this.empNo);
		reservation.setResDate(this.resDate);
		
		String resStartdate = (this.resDate).concat(" " + this.resStartdate);
		reservation.setResStartdate(resStartdate);
		
		String resEnddate = (this.resDate).concat(" " + this.resEnddate);
		reservation.setResEnddate(resEnddate);
		
		return reservation;
	}

	@Override
	public String toString() {
		return "ReservationListCommand [resNo=" + resNo + ", roomNo=" + roomNo + ", empNo=" + empNo + ", resDate="
				+ resDate + ", resStartdate=" + resStartdate + ", resEnddate=" + resEnddate + ", resNote=" 
				+ "]";
	}
	
}
