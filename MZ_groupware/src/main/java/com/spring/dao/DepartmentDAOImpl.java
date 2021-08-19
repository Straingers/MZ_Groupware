package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;

@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	
	private final SqlSession session;

	public DepartmentDAOImpl(@Qualifier("sqlSession") SqlSession session) {
		this.session = session;
	}

	// 부서 목록
	@Override
	public List<DepartmentVO> selectDepartmentList() throws SQLException {
		return session.selectList("Department-Mapper.selectDepartmentList");
	}

	// 부서코드로 부서 정보 조회
	@Override
	public DepartmentVO selectDepartmentByCode(String deptCode) throws SQLException {
		return session.selectOne("Department-Mapper.selectDepartmentByCode", deptCode);
	}

	// 상위코드로 부서 정보 조회
	@Override
	public List<DepartmentVO> selectDepartmentBySuperCode(String deptSuperCode) throws SQLException {
		return session.selectList("Department-Mapper.selectDepartmentBySuperCode", deptSuperCode);
	}

	// 부서코드로 부서 수정
	@Override
	public void updateDepartmentByDeptCode(DepartmentVO departmentVO) throws SQLException {
		session.update("Department-Mapper.updateDepartmentByDeptCode",departmentVO);
		
	}

	// 부서코드로 부서 삭제
	@Override
	public void deleteDepartmentByDeptCode(String deptCode) throws SQLException {
		session.update("Department-Mapper.deleteDepartmentByDeptCode",deptCode);
	}

	// 부서등록
	@Override
	public void insertDepartment(DepartmentVO departmentVO) throws SQLException {
		session.update("Department-Mapper.insertDepartment",departmentVO);
	}

	// 상위 부서 목록 가져오기(조직관리 - 부서등록 selectBox 사용)
	@Override
	public List<DepartmentVO> selectDeptSuper() throws SQLException {
		return session.selectList("Department-Mapper.selectDeptSuper");
	}
	
	// 부서이름으로 부서정보 조회
	@Override
	public DepartmentVO selectDepartmentByName(String deptName) throws SQLException {
		return session.selectOne("Department-Mapper.selectDepartmentByDeptName",deptName);
	}
	
	// 사용중인 부서 목록 전체 조회
	@Override
	public List<DepartmentVO> selectDepartmentListY() throws SQLException {
		return session.selectList("Department-Mapper.selectDepartmentListY");
	}

	// 부서코드 기준 부서장 담당 개수 조회(부서수정, 삭제 때 사용)
	@Override
	public int selectDeptSuperCountByDeptCode(String deptCode) throws SQLException {
		return session.selectOne("Department-Mapper.selectDeptSuperCountByDeptCode",deptCode);
	}

	@Override
	public int selectDepartmentCountByEmpNo(EmployeeVO employee) throws SQLException {
		return session.selectOne("Department-Mapper.selectDeptCountByEmpNo",employee);
	}
	
}
