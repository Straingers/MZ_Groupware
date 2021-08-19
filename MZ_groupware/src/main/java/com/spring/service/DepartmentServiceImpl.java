package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.spring.dao.DepartmentDAO;
import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	private final DepartmentDAO departmentDAO;
	
	public DepartmentServiceImpl(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	@Override
	public List<DepartmentVO> getList() throws SQLException {
		return departmentDAO.selectDepartmentList();
	}

	@Override
	public List<DepartmentVO> getDepartmentBySuperCode(String deptSuperCode) throws SQLException {
		return departmentDAO.selectDepartmentBySuperCode(deptSuperCode);
	}
	
	@Override
	public Map<String, Object> getDeptSuper() throws SQLException {
		List<DepartmentVO> departmentList = departmentDAO.selectDeptSuper();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("departmentList", departmentList);
		
		return dataMap;
	}
	
	@Override
	public DepartmentVO getDeptByCode(String deptCode) throws SQLException {
		return departmentDAO.selectDepartmentByCode(deptCode);
	}


	@Override
	public void modifyDepartmentByDeptCode(DepartmentVO departmentVO) throws SQLException {
		departmentDAO.updateDepartmentByDeptCode(departmentVO);
	}

	@Override
	public void removeDepartmentByDeptCode(String deptCode) throws SQLException {
		departmentDAO.deleteDepartmentByDeptCode(deptCode);
		
	}

	@Override
	public void registDepartment(DepartmentVO departmentVO) throws SQLException {
		departmentDAO.insertDepartment(departmentVO);
	}

	@Override
	public DepartmentVO getDeptByName(String deptName) throws SQLException {
		return departmentDAO.selectDepartmentByName(deptName);
	}

	// 사용중인 부서 목록 전체 조회
	@Override
	public List<DepartmentVO> getDepartmentListY() throws SQLException {
		List<DepartmentVO> departmentList = departmentDAO.selectDepartmentListY();
		
		return departmentList;
	}

	// 부서코드 기준 부서장 담당 개수 조회(부서삭제 때 사용)
	@Override
	public int getDeptSuperCountByDeptCode(String deptCode) throws SQLException {
		return departmentDAO.selectDeptSuperCountByDeptCode(deptCode);
	}
	
	// 직원 번호 기준 부서장 담당 수 조회 (부서수정 때 사용)
	@Override
	public int getDepartmentCountByEmpNo(EmployeeVO employee) throws SQLException {
		return departmentDAO.selectDepartmentCountByEmpNo(employee);
	}
	
}
