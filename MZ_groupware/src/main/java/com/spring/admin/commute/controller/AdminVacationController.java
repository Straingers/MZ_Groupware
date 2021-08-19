package com.spring.admin.commute.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.commute.dto.VacationTypeVO;
import com.spring.admin.commute.service.VacationTypeService;

@Controller
@RequestMapping("/admin")
public class AdminVacationController {
	
	@Autowired
	private VacationTypeService vacationTypeService;
	
	@RequestMapping("/vacation/annualset")
	public String vacaMain(Model model) throws Exception {
		String url = "admin/vacation/dayOff";
		
		List<VacationTypeVO> vacationTypeList = vacationTypeService.getVacationTypeList();
		model.addAttribute("vacationTypeList", vacationTypeList);
		
		return url;
	}
	
	@RequestMapping(value="/vacation/changeDay", method=RequestMethod.POST)
	public String changeDay(Model model, String vacCode, String vacDay) throws Exception {
		String url = "admin/vacation/change_success";
		
		VacationTypeVO vacaType = new VacationTypeVO();
		vacaType.setVacCode(vacCode);
		vacaType.setVacDays(vacDay);
		vacationTypeService.updateTypeList(vacaType);
		
		return url;
	}
}
