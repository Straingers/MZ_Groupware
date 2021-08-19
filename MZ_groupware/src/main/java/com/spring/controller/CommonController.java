package com.spring.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.approval.dto.ApprovalVO;
import com.spring.approval.service.ApprovalService;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;
import com.spring.dto.MenuVO;
import com.spring.dto.NoticeBoardVO;
import com.spring.dto.ReservationVO;
import com.spring.msg.dto.MessageVO;
import com.spring.msg.service.MessageService;
import com.spring.notification.dto.NotificationVO;
import com.spring.notification.service.NotificationService;
import com.spring.service.CommuteService;
import com.spring.service.EmployeeService;
import com.spring.service.MenuService;
import com.spring.service.NoticeBoardService;
import com.spring.service.ReservationService;
import com.spring.task.dto.TaskReportVO;
import com.spring.task.service.TaskService;

@Controller
public class CommonController {
	
	private final TaskService taskService;
	private final ApprovalService approvalService;

	@Autowired
	public CommonController(TaskService taskService, ApprovalService approvalService) {
		this.taskService = taskService;
		this.approvalService = approvalService;
	}
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private NoticeBoardService noticeboardService;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private CommuteService commuteService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/common/loginForm", method=RequestMethod.GET)
	public String loginPage(@RequestParam(defaultValue="")String error, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "common/login";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	@RequestMapping(value="/common/qrLogin", method=RequestMethod.GET)
	public String qrLoginPage() {
		String url = "common/qrLogin";
		return url;
	}
	
	@RequestMapping(value="/common/readQr", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getEmpNoEmpPwd(@RequestBody Map<String, Object> map) throws Exception {
		String qr = String.valueOf(map.get("qrId"));
		EmployeeVO emp = employeeService.getEmpByQr(qr);
		
		map.put("empNo", emp.getEmpNo());
		map.put("empPwd", emp.getEmpPwd());
		
		return map;
	}
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse response) {
		String url = "security/accessDenied";
		
		response.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/index")
	public ModelAndView indexPage(ModelAndView mnv,
			  @RequestParam(defaultValue="M010000")String menuCode, 
			  HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "common/indexPage";
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		NotificationVO notification = new NotificationVO();
		notification.setEmpNo(emp.getEmpNo());
		List<NotificationVO> notificationList = notificationService.getMyNotificationList(notification);
		int notificationCnt = notificationService.getMyNotificationCnt(notification);
		
		mnv.addObject("notificationList", notificationList);
		mnv.addObject("notificationCnt", notificationCnt);
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();		
			MenuVO menu = menuService.getMenuByMcode(menuCode);
			mnv.addObject("menuList", menuList);
			mnv.addObject("menu", menu);
		} catch (SQLException e) {			
			e.printStackTrace();
			throw e;
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/common/main")
	public String main(HttpServletRequest request, Model model) throws Exception {
		String url = "common/main";
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		String empNo = emp.getEmpNo();
		
		// 메인페이지 - 내정보(대시보드)
		CommuteVO commute = new CommuteVO();
		commute.setEmpNo(emp.getEmpNo());
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		commute.setWorkingHour(String.valueOf(date.format(today)));
		
		commute = commuteService.getTodayCommute(commute);
		model.addAttribute("commute", commute);
		
		List<CommuteVO> workList = commuteService.getThisWeekWorkingDay(emp.getEmpNo());
		int hour = 0;
		int minute = 0;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
		
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		String monday = dateFmt.format(cal.getTime());
		cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
		cal.add(Calendar.DATE, 7);
		String friday = dateFmt.format(cal.getTime());
		
		for(CommuteVO work : workList) {
			if(work.getWorkingHour() != null) {
				String workingHour = work.getWorkingHour();
				if(work.getWorkingHour().indexOf(":") != -1) {
					String[] tmp = workingHour.split(":");
					hour += Integer.parseInt(tmp[0]);
					minute += Integer.parseInt(tmp[1]);
				}
			}
		}
		
		if(minute / 60 != 0) {
			hour += minute / 60;
			minute = minute % 60;
		}
		String workingHour = hour + "시간 " + minute + "분";
		
		model.addAttribute("monday", monday);
		model.addAttribute("friday", friday);
		model.addAttribute("hour", hour + (minute / 60));
		model.addAttribute("workingHour", workingHour);
		
		// 팝업 공지사항
		List<NoticeBoardVO> noticeBoardList = noticeboardService.getNoticePopupList();
		model.addAttribute("noticeBoardList", noticeBoardList);
		
		// 시설예약
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setEmpNo(empNo);
		Map<String, Object> reservationList = reservationService.getMainReservationList(reservationVO);
		model.addAttribute("reservationList", reservationList);
		
		// 업무관리
		List<TaskReportVO> taskList = taskService.getAllReceiveList(emp.getEmpNo());
		model.addAttribute("taskList", taskList);
		
		// 전자결재
		List<ApprovalVO> appList = approvalService.getAllList(emp.getEmpNo());
		model.addAttribute("appList", appList);
		
		// 퀵워크
		int appCnt = approvalService.getUncheckAppCount(empNo);
		int shareCnt = taskService.getUncheckShare(empNo);
		int dailyCnt = taskService.getUncheckDaily(empNo);
		model.addAttribute("appCnt", appCnt);
		model.addAttribute("shareCnt", shareCnt);
		model.addAttribute("dailyCnt", dailyCnt);
		
		// 쪽지함-발신함
		MessageVO sendMsg = new MessageVO();
		sendMsg.setEmpNo(emp.getEmpNo());
		sendMsg.setPageType("send");
		Map<String, Object> msgSendMap = messageService.getSendList(sendMsg);
		
		model.addAttribute("msgSendMap", msgSendMap);
		model.addAttribute("msgPageType", "send");
		model.addAttribute("perPageNum", 10);
		
		// 쪽지함-발신함
		MessageVO recMsg = new MessageVO();
		recMsg.setEmpNo(emp.getEmpNo());
		recMsg.setPageType("receive");
		
		Map<String, Object> msgRecMap = messageService.getReceiveList(recMsg);
	
		model.addAttribute("msgRecMap", msgRecMap);
		model.addAttribute("msgPageType", "receive");
		model.addAttribute("perPageNum", 10);
				
		return url;
	}
	
	@RequestMapping("/getMenuCode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String menuName) throws Exception {
		ResponseEntity<MenuVO> entity = null;
		
		try {
			MenuVO menu = menuService.getMenuByMname(menuName);
			
			entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenu(String menuCode) throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;
		
		try {
			List<MenuVO> menuList = menuService.getSubMenuList(menuCode);
			
			entity = new ResponseEntity<List<MenuVO>>(menuList, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/common/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/";
		session.invalidate();
		return url;
	}

	@RequestMapping("/common/removeNotify")
	@ResponseBody
	public String removeNotify(@RequestParam String notificationNo) throws Exception {
		NotificationVO notification = new NotificationVO();
		notification.setNotificationNo(notificationNo);
		
		notificationService.removeNotification(notification);
		
		return null;
	}
	
	@RequestMapping("/common/loginExpired")
	public void loginExpired(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다.\\n다시 로그인 하면 다른 장치에서 로그인은 취소됩니다!');");
		out.println("location.href = '" + request.getContextPath() + "';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/sessionTimeOut")
	public String timeOut() throws Exception {
		String url = "common/sessionTimeOut";
		
		return url;
	}
		
	@RequestMapping("/common/about")
	public String about() throws Exception {
		String url = "common/about";
		
		return url;
	}

	@RequestMapping("/common/team")
	public String team() throws Exception {
		String url = "common/team";
		
		return url;
	}
	
	@RequestMapping("/common/finale")
	public String finale() throws Exception {
		String url = "common/finale";
		
		return url;
	}
	
	@RequestMapping("/common/temp")
	public String temp() throws Exception {
		return "common/temp";
	}
}
