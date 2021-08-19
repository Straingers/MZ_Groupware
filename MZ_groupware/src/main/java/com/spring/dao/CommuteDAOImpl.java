package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;

public class CommuteDAOImpl implements CommuteDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session =  session;
	}
	
	@Override
	public List<CommuteVO> selectCommuteList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Commute-Mappers.selectCommuteList", cri, rowBounds);
	}

	@Override
	public int selectCommuteListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Commute-Mappers.selectCommuteListCount", cri);
	}
	
	@Override
	public List<CommuteVO> selectCommuteListByEmp(EmployeeVO emp) throws SQLException {
		return session.selectList("Commute-Mappers.selectCommuteListByEmp", emp);
	}

	@Override
	public List<CommuteVO> selectCommuteListByDept(String deptName) throws SQLException {
		List<CommuteVO> list = session.selectList("Commute-Mappers.selectCommuteListByDept", deptName);
		return list;
	}
	
	@Override
	public List<CommuteVO> selectCommuteListByDeptNMonth(CommuteVO commute) throws SQLException {
		List<CommuteVO> list = session.selectList("Commute-Mappers.selectCommuteListByDeptNMonth", commute);
		return list;
	}

	@Override
	public CommuteVO selectMyCommute(CommuteVO commute) throws SQLException {
		return session.selectOne("Commute-Mappers.selectMyCommute", commute);
	}

	@Override
	public CommuteVO selectTodayCommute(CommuteVO commute) throws SQLException {
		return session.selectOne("Commute-Mappers.selectTodayCommute", commute);
	}
	
	@Override
	public void insertCommuteLog(CommuteVO comm) throws SQLException {
		session.update("Commute-Mappers.insertCommuteLog", comm);
	}

	@Override
	public CommuteVO selectEmpByTime(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.selectEmpByTime", empNo);
	}

	@Override
	public void updateOutTime(CommuteVO comm) throws SQLException {
		session.update("Commute-Mappers.updateOutTime", comm);
	}

	@Override
	public void updateWorkingTime(CommuteVO comm) throws SQLException {
		session.update("Commute-Mappers.updateWorkingTime", comm);
	}
	
	@Override
	public void updateInType(CommuteVO comm) throws SQLException {
		session.update("Commute-Mappers.updateInType", comm);
	}
	
	@Override
	public List<CommuteVO> selectThisWeekWorkingDay(String empNo) throws SQLException {
		return session.selectList("Commute-Mappers.selectThisWeekWorkingDay", empNo);
	}
	
	
	
	
	
	/**
	 *  근로시간 계산
	 * @return 
	 */
	@Override
	public String one(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.one", empNo);
	}

	@Override
	public String two(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.two", empNo);
	}

	@Override
	public String three(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.three", empNo);
	}

	@Override
	public String four(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.four", empNo);
	}

	@Override
	public String five(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.five", empNo);
	}

	@Override
	public String six(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.six", empNo);
	}

	@Override
	public String seven(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.seven", empNo);
	}

	@Override
	public String eight(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.eight", empNo);
	}

	@Override
	public String nine(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.nine", empNo);
	}

	@Override
	public String ten(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.ten", empNo);
	}

	@Override
	public String eleven(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.eleven", empNo);
	}

	@Override
	public String twelve(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.twelve", empNo);
	}

	@Override
	public String thirteen(String empNo) throws SQLException {
		return session.selectOne("Commute-Mappers.thirteen", empNo);
	}

	@Override
	public void updateCommuteInfo(CommuteVO comm) throws SQLException {
		session.update("Commute-Mappers.updateCommuteInfo", comm);
	}

	@Override
	public CommuteVO selectCommuteByCommNo(String commuteNo) throws SQLException {
		return session.selectOne("Commute-Mappers.selectCommuteByCommNo", commuteNo);
	}

}
