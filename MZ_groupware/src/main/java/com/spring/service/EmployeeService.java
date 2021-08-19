package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteria;
import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundEmpNoException;

public interface EmployeeService {

	// 로그인
	void login(String empNo, String empPwd) throws SQLException, NotFoundEmpNoException, InvalidPasswordException;

	// 직원
	EmployeeVO getEmployee(String empNo) throws SQLException;

	// QR로 조회
	EmployeeVO getEmpByQr(String qrCode) throws SQLException;

	// 전직원조회
	List<EmployeeVO> getList() throws SQLException;
	
	// 전직원 목록 조회 + 검색, 페이징 기능 추가
	Map<String, Object> getEmployeeList(SearchCriteria cri) throws SQLException;
	
	// 부서명 기준 해당 직원 조회 = jsTree 사용 코드
	List<EmployeeVO> getListByDeptName(String deptName) throws SQLException;
	
	// 직위 부장 이상 직원 표시
	public List<EmployeeVO> getEmployeeByPsCode() throws SQLException;
	
	// 부서코드 기준 직원 수 조회 
	public List<EmployeeVO> getCountEmployeeByDeptCode(String deptCode) throws SQLException;
	
	// 직위 코트 기준 직원 목록 조회
	public List<EmployeeVO> getEmployeeAllByPsCode(String psCode) throws SQLException;
	
	// 직원 상위부서로 이동
	public void modifyDeptSuperByDeptCode(EmployeeVO employee) throws SQLException;
	
	// 사번 자동 부여
	int getEmpNo() throws SQLException;
	
	// 사원 등록
	void regist(EmployeeVO employee) throws SQLException;
	
	// 사원 수정
	void modify(EmployeeVO employee) throws SQLException;
	
	// 사원 삭제
	void remove(String empNo) throws SQLException;
	
	void myInfoUpdate(EmployeeVO emp) throws SQLException;
	
	void myPwdChange(EmployeeVO emp) throws SQLException;
	
	void appPwdChange(EmployeeVO emp) throws SQLException;
	// 인사이동 - 승진처리
	void modifyEmployeePsCodeByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 인사이동 - 이동처리
	void modifyEmployeePsCodeDeptCodeByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 인사이동 - 휴직,퇴직,재직 처리
	void modifyEmployeeEmpStatusByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 직원 권한 부여
	void modifyEmployeeAuthorityByEmpNo(EmployeeVO employee) throws SQLException;
	
	// 부서 삭제 시 부서 코드 기준 직원 권한 변경
	void modifyEmployeeAuthorityByDeptCode(EmployeeVO employee) throws SQLException;
	
	// 연차 조정
	void minusEmpVac(EmployeeVO emp) throws SQLException;
	
	// employee 대표이사 직원조회 
	EmployeeVO getEmployeeCEO() throws SQLException;
	
	// employee 부서 직원 조회
	List<EmployeeVO> getEmployeeDepartment() throws SQLException;
	
	// employee 팀장 직원 조회
	List<EmployeeVO> getEmployeeTeamjang(EmployeeVO employee) throws SQLException;
	
	// employee 팀원 조회 
	List<EmployeeVO> getEmployeeTeam(EmployeeVO employee) throws SQLException;
	
	// 즐겨찾는 직원 조회
	List<EmployeeVO> selectEmployeeFavorite(EmployeeVO employee) throws SQLException;
}
