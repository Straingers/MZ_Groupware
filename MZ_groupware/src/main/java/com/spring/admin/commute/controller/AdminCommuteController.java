package com.spring.admin.commute.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.commute.dto.HolidayVO;
import com.spring.admin.commute.service.HolidayService;
import com.spring.command.AdminCommuteExcelCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.CommuteVO;
import com.spring.dto.DepartmentVO;
import com.spring.service.CommuteService;
import com.spring.service.DepartmentService;

@Controller
@RequestMapping("/admin")
public class AdminCommuteController {

	@Autowired
	private HolidayService holidayService;
	
	@Autowired
	private CommuteService commuteService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/comm/monlist")
	public String commMain(Model model) throws Exception {
		String url = "admin/commute/workingDay";
		
		List<HolidayVO> holidayList = holidayService.getHolidayList();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if(holidayList != null) {
			for(HolidayVO holiday : holidayList) {
				Map<String, Object> dataMap = new HashMap<String, Object>();
				dataMap.put("start", holiday.getHolidayDate());
				dataMap.put("end", holiday.getHolidayDate());
				dataMap.put("color", "#FFCCCC");
				dataMap.put("rendering", "background");
				list.add(dataMap);
			}
			model.addAttribute("list", list);
		}
		return url;
	}
	
	@RequestMapping(value="/comm/registOrDelete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registOrDeleteHoliday(@RequestBody Map<String, Object> map) throws Exception {
		
		String holidayDate = String.valueOf(map.get("holidayDate"));
		
		int cnt = holidayService.checkHoliday(holidayDate);
		
		HolidayVO holiday = new HolidayVO();
		holiday.setHolidayDate(holidayDate);
		holiday.setHolidayName("휴무");
		
		int flag = 0;
		if(cnt < 1) {
			holidayService.registHoliday(holiday);
			flag = 1;
		} else {
			holidayService.removeHoliday(holiday);
		}
		map.put("flag", flag);
		
		return map;
	}
	
	@RequestMapping("/commstat/list")
	public String empStatMain(Model model, SearchCriteria cri) throws Exception {
		String url = "admin/commute/empCommuteStat";
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		
		cal.set(year, month - 1, 1);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("department", cri.getTempStr());
		
		List<DepartmentVO> deptList = departmentService.getList();
		model.addAttribute("deptList", deptList);
		
		cri.setTime(Integer.toString(year) + "0" + Integer.toString(month));
		cri.setTempStr("");
		Map<String, Object> dataMap = commuteService.getAllCommute(cri);
		model.addAttribute("dataMap", dataMap);

		List<CommuteVO> commuteList = (List<CommuteVO>) dataMap.get("commuteList");
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
	
	@RequestMapping("/commstat/getDate")
	public String getDate(Model model, String year, String month, String tempStr, SearchCriteria cri) throws Exception {
		String url = "admin/commute/empCommuteStat";
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("department", tempStr);
		
		cri.setTime(year + month);
		cri.setTempStr(tempStr);
		Map<String, Object> dataMap = commuteService.getAllCommute(cri);
		model.addAttribute("dataMap", dataMap);
		
		List<DepartmentVO> deptList = departmentService.getList();
		model.addAttribute("deptList", deptList);
		
		List<CommuteVO> commuteList = (List<CommuteVO>) dataMap.get("commuteList");
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
					} 
				}
			}
			if(commuteList.get(i).getInType() == null) {
				notIn++;
				notInDay.add(commuteList.get(i).getInTime());
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
	
	@GetMapping("/excel/download")
    public void excelDownload(HttpServletResponse response, AdminCommuteExcelCommand excelReq) throws IOException {
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell = row.createCell(2);
        cell.setCellValue("부서");
        cell = row.createCell(3);
        cell.setCellValue("정상출근");
        cell = row.createCell(4);
        cell.setCellValue("지각");
        cell = row.createCell(5);
        cell.setCellValue("조퇴");
        cell = row.createCell(6);
        cell.setCellValue("결근");

        // Body
        for (int i = 0; i < excelReq.getEmpName().length; i++) {
        	row = sheet.createRow(rowNum++);
        	cell = row.createCell(0);
            cell.setCellValue(i+1);
            cell = row.createCell(1);
            cell.setCellValue(excelReq.getEmpName()[i]);
            cell = row.createCell(2);
            cell.setCellValue(excelReq.getDeptName()[i]);
            cell = row.createCell(3);
            cell.setCellValue(excelReq.getNormal()[i]);
            cell = row.createCell(4);
            cell.setCellValue(excelReq.getLazy()[i]);
            cell = row.createCell(5);
            cell.setCellValue(excelReq.getEarlygo()[i]);
            cell = row.createCell(6);
            cell.setCellValue(excelReq.getNotIn()[i]);
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel;charset=utf-8");
        String title = excelReq.getMonth() + "월_근태통계.xlsx";
        title = new String(title.getBytes("KSC5601"), "8859_1");
        response.setHeader("Content-Disposition", "attachment;filename=" + title);

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
}
