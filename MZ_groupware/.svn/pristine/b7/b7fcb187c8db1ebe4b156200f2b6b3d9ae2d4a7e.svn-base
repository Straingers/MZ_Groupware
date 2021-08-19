package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.EmployeeVO;

public class EmployeeDAOImpl implements EmployeeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session =  session;
	}
	
	@Override
	public EmployeeVO selectEmployeeByEmpNo(String empNo) throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeByEmpNo", empNo);
	}
	
	@Override
	public EmployeeVO selectEmpByQr(String qrCode) throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeByQrCode", qrCode);
	}

	// 전직원 조회 
	@Override
	public List<EmployeeVO> selectEmployeeList() throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeList");
	}
	
	// 전직원 목록 조회 + 검색, 페이징 기능 추가
	@Override
	public List<EmployeeVO> selectEmployeeSearchCriteria(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<EmployeeVO> employeeList =
				   session.selectList("Employee-Mapper.selectEmployeeSearchCriteria",cri,rowBounds);	
		return employeeList;
	}

	// 부서명 기준 해당 직원 조회 = jsTree 사용 코드
	@Override
	public List<EmployeeVO> selectEmployeeListByDeptName(String deptName) throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeByDeptName", deptName);
	}

	// 직위 부장 이상 직원 표시
	@Override
	public List<EmployeeVO> selectEmployeeByPsCode() throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeByPsCode");
	}

	// 부서 코드 기준 직원수 확인
	@Override
	public List<EmployeeVO> selectCountEmployeeByDeptCode(String deptCode) throws SQLException {
		return session.selectList("Employee-Mapper.cntEmployeeByDeptCode",deptCode);
	}

	@Override
	public void updateDeptSuperByDeptCode(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateDeptSuperByDeptCode",employee);
	}

	// 직위 코드 기준 직원 목록 조회
	@Override
	public List<EmployeeVO> selectEmployeeAllByPsCode(String psCode) throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeAllByPsCode",psCode);
	}

	@Override
	public int selectEmployeeCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=session.selectOne("Employee-Mapper.selectSearchEmployeeListCount",cri);
		return count;
	}

	@Override
	public void updateEmpVac(EmployeeVO emp) throws SQLException {
		session.update("Employee-Mapper.updateEmpVac", emp);
	}

	@Override
	public int selectEmployeeSequenceNextValue() throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeSequenceNextValue");
	}

	// 사원 등록
	@Override
	public void insertEmployee(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.insertEmployee",employee);
	}

	@Override
	public void updateEmployee(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.modifyEmployee",employee);
	}

	@Override
	public void deleteEmployee(String empNo) throws SQLException {
		session.update("Employee-Mapper.deleteEmployee", empNo);
	}

	@Override
	public void myInfoUpdateEmployee(EmployeeVO emp) throws SQLException {
		session.update("Employee-Mapper.myInfoUpdateEmployee", emp);
	}

	@Override
	public void myPwdUpdate(EmployeeVO emp) throws SQLException {
		session.update("Employee-Mapper.myPwdUpdate", emp);
	}

	@Override
	public void appPwdUpdate(EmployeeVO emp) throws SQLException {
		session.update("Employee-Mapper.appPwdUpdate", emp);
	}
	
	// 인사이동 - 승진처리
	@Override
	public void updateEmployeePsCodeByEmpNo(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateEmployeePsCodeByEmpNo", employee);
	}

	// 인사이동 - 이동처리
	@Override
	public void updateEmployeePsCodeDeptCodeByEmpNo(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateEmployeePsCodeDeptCodeByEmpNo", employee);
	}
	
	// 인사이동 - 휴직,퇴직,재직 처리
	@Override
	public void updateEmployeeEmpStatusByEmpNo(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateEmployeeEmpStatusByEmpNo", employee);
	}

	// 직원 권한 부여
	@Override
	public void updateEmployeeAuthorityByEmpNo(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateEmployeeAuthorityByEmpNo", employee);
	}

	// 부서 삭제 시 부서 코드 기준 직원 권한 변경
	@Override
	public void updateEmployeeAuthorityByDeptCode(EmployeeVO employee) throws SQLException {
		session.update("Employee-Mapper.updateEmployeeAuthorityByDeptCode", employee);
	}

	@Override
	public void minusEmpVac(EmployeeVO emp) throws SQLException {
		session.update("Employee-Mapper.minusEmpVac", emp);
	}

	// employee 대표이사 직원조회 
	@Override
	public EmployeeVO selectEmployeeCEO() throws SQLException {
		return session.selectOne("Employee-Mapper.selectEmployeeCEO");
	}

	// employee 부서 직원 조회
	@Override
	public List<EmployeeVO> selectEmployeeDepartment() throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeDepartment");
	}

	// employee 팀장 직원 조회
	@Override
	public List<EmployeeVO> selectEmployeeTeamjang(EmployeeVO employee) throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeTeamjang", employee);
	}

	// employee 팀원 조회
	@Override
	public List<EmployeeVO> selectEmployeeTeam(EmployeeVO employee) throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeTeam", employee);
	}

	// 즐겨찾는 직원 조회
	@Override
	public List<EmployeeVO> selectEmployeeFavorite(EmployeeVO employee) throws SQLException {
		return session.selectList("Employee-Mapper.selectEmployeeFavorite", employee);
	}
}
