package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dto.EmployeeVO;
import com.spring.dto.VacationVO;
import com.spring.service.VacationService;

@Controller
@RequestMapping("/comm/vacation")
public class VacationController {

	@Autowired
	private VacationService vacationService;
	
	@RequestMapping("/list")
	public String vacationMain(Model model, HttpServletRequest request) throws Exception {
		String url = "vacation/vacaList";
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		VacationVO vacation = new VacationVO();
		vacation.setEmpNo(emp.getEmpNo());
		List<VacationVO> vacaList = vacationService.getVacationList(vacation);
		List<VacationVO> useVacaList = vacationService.getUseVacation(vacation);
		
		int cnt = 0;
		for(VacationVO vaca : useVacaList) {
			cnt += vaca.getVacDate();
		}
		model.addAttribute("userVaca", cnt);
		model.addAttribute("vacaList", vacaList);
		return url;
	}
	
}
