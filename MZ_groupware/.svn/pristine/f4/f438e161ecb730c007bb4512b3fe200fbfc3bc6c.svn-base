package com.spring.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.CommuteDAO;
import com.spring.dao.InoutTimeDAO;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;

public class CommuteServiceImpl implements CommuteService {

	private CommuteDAO commuteDAO;

	public void setCommuteDAO(CommuteDAO commuteDAO) {
		this.commuteDAO = commuteDAO;
	}

	private InoutTimeDAO inoutTimeDAO;

	public void setInoutTimeDAO(InoutTimeDAO inoutTimeDAO) {
		this.inoutTimeDAO = inoutTimeDAO;
	}

	@Override
	public Map<String, Object> getAllCommute(SearchCriteria cri) throws SQLException {
		List<CommuteVO> commuteList = commuteDAO.selectCommuteList(cri);
		System.out.println("commuteList" + commuteList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(commuteDAO.selectCommuteListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("commuteList", commuteList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public List<CommuteVO> getDeptCommute(String deptName) throws SQLException {
		return commuteDAO.selectCommuteListByDept(deptName);
	}

	@Override
	public List<CommuteVO> getDeptCommuteByMonth(String deptName, int month) throws SQLException {
		CommuteVO commute = new CommuteVO();
		commute.setDeptName(deptName);
		commute.setWorkingHour(Integer.toString(month));
		List<CommuteVO> commuteList = commuteDAO.selectCommuteListByDeptNMonth(commute);
		return commuteList;
	}

	@Override
	public List<CommuteVO> getEmpCommute(EmployeeVO emp) throws SQLException {
		List<CommuteVO> commuteList = commuteDAO.selectCommuteListByEmp(emp);
		return commuteList;
	}
	
	@Override
	public CommuteVO getMyCommute(CommuteVO commute) throws SQLException {
		return commuteDAO.selectMyCommute(commute);
	}

	@Override
	public CommuteVO getTodayCommute(CommuteVO commute) throws SQLException {
		return commuteDAO.selectTodayCommute(commute);
	}
	
	@Override
	public CommuteVO regist(CommuteVO comm) throws SQLException {
		String empNo = comm.getEmpNo();

		SimpleDateFormat inTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat nowTime = new SimpleDateFormat("HHmm");
		Date today = new Date();
		String time = inTime.format(today);
		int now = Integer.parseInt(nowTime.format(today));

		int openTime = Integer
				.parseInt(inoutTimeDAO.selectTime().get(0).getOpenTime().replace(":", "").substring(11, 15));
		int closeTime = Integer
				.parseInt(inoutTimeDAO.selectTime().get(0).getCloseTime().replace(":", "").substring(11, 15));

		CommuteVO commute = commuteDAO.selectEmpByTime(empNo);
		
		if (commute == null) {

			comm.setInTime(time);
			if (openTime >= now) {
				comm.setInType("출근");
			} else {
				comm.setInType("지각");
			}
			commuteDAO.insertCommuteLog(comm);
		} else {

			comm.setOutTime(time);
			if (closeTime > now) {
				comm.setOutType("조퇴");
			} else {
				comm.setOutType("퇴근");
			}
			commuteDAO.updateOutTime(comm);
			updateWorkingTime(comm);
			
			comm.setInTime(commute.getInTime());
		}
		return comm;
	}

	@Override
	public CommuteVO getEmpTime(String empNo) throws SQLException {
		CommuteVO comm = commuteDAO.selectEmpByTime(empNo);
		return comm;
	}

	@Override
	public List<CommuteVO> getThisWeekWorkingDay(String empNo) throws SQLException {
		return commuteDAO.selectThisWeekWorkingDay(empNo);
	}
	
	@Override
	public void updateOutTime(CommuteVO comm) throws SQLException {

	}

	@Override
	public void updateWorkingTime(CommuteVO comm) throws SQLException {
		/**
		 * 소정근로시간 계산 A: 09시 이전, B: 09~12시, C: 13시~18시, D: 19시 이후, E: 12~13 점심, F: 18~19
		 */
		String empNo = comm.getEmpNo();

		int in = Integer.parseInt(commuteDAO.selectEmpByTime(empNo).getInTime().replace(":", "").substring(11, 15));
		int out = Integer.parseInt(commuteDAO.selectEmpByTime(empNo).getOutTime().replace(":", "").substring(11, 15));

		if (in <= 900) {
			if (out <= 900) {
				comm.setWorkingHour("0");
			} else if (900 < out && out <= 1200) {
				comm.setWorkingHour(commuteDAO.one(empNo));
			} else if (1200 < out && out <= 1300) {
				comm.setWorkingHour("03:00");
			} else if (1300 < out && out <= 1800) {
				comm.setWorkingHour(commuteDAO.two(empNo));
			} else if (1800 < out && out <= 1900) {
				comm.setWorkingHour("08:00");
			} else if (1900 < out) {
				comm.setWorkingHour(commuteDAO.three(empNo));
			}
		} else if (900 < in && in <= 1200) {
			if (out <= 1200) {
				comm.setWorkingHour(commuteDAO.four(empNo));
			} else if (1200 < out && out <= 1300) {
				comm.setWorkingHour(commuteDAO.nine(empNo));
			} else if (1300 < out && out <= 1800) {
				comm.setWorkingHour(commuteDAO.five(empNo));
			} else if (1800 < out && out <= 1900) {
				comm.setWorkingHour(commuteDAO.ten(empNo));
			} else if (1900 < out) {
				comm.setWorkingHour(commuteDAO.six(empNo));
			} else {
				comm.setWorkingHour("0");
			}
		} else if (1200 < in && in <= 1300) {
			if (1300 < out && out <= 1800) {
				comm.setWorkingHour(commuteDAO.eleven(empNo));
			} else if (1800 < out && out <= 1900) {
				comm.setWorkingHour("05:00");
			} else if (1900 < out) {
				comm.setWorkingHour(commuteDAO.twelve(empNo));
			} else {
				comm.setWorkingHour("0");
			}
		} else if (1300 <= in && in <= 1800) {
			if (in < out && out <= 1800) {
				comm.setWorkingHour(commuteDAO.seven(empNo));
			} else if (1800 < out && out <= 1900) {
				comm.setWorkingHour(commuteDAO.thirteen(empNo));
			} else if (1900 < out) {
				comm.setWorkingHour(commuteDAO.eight(empNo));
			} else {
				comm.setWorkingHour("0");
			}
		} else {
			comm.setWorkingHour("오류");
		}

		int over = Integer.parseInt(comm.getWorkingHour().replace(":", ""));
		if (over > 800) {
			comm.setWorkingHour("08:00");

			int overworkHour = over - 800;

			comm.setOverworkHour(Integer.toString(overworkHour));
		}

		commuteDAO.updateWorkingTime(comm);

	}

	@Override
	public void updateInType(CommuteVO comm) throws SQLException {
		commuteDAO.updateInType(comm);
	}

	@Override
	public CommuteVO getCommuteByCommuteNo(String commuteNo) throws SQLException {
		return commuteDAO.selectCommuteByCommNo(commuteNo);
	}

}
