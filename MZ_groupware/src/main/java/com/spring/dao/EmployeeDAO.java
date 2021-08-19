package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.dto.EmployeeVO;

public interface EmployeeDAO {
	
	// 직원정보 조회
	EmployeeVO selectEmployeeByEmpNo(String empNo) throws SQLException;
	
	// 큐알로 직원 조회
	EmployeeVO selectEmpByQr(String qrCode) throws SQLException;
		
	// 전직원조회
	List<EmployeeVO> selectEmployeeList() throws SQLException;
	
	// 전직원 목록 조회 + 검색, 페이징 기능 추가 
	List<EmployeeVO> selectEmployeeSearchCriteria(SearchCriteria cri) throws SQLException;
	
	// 부서명 기준 해당 직원 조회 = jsTree 사용 코드
	List<EmployeeVO> selectEmployeeListByDeptName(String deptName) throws SQLException;
	
	// 직위 부장 이상 직원 표시
	List<EmployeeVO> selectEmployeeByPsCode() throws SQLException;
	
	// 부서 코드 기준 직원 목록 조회 
	List<EmployeeVO> selectCountEmployeeByDeptCode(String deptCode) throws SQLException;
	
	// 직위 코드 기준 직원 목록 조회
	List<EmployeeVO> selectEmployeeAllByPsCode(String psCode) throws SQLException;

	// 부서 코드 기준 직원 변경
	void updateDeptSuperByDeptCode(EmployeeVO employee) throws SQLException;
	
	// 직원 목록 내 직원 수 조회
	int selectEmployeeCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	void updateEmpVac(EmployeeVO emp) throws SQLException;
	
	// 사번 자동 부여
	int selectEmployeeSequenceNextValue() throws SQLException;
	
	// 사원 등록
	void insertEmployee(EmployeeVO employee) throws SQLException;
	
	// 사원 수정
	void updateEmployee(EmployeeVO employee) throws SQLException;
	
	// 사원 삭제
	void deleteEmployee(String empNo) throws SQLException;
	
	// 마이페이지 정보 수정
	void myInfoUpdateEmployee(EmployeeVO emp) throws SQLException;
	
	void myPwdUpdate(EmployeeVO emp) throws SQLException;
	
	void appPwdUpdate(EmployeeVO emp) throws SQLException;
	// 인사이동 - 승진처리
	void updateEmployeePsCodeByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 인사이동 - 이동처리
	void updateEmployeePsCodeDeptCodeByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 인사이동 - 휴직,퇴직,재직 처리
	void updateEmployeeEmpStatusByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 직원 권한 부여
	void updateEmployeeAuthorityByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 부서 삭제 시 부서 코드 기준 직원 권한 변경
	void updateEmployeeAuthorityByDeptCode(EmployeeVO employee) throws SQLException;
	
	// 연차 차감
	void minusEmpVac(EmployeeVO emp) throws SQLException;
	
	// employee 대표이사 직원조회 
	EmployeeVO selectEmployeeCEO() throws SQLException;
	
	// employee 부서 직원 조회
	List<EmployeeVO> selectEmployeeDepartment() throws SQLException;
	
	// employee 팀장 직원 조회
	List<EmployeeVO> selectEmployeeTeamjang(EmployeeVO employee) throws SQLException;
	
	// employee 팀원 조회 
	List<EmployeeVO> selectEmployeeTeam(EmployeeVO employee) throws SQLException;
	
	// 즐겨찾는 직원 조회
	List<EmployeeVO> selectEmployeeFavorite(EmployeeVO employee) throws SQLException;
}
