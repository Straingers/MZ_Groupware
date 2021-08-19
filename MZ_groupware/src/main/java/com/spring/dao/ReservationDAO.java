package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ReservationVO;

public interface ReservationDAO {
	
	// 시퀀스 가져오기
	int getSeqNextValue() throws SQLException;

	// 예약리스트 조회
	List<ReservationVO> selectMainReservationList1(ReservationVO reservationVO) throws SQLException; 

	// 예약리스트 조회
	List<ReservationVO> selectMainReservationList2(ReservationVO reservationVO) throws SQLException; 

	// 예약리스트 조회
	List<ReservationVO> selectReservationList(ReservationVO reservationVO) throws SQLException; 

	// 예약 등록
	void insertReservation(ReservationVO reservationVO)throws SQLException;
	
	// 예약 삭제
	void deleteReservation(ReservationVO reservationVO)throws SQLException;
		
}

