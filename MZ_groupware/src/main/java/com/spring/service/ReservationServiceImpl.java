package com.spring.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.spring.dao.ReservationDAO;
import com.spring.dto.ReservationVO;

public class ReservationServiceImpl implements ReservationService {
	
	private ReservationDAO reservationDAO;

	public void setReservationDAO(ReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
	}

	@Override
	public Map<String, Object> getMainReservationList(ReservationVO reservationVO) throws SQLException {
		List<ReservationVO> reservationList1 = reservationDAO.selectMainReservationList1(reservationVO);
		List<ReservationVO> reservationList2 = reservationDAO.selectMainReservationList2(reservationVO);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("reservationList1", reservationList1);
		dataMap.put("reservationList2", reservationList2);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getReservationList(ReservationVO reservationVO) throws SQLException, ParseException {
		List<ReservationVO> reservationList = reservationDAO.selectReservationList(reservationVO);
		
		List<ReservationVO> orResStartdate = new ArrayList<ReservationVO>();
		
		ReservationVO orReservationVO = new ReservationVO();
		orReservationVO.setResStartdate("09:00");
		orReservationVO.setResEnddate("10:00");
		orReservationVO.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO);

		ReservationVO orReservationVO1 = new ReservationVO();
		orReservationVO1.setResStartdate("10:00");
		orReservationVO1.setResEnddate("11:00");
		orReservationVO1.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO1);
		
		ReservationVO orReservationVO2 = new ReservationVO();
		orReservationVO2.setResStartdate("11:00");
		orReservationVO2.setResEnddate("12:00");
		orReservationVO2.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO2);
		
		ReservationVO orReservationVO3 = new ReservationVO();
		orReservationVO3.setResStartdate("12:00");
		orReservationVO3.setResEnddate("13:00");
		orReservationVO3.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO3);
		
		ReservationVO orReservationVO4 = new ReservationVO();
		orReservationVO4.setResStartdate("13:00");
		orReservationVO4.setResEnddate("14:00");
		orReservationVO4.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO4);
		
		ReservationVO orReservationVO5 = new ReservationVO();
		orReservationVO5.setResStartdate("14:00");
		orReservationVO5.setResEnddate("15:00");
		orReservationVO5.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO5);
		
		ReservationVO orReservationVO6 = new ReservationVO();
		orReservationVO6.setResStartdate("15:00");
		orReservationVO6.setResEnddate("16:00");
		orReservationVO6.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO6);
		
		ReservationVO orReservationVO7 = new ReservationVO();
		orReservationVO7.setResStartdate("16:00");
		orReservationVO7.setResEnddate("17:00");
		orReservationVO7.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO7);
		
		ReservationVO orReservationVO8 = new ReservationVO();
		orReservationVO8.setResStartdate("17:00");
		orReservationVO8.setResEnddate("18:00");
		orReservationVO8.setResDate(reservationVO.getResDate());
		orResStartdate.add(orReservationVO8);
		
		
		List<ReservationVO> resTable = new ArrayList<ReservationVO>();
		
		for(ReservationVO orStartdate : orResStartdate) {
			orReservationVO.setResDate(reservationVO.getResDate());
			for(ReservationVO startdate : reservationList) {
				String orStart = orStartdate.getResStartdate();
				String start = startdate.getResStartdate();
				if(orStart.equals(start)) {
					orStartdate.setDeptName(startdate.getDeptName());
					orStartdate.setEmpName(startdate.getEmpName());
					orStartdate.setEmpNo(startdate.getEmpNo());
					orStartdate.setResDate(startdate.getResDate());
					orStartdate.setResEnddate(startdate.getResEnddate());
					orStartdate.setResNo(startdate.getResNo());
					orStartdate.setResNote(startdate.getResNote());
					orStartdate.setResStartdate(startdate.getResStartdate());
					orStartdate.setRoomNo(startdate.getRoomNo());
				}else {
					orStartdate.setResDate(startdate.getResDate());
				}
				
			}
			String date = orStartdate.getResDate();
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date Xdate = fm.parse(date);
			
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
			Date now = new Date ();
			String NTime = mSimpleDateFormat.format (now);
			fm = new SimpleDateFormat("yyyy-MM-dd");
			Date Ndate = fm.parse(NTime);

			int compare = Xdate.compareTo(Ndate);
			if (compare < 0) {
				orStartdate.setTimeOut("Y");
			}else if(compare > 0) {

			}else {
				String Dtime = orStartdate.getResEnddate().split(":")[0];
				int DBtime  = Integer.parseInt(Dtime);
				

				String time = NTime.split(" ")[1].split(":")[0];
				int Ntime  = Integer.parseInt(time );
				
				if (DBtime <= Ntime+1) {
					orStartdate.setTimeOut("Y");
				}
			}
			resTable.add(orStartdate);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("resTable", resTable);
		return dataMap;
	}

	
	
	@Override
	public void reservationRegist(ReservationVO reservationVO) throws SQLException {
		int seq = reservationDAO.getSeqNextValue();
		
		reservationVO.setResNo(seq);
		
		reservationDAO.insertReservation(reservationVO);
	}

	@Override
	public void reservationRemove(ReservationVO reservationVO) throws SQLException {
		reservationDAO.deleteReservation(reservationVO);
	}

}
