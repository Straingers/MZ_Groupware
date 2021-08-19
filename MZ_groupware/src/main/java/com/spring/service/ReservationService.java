package com.spring.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Map;

import com.spring.dto.ReservationVO;

public interface ReservationService {
	
	// 리스트 조회
	Map<String, Object> getMainReservationList(ReservationVO reservationVO) throws SQLException; 
	// 리스트 조회
	Map<String, Object> getReservationList(ReservationVO reservationVO) throws SQLException , ParseException; 

	// 예약 등록
	void reservationRegist(ReservationVO reservationVO) throws SQLException;

	// 예약 삭제
	void reservationRemove(ReservationVO reservationVO) throws SQLException;
	
}
