package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ReservationVO;

public class ReservationDAOImpl implements ReservationDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ReservationVO> selectMainReservationList1(ReservationVO reservationVO) throws SQLException {
		List<ReservationVO> ReservationList= session.selectList("Reservation-Mapper.selectMainReservationList1", reservationVO);	
		return ReservationList;
	}

	@Override
	public List<ReservationVO> selectMainReservationList2(ReservationVO reservationVO) throws SQLException {
		List<ReservationVO> ReservationList= session.selectList("Reservation-Mapper.selectMainReservationList2", reservationVO);	
		return ReservationList;
	}

	@Override
	public List<ReservationVO> selectReservationList(ReservationVO reservationVO) throws SQLException {
		List<ReservationVO> ReservationList= session.selectList("Reservation-Mapper.selectReservationList", reservationVO);	
		return ReservationList;
	}

	@Override
	public int getSeqNextValue() throws SQLException {
		int seq = session.selectOne("Reservation-Mapper.selectReservationSequenceNextValue");
		return seq;
	}
	
	@Override
	public void insertReservation(ReservationVO reservationVO) throws SQLException {
		session.selectOne("Reservation-Mapper.registReservation", reservationVO);	
		
	}

	@Override
	public void deleteReservation(ReservationVO reservationVO) throws SQLException {
		session.update("Reservation-Mapper.deleteReservation", reservationVO);	
	}

}
