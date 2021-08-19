package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.dao.CommuteDAO;
import com.spring.dao.EmployeeDAO;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;
import com.spring.exception.InvalidPasswordException;
import com.spring.exception.NotFoundEmpNoException;

public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDAO employeeDAO;
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	private CommuteDAO commuteDAO;
	public void setCommuteDAO(CommuteDAO commuteDAO) {
		this.commuteDAO = commuteDAO;
	}
	
	@Override
	public void login(String empNo, String empPwd) throws SQLException, NotFoundEmpNoException, InvalidPasswordException {
		EmployeeVO emp = employeeDAO.selectEmployeeByEmpNo(empNo);
		
		if(emp == null) {
			throw new NotFoundEmpNoException();
		}
		if (!empPwd.equals(emp.getEmpPwd())) {
			throw new InvalidPasswordException();
		}
	}

	@Override
	public EmployeeVO getEmployee(String empNo) throws SQLException {
		return employeeDAO.selectEmployeeByEmpNo(empNo);
	}
	
	@Override
	public EmployeeVO getEmpByQr(String qrCode) throws SQLException {
		return employeeDAO.selectEmpByQr(qrCode);
	}

	@Override
	public List<EmployeeVO> getList() throws SQLException {
		return employeeDAO.selectEmployeeList();
	}
	
	// 전직원 목록 조회 + 검색, 페이징 기능 추가
	@Override
	public Map<String, Object> getEmployeeList(SearchCriteria cri) throws SQLException {
		List<EmployeeVO> employeeList = employeeDAO.selectEmployeeSearchCriteria(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeeDAO.selectEmployeeCriteriaTotalCount(cri));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("employeeList", employeeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 부서명 기준 해당 직원 조회 = jsTree 사용 코드
	@Override
	public List<EmployeeVO> getListByDeptName(String deptName) throws SQLException {
		return employeeDAO.selectEmployeeListByDeptName(deptName);
	}

	@Override
	public List<EmployeeVO> getEmployeeByPsCode() throws SQLException {
		return employeeDAO.selectEmployeeByPsCode();
	}

	@Override
	public List<EmployeeVO> getCountEmployeeByDeptCode(String deptCode) throws SQLException {
		return employeeDAO.selectCountEmployeeByDeptCode(deptCode);
	}

	@Override
	public void modifyDeptSuperByDeptCode(EmployeeVO employee) throws SQLException {
		employeeDAO.updateDeptSuperByDeptCode(employee);
	}

	// 직위 코트 기준 직원 목록 조회
	@Override
	public List<EmployeeVO> getEmployeeAllByPsCode(String psCode) throws SQLException {
		return employeeDAO.selectEmployeeAllByPsCode(psCode);
	}

	@Override
	public int getEmpNo() throws SQLException {
		return employeeDAO.selectEmployeeSequenceNextValue();
	}

	// 사원 등록
	@Override
	public void regist(EmployeeVO employee) throws SQLException {
		employeeDAO.insertEmployee(employee);
	}

	// 사원 수정
	@Override
	public void modify(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployee(employee);
	}
	
	// 사원 수정
	@Override
	public void remove(String empNo) throws SQLException {
		employeeDAO.deleteEmployee(empNo);
	}

	@Override
	public void myInfoUpdate(EmployeeVO emp) throws SQLException {
		employeeDAO.myInfoUpdateEmployee(emp);
	}

	@Override
	public void myPwdChange(EmployeeVO emp) throws SQLException {
		employeeDAO.myPwdUpdate(emp);
	}
	
	@Override
	public void appPwdChange(EmployeeVO emp) throws SQLException {
		employeeDAO.appPwdUpdate(emp);
	}

	// 인사이동 - 승진처리
	@Override
	public void modifyEmployeePsCodeByEmpNo(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployeePsCodeByEmpNo(employee);
		
		EmployeeVO tmpEmp = employeeDAO.selectEmployeeByEmpNo(employee.getEmpNo());
		
		CommuteVO commute = new CommuteVO();
		commute.setEmpNo(tmpEmp.getEmpNo());
		commute.setDeptName(tmpEmp.getDeptName());
		commute.setPsName(tmpEmp.getPsName());
		commute.setPsLevel(tmpEmp.getPsLevel());
		
		commuteDAO.updateCommuteInfo(commute);
	}

	// 인사이동 - 이동처리
	@Override
	public void modifyEmployeePsCodeDeptCodeByEmpNo(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployeePsCodeDeptCodeByEmpNo(employee);
		
		EmployeeVO tmpEmp = employeeDAO.selectEmployeeByEmpNo(employee.getEmpNo());
		
		CommuteVO commute = new CommuteVO();
		commute.setEmpNo(tmpEmp.getEmpNo());
		commute.setDeptName(tmpEmp.getDeptName());
		commute.setPsName(tmpEmp.getPsName());
		commute.setPsLevel(tmpEmp.getPsLevel());
		
		commuteDAO.updateCommuteInfo(commute);
	}
	
	// 인사이동 - 휴직,퇴직,재직 처리
	@Override
	public void modifyEmployeeEmpStatusByEmpNo(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployeeEmpStatusByEmpNo(employee);
	}

	// 직원 권한 부여
	@Override
	public void modifyEmployeeAuthorityByEmpNo(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployeeAuthorityByEmpNo(employee);
	}
	
	// 부서 삭제 시 부서 코드 기준 직원 권한 변경
	@Override
	public void modifyEmployeeAuthorityByDeptCode(EmployeeVO employee) throws SQLException {
		employeeDAO.updateEmployeeAuthorityByDeptCode(employee);
	}

	@Override
	public void minusEmpVac(EmployeeVO emp) throws SQLException {
		employeeDAO.minusEmpVac(emp);
	}

	// employee 대표이사 직원조회
	@Override
	public EmployeeVO getEmployeeCEO() throws SQLException {
		return employeeDAO.selectEmployeeCEO();
	}

	// employee 부서 직원 조회
	@Override
	public List<EmployeeVO> getEmployeeDepartment() throws SQLException {
		return employeeDAO.selectEmployeeDepartment();
	}

	// employee 팀장 직원 조회
	@Override
	public List<EmployeeVO> getEmployeeTeamjang(EmployeeVO employee) throws SQLException {
		return employeeDAO.selectEmployeeTeamjang(employee);
	}
	
	// employee 팀원 조회
	@Override
	public List<EmployeeVO> getEmployeeTeam(EmployeeVO employee) throws SQLException {
		return employeeDAO.selectEmployeeTeam(employee);
	}

	// 즐겨찾는 직원 조회
	@Override
	public List<EmployeeVO> selectEmployeeFavorite(EmployeeVO employee) throws SQLException {
		return employeeDAO.selectEmployeeFavorite(employee);
	}
}
