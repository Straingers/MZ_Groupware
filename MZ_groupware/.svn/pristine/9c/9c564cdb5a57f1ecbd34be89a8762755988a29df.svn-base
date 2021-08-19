package com.spring.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.command.MyInfoCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.CommunityBoardVO;
import com.spring.dto.CommunityReplyVO;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;
import com.spring.dto.VacationVO;
import com.spring.service.CommunityBoardService;
import com.spring.service.CommunityReplyService;
import com.spring.service.CommuteService;
import com.spring.service.EmployeeService;
import com.spring.service.VacationService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private CommunityBoardService communityBoardService;
	
	@Autowired
	private CommunityReplyService communityReplyService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private CommuteService commuteService;
	
	@RequestMapping("/info/list")
	public String myProfile(HttpServletRequest request, Model model, String yearMonth) throws Exception {
		String url = "mypage/myProfile";
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		emp = employeeService.getEmployee(emp.getEmpNo());
		
		if(emp.getEmpRegno() != null) {
			String regDate = emp.getEmpRegno().replace("-", "");
			String birth = "";
			if(regDate.substring(6, 8).equals("1") || regDate.substring(6, 8).equals("2")) {
				birth = "19" + regDate.substring(0, 2) + "-" + regDate.substring(2, 4) + "-" + regDate.substring(4, 6);
			} 
			if(regDate.substring(6, 8).equals("3") || regDate.substring(6, 8).equals("4")) {
				birth = "20" + regDate.substring(0, 2) + "-" + regDate.substring(2, 4) + "-" + regDate.substring(4, 6);
			} 
			model.addAttribute("birth", birth);
		}
		
		CommuteVO commute = new CommuteVO();
		commute.setEmpNo(emp.getEmpNo());
		String sendYearMonth = "";
		
		if(yearMonth == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			if(month < 10) {
				yearMonth = year + "0" + month;
				sendYearMonth = year + "-0" + month;
			} else {
				yearMonth = year + "" + month;
				sendYearMonth = year + "-" + month;
			}
		} else {
			sendYearMonth = yearMonth;
		}
		model.addAttribute("yearMonth", sendYearMonth);
		yearMonth = yearMonth.replace("-", "");
		commute.setInTime(yearMonth);
		CommuteVO myCommute = commuteService.getMyCommute(commute);
		Map<String, Object> data = new HashMap<>();
		int normal = 0;
		int lazy = 0;
		List<String> lazyDay = new ArrayList<>(); 
		int earlygo = 0;
		List<String> earlygoDay = new ArrayList<>(); 
		int notIn = 0;
		List<String> notInDay = new ArrayList<>(); 
		
		if(myCommute != null && myCommute.getInType() != null && myCommute.getOutType() != null) {
			String[] inType = myCommute.getInType().split(",");
			String[] inTime = myCommute.getInTime().split(",");
			String[] outType = myCommute.getOutType().split(",");
			for(int i = 0; i < outType.length; i++) {
				if(inType[i].equals("출근") && outType[i].equals("퇴근")) {
					normal++;
				} else if(inType[i].equals("지각")) {
					lazy++;
					lazyDay.add(inTime[i].split(" ")[0]);
				} else if(outType[i].equals("조퇴")) {
					earlygo++;
					earlygoDay.add(inTime[i].split(" ")[0]);
				} 
//				else {
//					notIn++;
//					notInDay.add(inTime[i].split(" ")[0]);
//				}
			}
		}
		data.put("normal", normal);
		data.put("lazy", lazy);
		Collections.sort(lazyDay);
		data.put("lazyDay", lazyDay);
		data.put("earlygo", earlygo);
		Collections.sort(earlygoDay);
		data.put("earlygoDay", earlygoDay);
		data.put("notIn", notIn);
		Collections.sort(notInDay);
		data.put("notInDay", notInDay);

		model.addAttribute("myCommute", data);
		
		VacationVO vacation = new VacationVO();
		vacation.setEmpNo(emp.getEmpNo());
		List<VacationVO> vacaList = vacationService.getUseVacation(vacation);
		
		int cnt = 0;
		for(VacationVO vaca : vacaList) {
			cnt += vaca.getVacDate();
		}
		model.addAttribute("userVaca", cnt);
		
		model.addAttribute("employee", emp);
		
		return url;
	}
	
	@RequestMapping("/info/update")
	public String myProfileUpdate(MyInfoCommand infoReq) throws Exception {
		String url = "mypage/infoUpdate_success";
		
		EmployeeVO emp = infoReq.toEmpVO(infoReq);
		employeeService.myInfoUpdate(emp);
		
		return url;
	}
	
	@RequestMapping("/info/pwdChange")
	public String myPwdChange(String empNo, String empPwd) throws Exception {
		String url = "mypage/pwdChange_success";
		
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpNo(empNo);
		emp.setEmpPwd(empPwd);
		employeeService.myPwdChange(emp);
		
		return url;
	}
	
	@RequestMapping("/info/appPwdChange")
	public String appPwdChange(String empNo, int appPwd) throws Exception {
		String url = "mypage/appPwdChange_success";
		
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpNo(empNo);
		emp.setAppPwd(appPwd);
		employeeService.appPwdChange(emp);
		
		return url;
	}
	
	@RequestMapping("/mine/board")
	public String myBoard(Model model, SearchCriteria cri, HttpServletRequest request) throws Exception {
		String url = "mypage/boardList";
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setWriter(emp.getEmpNo());
		Map<String, Object> dataMap = communityBoardService.getMyCommunityList(cri);
		model.addAttribute("dataMap", dataMap);
		
		return url;
	}
	
	@RequestMapping("/mine/boardRemove")
	@ResponseBody
	public String myBoardRemove(@RequestParam(value="commNos") String commNos) throws Exception {
		String[] commNoArr = commNos.split(",");
		for(String commNo : commNoArr) {
			communityBoardService.remove(Integer.parseInt(commNo));
		}
		return null;
	}
	
	@RequestMapping("/mine/boardReply")
	public String myBoardReply(Model model, SearchCriteria cri, HttpServletRequest request) throws Exception {
		String url = "mypage/boardReply";
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		cri.setWriter(emp.getEmpNo());
		Map<String, Object> dataMap = communityReplyService.getReplyCommNoList(cri);
		List<String> commNoList = (List<String>) dataMap.get("commNoList");
		List<CommunityBoardVO> communityList = new ArrayList<CommunityBoardVO>();
		for(String commNoStr : commNoList) {
			int commNo = Integer.parseInt(commNoStr);
			CommunityBoardVO commuinty = communityBoardService.getCommunityBoard(commNo);
			
			CommunityReplyVO communityReply = new CommunityReplyVO();
			communityReply.setCommNo(commNo);
			communityReply.setReplyer(emp.getEmpNo());
			
			List<CommunityReplyVO> communityReplyList = communityReplyService.getMyReplyListByCommNo(communityReply);
			commuinty.setReplyList(communityReplyList);
			
			communityList.add(commuinty);
		}
		dataMap.put("communityList", communityList);
		model.addAttribute("dataMap", dataMap);
		
		return url;
	}
} 
