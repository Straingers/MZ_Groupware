package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

public interface DepartmentService {
	
	// 부서목록
	List<DepartmentVO> getList() throws SQLException;
	
	// 사용중인 부서 목록 전체 조회
	List<DepartmentVO> getDepartmentListY() throws SQLException;
	
	// 상위코드로 부서 정보 조회
	List<DepartmentVO> getDepartmentBySuperCode(String deptSuperCode) throws SQLException;
	
	// 상위 부서 목록 가져오기(조직관리 - 부서등록 selectBox 사용)
	Map<String, Object> getDeptSuper() throws SQLException;
	
	// 부서코드로 부서 정보 조회
	DepartmentVO getDeptByCode(String deptCode) throws SQLException;
	
	// 부서이름으로 부서정보 조회
	DepartmentVO getDeptByName(String deptName) throws SQLException;
	
	// 부서코드로 부서 수정
	void modifyDepartmentByDeptCode(DepartmentVO departmentVO) throws SQLException;
		
	// 부서코드로 부서 삭제
	void removeDepartmentByDeptCode(String deptCode) throws SQLException;
	
	// 부서등록
	void registDepartment(DepartmentVO departmentVO) throws SQLException;
	
	// 부서코드 기준 부서장 담당 개수 조회(부서삭제 때 사용)
	int getDeptSuperCountByDeptCode(String deptCode) throws SQLException;
	
	// 직원 번호 기준 부서장 담당 수 조회 (부서수정 때 사용)
	int getDepartmentCountByEmpNo(EmployeeVO employee) throws SQLException;
}
