package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

public interface DepartmentDAO {
	
	// 부서 목록
	List<DepartmentVO> selectDepartmentList() throws SQLException;
	
	// 사용중인 부서 목록 전체 조회
	List<DepartmentVO> selectDepartmentListY() throws SQLException;
	
	// 부서코드로 부서 정보 조회
	DepartmentVO selectDepartmentByCode(String deptCode) throws SQLException;
	
	// 상위코드로 부서 정보 조회
	List<DepartmentVO> selectDepartmentBySuperCode(String deptSuperCode) throws SQLException;
	
	// 부서코드로 부서 수정
	void updateDepartmentByDeptCode(DepartmentVO departmentVO) throws SQLException;
	
	// 부서코드로 부서 삭제
	void deleteDepartmentByDeptCode(String deptCode) throws SQLException;
	
	// 부서등록
	void insertDepartment(DepartmentVO departmentVO) throws SQLException;
	
	// 상위 부서 목록 가져오기(조직관리 - 부서등록 selectBox 사용)
	List<DepartmentVO> selectDeptSuper() throws SQLException;
	
	// 부서이름으로 부서정보 조회
	DepartmentVO selectDepartmentByName(String deptName) throws SQLException;
	
	// 부서코드 기준 부서장 담당 개수 조회(부서삭제 때 사용)
	int selectDeptSuperCountByDeptCode(String deptCode) throws SQLException;
	
	// 직원 번호 기준 부서장 담당 수 조회 (부서수정 때 사용)
	int selectDepartmentCountByEmpNo(EmployeeVO employee) throws SQLException;
}
