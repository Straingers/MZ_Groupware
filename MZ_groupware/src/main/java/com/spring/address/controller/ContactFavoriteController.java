package com.spring.address.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.address.dto.ContactFavoriteVO;
import com.spring.address.service.ContactFavoriteService;
import com.spring.dto.EmployeeVO;
import com.spring.service.EmployeeService;

@Controller
public class ContactFavoriteController {
	
	private final ContactFavoriteService contactFavoriteService;
	private final EmployeeService employeeService;
	
	@Autowired
	public ContactFavoriteController(ContactFavoriteService contactFavoriteService
									,EmployeeService 	employeeService) {
		this.contactFavoriteService = contactFavoriteService;
		this.employeeService 	= employeeService;
	}
	
	@RequestMapping("address/comp/list")
	public String addressList() throws SQLException{
		String url = "address/comp/list";
		
		return url;
	}
	
	// 주소록 즐겨찾기 동기방식 코드
//	@RequestMapping("address/comp/list")
//	public ModelAndView addressList(ModelAndView mnv, HttpServletRequest request) throws SQLException{
//		String url = "address/comp/list";
//		
//		HttpSession session = request.getSession();
//		EmployeeVO employee = (EmployeeVO) session.getAttribute("loginUser");
//		List<ContactFavoriteVO> favoriteList = contactFavoriteService.getFavoriteByEmpNo(employee);
//		
//		mnv.addObject("favoriteList", favoriteList);
//		mnv.setViewName(url);
//		
//		return mnv;
//	}
	
	// 주소록 즐겨찾기 등록
	@RequestMapping("address/comp/regist")
	@ResponseBody
	public ResponseEntity<String> regist(String favoriteEmpNo, HttpSession session) throws SQLException {
		ResponseEntity<String> entity = null;
		
		try {
			EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			
			ContactFavoriteVO contactFavorite = new ContactFavoriteVO();
			contactFavorite.setEmpNo(loginUser.getEmpNo());
			contactFavorite.setFavoriteEmpNo(favoriteEmpNo);
			
			contactFavoriteService.regist(contactFavorite);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 주소록 즐겨찾기 제거 
	@RequestMapping("address/comp/remove")
	@ResponseBody
	public ResponseEntity<String> remove(String favoriteEmpNo, HttpSession session) throws SQLException {
		ResponseEntity<String> entity = null;
		
		try {
			EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			
			ContactFavoriteVO contactFavorite = new ContactFavoriteVO();
			contactFavorite.setEmpNo(loginUser.getEmpNo());
			contactFavorite.setFavoriteEmpNo(favoriteEmpNo);
			
			contactFavoriteService.remove(contactFavorite);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 즐겨찾기 비동기 가져오기 
	@RequestMapping("address/comp/favorite")
	@ResponseBody
	public ResponseEntity<List<ContactFavoriteVO>> favorite(HttpServletRequest request) throws SQLException{
		ResponseEntity<List<ContactFavoriteVO>> entity = null;
		
		try {
			HttpSession session = request.getSession();
			EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			List<ContactFavoriteVO> favoriteList = contactFavoriteService.getFavoriteByEmpNo(loginUser);
			
			entity = new ResponseEntity<List<ContactFavoriteVO>>(favoriteList,HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<List<ContactFavoriteVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 직원 상세보기
	@RequestMapping("address/comp/detail")
	public ModelAndView addressEmployeeDetail(String empNo, ModelAndView mnv) throws SQLException{
		String url = "address/comp/detail";
		
		EmployeeVO employee = employeeService.getEmployee(empNo);
		mnv.addObject("employee", employee);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
