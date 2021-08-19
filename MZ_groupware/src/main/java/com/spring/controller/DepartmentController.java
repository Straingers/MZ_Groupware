package com.spring.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.DepartmentModifyCommand;
import com.spring.command.DepartmentRegistCommand;
import com.spring.command.DepartmentRemoveCommand;
import com.spring.command.OrganizationVO;
import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;
import com.spring.position.dto.PositionVO;
import com.spring.position.service.PositionService;
import com.spring.service.DepartmentService;
import com.spring.service.EmployeeService;

@Controller
public class DepartmentController {
	private final DepartmentService service;
	private final PositionService positionService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	public DepartmentController(DepartmentService service, PositionService positionService) {
		this.service = service;
		this.positionService = positionService;
	}
	
	// 리스트 페이지 조회
	@RequestMapping("admin/comp/group/list")
	public ModelAndView list(ModelAndView mnv) throws Exception {
		String url = "admin/comp/group/list";

		Map<String, Object> dataMap = service.getDeptSuper(); // 상위 부서 목록 조회
		List<EmployeeVO> employeeList = employeeService.getEmployeeByPsCode(); // 부장 직위 이상인 직원 목록 조회 (부서 수정에서 사용)
		List<PositionVO> positionList = positionService.getList();// 직위 목록 조회
		for(PositionVO position : positionList) {
			List<EmployeeVO> employPositionList = employeeService.getEmployeeAllByPsCode(position.getPsCode());
			position.setEmployee(employPositionList);
		}
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("employeeList", employeeList);
		mnv.addObject("positionList", positionList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 조직 조회(json) ==> 현재 3depth를 고정으로 구현함. (depth가 무한인 경우 추가 로직 구상 필요)
	@RequestMapping(value="admin/comp/group/getdept", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<OrganizationVO> deptlist() throws Exception {
		ResponseEntity<OrganizationVO> entity = null;
		List<OrganizationVO> organizationList = new ArrayList<OrganizationVO>();
		OrganizationVO org = new OrganizationVO();
		
		try {
			// 상위부서 department 조회
			DepartmentVO topDepartment = service.getDeptByCode("000");
			
			// org 세팅
			org.setDepartmentVO(topDepartment);
			org.setState(true);
			org.setIcon("fa fa-folder text-primary");
			
			// dept_super 기준 조회
			String deptSuperCode = topDepartment.getDeptCode();
			List<DepartmentVO> departmentList1 = service.getDepartmentBySuperCode(deptSuperCode);
			if(departmentList1 != null) {
				for(DepartmentVO department1 : departmentList1) {
					OrganizationVO org1 = new OrganizationVO();
					org1.setDepartmentVO(department1);
					org1.setState(true);
					org1.setIcon("fa fa-folder text-success");
					
					// dept_super 기준 조회
					deptSuperCode = department1.getDeptCode();
					List<DepartmentVO> departmentList2 = service.getDepartmentBySuperCode(deptSuperCode);
					if(departmentList2 != null) {
						List<OrganizationVO> organizationList2 = new ArrayList<OrganizationVO>();
						for(DepartmentVO department2 : departmentList2) {
							OrganizationVO org2 = new OrganizationVO();
							org2.setDepartmentVO(department2);
							org2.setState(true);
							org2.setIcon("fa fa-folder text-warning");
							
							organizationList2.add(org2);
						}
						org1.setChildren(organizationList2);
					}
					organizationList.add(org1);
				}
			}
			org.setChildren(organizationList);
			
			entity = new ResponseEntity<OrganizationVO>(org,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<OrganizationVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 조직 등록
	@RequestMapping("dept/regist")
	public String regist(DepartmentRegistCommand registReq) throws Exception {
		String url = "admin/comp/group/regist_success";
		
		DepartmentVO department = registReq.toDepartmentVO();
		EmployeeVO employee = registReq.toEmployeeVO();
		service.registDepartment(department);
		employeeService.modifyEmployeeAuthorityByEmpNo(employee);
		return url;
	}
	
	// 조직 이름 기준 조직 정보 조회.(Ajax)
	@RequestMapping("admin/comp/group/getDeptByDeptName")
	@ResponseBody
	public ResponseEntity<DepartmentVO> getDeptList(String deptName) throws Exception {
		ResponseEntity<DepartmentVO> entity = null;
		
		try {
			DepartmentVO department = service.getDeptByName(deptName);
			
			entity = new ResponseEntity<DepartmentVO>(department,HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<DepartmentVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
	
	// 조직 수정
	@RequestMapping("dept/modify")
	public String modify(DepartmentModifyCommand modifyReq) throws Exception {
		String url = "admin/comp/group/modify_success";
		
		DepartmentVO department = modifyReq.toDepartmentVO();
		EmployeeVO employee = modifyReq.toEmployeeVO(); // 새로운 부서장 ROLE_JANG 변경
		EmployeeVO employeeBefore = modifyReq.toEmployeeRoleUserVO(); // 기존 부서장 ROLE_USER 변경
		
		if(employeeBefore.getEmpNo()!=null) { // 기존에 설정된 부서장이 있는 경우
			int deptEmployeeCount = service.getDepartmentCountByEmpNo(employeeBefore); // 타부서 부서장인지 확인
			if(deptEmployeeCount == 1) {
				employeeService.modifyEmployeeAuthorityByEmpNo(employeeBefore);
			}
		}
		service.modifyDepartmentByDeptCode(department);
		employeeService.modifyEmployeeAuthorityByEmpNo(employee);
		return url;
	}
	
	// 조직 삭제,인사 이동..
	@RequestMapping("admin/comp/group/dept/remove")
	@ResponseBody
	public ResponseEntity<String> remove(DepartmentRemoveCommand removeReq) throws Exception {
		ResponseEntity<String> entity = null;
		DepartmentVO department = removeReq.toDepartmentVO();
		EmployeeVO employeeDept = removeReq.toEmployeeVO();
		
		service.removeDepartmentByDeptCode(department.getDeptCode());
		try {
			int deptEmployeeCount = service.getDeptSuperCountByDeptCode(removeReq.getDeptCode());
			if(deptEmployeeCount == 0) {
				employeeService.modifyEmployeeAuthorityByDeptCode(employeeDept);
			}
			List<EmployeeVO> employeeList = employeeService.getCountEmployeeByDeptCode(department.getDeptCode());
			if(employeeList != null) {
				for(EmployeeVO employee : employeeList) {
					employeeService.modifyDeptSuperByDeptCode(employee);
				}
			}
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
