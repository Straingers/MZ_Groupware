package com.spring.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.commute.dto.HolidayVO;
import com.spring.admin.commute.service.HolidayService;
import com.spring.command.CommuteExcelCommand;
import com.spring.dto.CommuteChangeVO;
import com.spring.dto.CommuteVO;
import com.spring.dto.EmployeeVO;
import com.spring.service.CommuteChangeService;
import com.spring.service.CommuteService;
import com.spring.service.EmployeeService;

@Controller
public class CommuteController {

	@Autowired
	private CommuteService commuteService;
	
	@Autowired
	private CommuteChangeService commuteChangeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private HolidayService holidayService;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/comm/manage/list")
	public String main(Model model, HttpServletRequest request) throws Exception {
		String url = "commute/list";
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		String deptName = emp.getDeptName();
		List<CommuteVO> commuteList = commuteService.getDeptCommute(deptName);
		model.addAttribute("commuteList", commuteList);
		return url;
	}
	
	@RequestMapping(value="/comm/getCommute", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCommute(@RequestBody Map<String, Object> map) throws Exception {
		String empNo = String.valueOf(map.get("empNo"));
		String empName = String.valueOf(map.get("empName"));
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpNo(empNo);
		emp.setEmpName(empName);
		List<CommuteVO> commuteList = commuteService.getEmpCommute(emp);
		
		List<Map<String, String>> list = new ArrayList<>();
		
		for(CommuteVO commute : commuteList) {
			Map<String, String> cal = new HashMap<String, String>();
			Map<String, String> cal2 = new HashMap<String, String>();
			if(commute.getInTime() != null && commute.getOutTime() == null) {
				cal.put("title", commute.getInTime().split(" ")[1].substring(0, 5));
				cal.put("start", commute.getInTime().split(" ")[0]);
				cal.put("end", commute.getInTime().split(" ")[0]);
				cal.put("className", "fc-event-primary");
				list.add(cal);
			} else if(commute.getInTime() == null && commute.getOutTime() != null) {
				cal.put("title", commute.getOutTime().split(" ")[1].substring(0, 5));
				cal.put("start", commute.getOutTime().split(" ")[0]);
				cal.put("end", commute.getOutTime().split(" ")[0]);
				cal.put("className", "fc-event-primary");
				list.add(cal2);
			} else if(commute.getInTime() != null && commute.getOutTime() != null){
				cal.put("title", commute.getInTime().split(" ")[1].substring(0, 5));
				cal.put("start", commute.getInTime().split(" ")[0]);
				cal.put("end", commute.getInTime().split(" ")[0]);
				cal.put("className", "fc-event-primary");
				cal2.put("title", commute.getOutTime().split(" ")[1].substring(0, 5));
				cal2.put("start", commute.getOutTime().split(" ")[0]);
				cal2.put("end", commute.getOutTime().split(" ")[0]);
				cal2.put("className", "fc-event-danger");
				list.add(cal);
				list.add(cal2);
			}
		}
		
		List<HolidayVO> holidayList = holidayService.getHolidayList();
		
		for(HolidayVO holiday : holidayList) {
			Map<String, String> cal = new HashMap<>();
			cal.put("start", holiday.getHolidayDate());
			cal.put("end", holiday.getHolidayDate());
			cal.put("color", "#FFCCCC");
			cal.put("rendering", "background");
			list.add(cal);
		}
		
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/comm/manage/deptList")
	public String deptmain(Model model, HttpServletRequest request) throws Exception {
		String url = "commute/deptList";
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		String deptName = emp.getDeptName();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		
		cal.set(year, month - 1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		String yearMonth = "";
		if(month < 10) {
			yearMonth = year + "0" + month;
		} else {
			yearMonth = year + "" + month;
		}
		List<CommuteVO> commuteList = 
				commuteService.getDeptCommuteByMonth(deptName, Integer.parseInt(yearMonth));

		model.addAttribute("commuteList", commuteList);
		
		CommuteChangeVO commChange = new CommuteChangeVO();
		commChange.setDeptName(emp.getDeptName());
		commChange.setChangeTime(yearMonth);
		List<CommuteChangeVO> commChangeList = commuteChangeService.getCommuteChangeListByDept(commChange);
		
		model.addAttribute("commChangeList", commChangeList);
		
		return url;
	}
	
	@RequestMapping(value="/comm/getDay")
	public String getDay(String year, String month, String deptName, HttpSession session, Model model) throws Exception {
		String url = "commute/deptList";
		Calendar cal = Calendar.getInstance();

		cal.set(Integer.parseInt(year), Integer.parseInt(month) - 1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		List<CommuteVO> commuteList = commuteService.getDeptCommuteByMonth(deptName, Integer.parseInt(year + month));
	
		model.addAttribute("commuteList", commuteList);
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		CommuteChangeVO commChange = new CommuteChangeVO();
		commChange.setDeptName(emp.getDeptName());
		commChange.setChangeTime(year + month);
		List<CommuteChangeVO> commChangeList = commuteChangeService.getCommuteChangeListByDept(commChange);
		
		model.addAttribute("commChangeList", commChangeList);
		return url;
	}	
	
	@ResponseBody
	@RequestMapping("/commute")
	public CommuteVO commute(@RequestParam("qrCode") String qrCode) throws SQLException {
		EmployeeVO emp = employeeService.getEmpByQr(qrCode);

		// qu 정보 조회로 정보에서 사번 가져오기
		CommuteVO commuteVO = new CommuteVO();
		commuteVO.setEmpNo(emp.getEmpNo());
		commuteVO.setEmpName(emp.getEmpName());
		commuteVO.setDeptName(emp.getDeptName());
		commuteVO.setPsName(emp.getPsName());
		if(emp.getPsName().equals("대표이사")) {
			commuteVO.setPsLevel("1");
		}
		if(emp.getPsName().equals("이사")) {
			commuteVO.setPsLevel("2");
		}
		if(emp.getPsName().equals("부장")) {
			commuteVO.setPsLevel("3");
		}
		if(emp.getPsName().equals("차장")) {
			commuteVO.setPsLevel("4");
		}
		if(emp.getPsName().equals("과장")) {
			commuteVO.setPsLevel("5");
		}
		if(emp.getPsName().equals("대리")) {
			commuteVO.setPsLevel("6");
		}
		if(emp.getPsName().equals("주임")) {
			commuteVO.setPsLevel("7");
		}
		if(emp.getPsName().equals("사원")) {
			commuteVO.setPsLevel("8");
		}
		CommuteVO comm = commuteService.regist(commuteVO);
//		commuteService.updateWorkingTime(commuteVO);
		
		// 데이터 json 으로 출력
		return comm;
	}

	@RequestMapping("/comm/manage/deptStat")
	public String statMain(Model model, HttpServletRequest request) throws Exception {
		String url = "commute/deptStat";
		
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		String deptName = emp.getDeptName();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		
		cal.set(year, month - 1, 1);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		List<CommuteVO> commuteList = 
				commuteService.getDeptCommuteByMonth(deptName, Integer.parseInt(Integer.toString(year) + "0" + Integer.toString(month)));
		model.addAttribute("commuteList", commuteList);
		
		List<Map<String, Object>> list = new ArrayList<>(); 
		for(int i = 0; i < commuteList.size(); i++) {
			Map<String, Object> data = new HashMap<>();
			int normal = 0;
			int lazy = 0;
			List<String> lazyDay = new ArrayList<>(); 
			int earlygo = 0;
			List<String> earlygoDay = new ArrayList<>(); 
			int notIn = 0;
			List<String> notInDay = new ArrayList<>(); 
			if(commuteList.get(i).getInType() != null && commuteList.get(i).getOutType() != null) {
				String[] inType = commuteList.get(i).getInType().split(",");
				String[] inTime = commuteList.get(i).getInTime().split(",");
				String[] outType = commuteList.get(i).getOutType().split(",");
				for(int j = 0; j < outType.length; j++) {
					if(inType[j].equals("출근") && outType[j].equals("퇴근")) {
						normal++;
					} else if(inType[j].equals("지각")) {
						lazy++;
						lazyDay.add(inTime[j].split(" ")[0]);
					} else if(outType[j].equals("조퇴")) {
						earlygo++;
						earlygoDay.add(inTime[j].split(" ")[0]);
					} else {
						notIn++;
						notInDay.add(inTime[j].split(" ")[0]);
					}
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
			list.add(data);
		}
		model.addAttribute("list", list);
		return url;
	}
	
	@RequestMapping("/comm/getDayStat")
	public String getDayStat(String year, String month, String deptName, Model model) throws Exception {
		String url = "commute/deptStat";
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		List<CommuteVO> commuteList = commuteService.getDeptCommuteByMonth(deptName, Integer.parseInt(year + month));
		model.addAttribute("commuteList", commuteList);
		
		List<Map<String, Object>> list = new ArrayList<>(); 
		for(int i = 0; i < commuteList.size(); i++) {
			Map<String, Object> data = new HashMap<>();
			int normal = 0;
			int lazy = 0;
			List<String> lazyDay = new ArrayList<>(); 
			int earlygo = 0;
			List<String> earlygoDay = new ArrayList<>(); 
			int notIn = 0;
			List<String> notInDay = new ArrayList<>(); 
			if(commuteList.get(i).getInType() != null && commuteList.get(i).getOutType() != null) {
				String[] inType = commuteList.get(i).getInType().split(",");
				String[] inTime = commuteList.get(i).getInTime().split(",");
				String[] outType = commuteList.get(i).getOutType().split(",");
				for(int j = 0; j < outType.length; j++) {
					if(inType[j].equals("출근") && outType[j].equals("퇴근")) {
						normal++;
					} else if(inType[j].equals("지각")) {
						lazy++;
						lazyDay.add(inTime[j].split(" ")[0]);
					} else if(outType[j].equals("조퇴")) {
						earlygo++;
						earlygoDay.add(inTime[j].split(" ")[0]);
					} else {
						notIn++;
						notInDay.add(inTime[j].split(" ")[0]);
					}
				}
			}
			data.put("normal", normal);
			data.put("lazy", lazy);
			data.put("lazyDay", lazyDay);
			data.put("earlygo", earlygo);
			data.put("earlygoDay", earlygoDay);
			data.put("notIn", notIn);
			data.put("notInDay", notInDay);
			list.add(data);
		}
		model.addAttribute("list", list);
		
		return url;
	}
	
	@RequestMapping("/comm/editIntype")
	@ResponseBody
	public Map<String, Object> editInType(@RequestBody Map<String, Object> map) throws Exception {
		String commuteNo = String.valueOf(map.get("commuteNo"));
		String inType = String.valueOf(map.get("inType"));
		CommuteVO comm = new CommuteVO();
		comm.setCommuteNo(commuteNo);
		comm.setInType(inType);
		
		CommuteVO commute = commuteService.getCommuteByCommuteNo(comm.getCommuteNo());

		if(inType.equals("출근")) {
			comm.setOutType("퇴근");
		} else {
			comm.setOutType(commute.getOutType());
		}

		commuteService.updateInType(comm);
		
		CommuteChangeVO commuteChange = new CommuteChangeVO();
		commuteChange.setCommuteNo(commuteNo);
		commuteChange.setChangeEmpNo(commute.getEmpNo());
		commuteChange.setChangeEmpName(commute.getEmpName());
		commuteChange.setFormerInType(commute.getInType());
		commuteChange.setDeptName(commute.getDeptName());
		commuteChange.setChangeInType(inType);
		commuteChangeService.reigstCommuteChange(commuteChange);
		
		return map;
	}
	
	@GetMapping("/comm/excel/download")
    public void excelDownload(HttpServletResponse response, CommuteExcelCommand commReq) throws IOException {
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        
        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue(commReq.getYearMonth() + "월 " + commReq.getDeptName() + " 출근 기록");
        
        // Body
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("");
        cell = row.createCell(1);
        cell.setCellValue("");
        for (int i = 0; i < commReq.getDay().length; i++) {
        	cell = row.createCell(i+2);
            cell.setCellValue(commReq.getDay()[i]);
        }
        
        int cnt1 = 0;
        int cnt2 = 0;
        int cnt3 = 0;
        for(int i = 0; i < commReq.getEmpName().length; i++) {
        	row = sheet.createRow(rowNum++);
        	cell = row.createCell(0);
        	cell.setCellValue(commReq.getEmpName()[i]);
            cell = row.createCell(1);
            cell.setCellValue(commReq.getPsName()[i]);
        	for(int j = 0; j < commReq.getDay().length; j++) {
        		cell = row.createCell(j + 2);
        		cell.setCellValue(commReq.getInTime()[cnt1++]);
        	}
        	row = sheet.createRow(rowNum++);
        	for(int j = 0; j < commReq.getDay().length; j++) {
        		cell = row.createCell(0);
        		cell.setCellValue("");
        		cell = row.createCell(1);
        		cell.setCellValue("");
        		cell = row.createCell(j + 2);
        		cell.setCellValue(commReq.getOutTime()[cnt2++]);
        	}
        	row = sheet.createRow(rowNum++);
        	for(int j = 0; j < commReq.getDay().length; j++) {
        		cell = row.createCell(0);
        		cell.setCellValue("");
        		cell = row.createCell(1);
        		cell.setCellValue("");
        		cell = row.createCell(j + 2);
        		cell.setCellValue(commReq.getInType()[cnt3++]);
        	}
        }
        
        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel;charset=utf-8");
        String title = commReq.getDeptName() + "_" + commReq.getYearMonth() + "월_출퇴근기록.xlsx";
        title = new String(title.getBytes("KSC5601"), "8859_1");
        response.setHeader("Content-Disposition", "attachment;filename=" + title);

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
	
}
