package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.AdminCompMemberExcelCommand;
import com.spring.command.AdminMemberStatusCommand;
import com.spring.command.EmployeeModifyCommand;
import com.spring.command.EmployeeRegistCommand;
import com.spring.command.SearchCriteria;
import com.spring.dto.DepartmentVO;
import com.spring.dto.EmployeeVO;
import com.spring.dto.IpManageVO;
import com.spring.member.history.dto.TransferHistoryVO;
import com.spring.member.history.service.TransferHistoryService;
import com.spring.position.dto.PositionVO;
import com.spring.position.service.PositionService;
import com.spring.service.DepartmentService;
import com.spring.service.EmployeeService;
import com.spring.service.IpManageService;
import com.spring.utils.MakeFileName;

@Controller
public class EmployeeController {

	private final EmployeeService employeeService;
	private final IpManageService ipManagerService;
	private final DepartmentService departmentService;
	private final PositionService positionService;
	private final TransferHistoryService transferhistoryService;
	
	@Autowired
	public EmployeeController(EmployeeService 	employeeService
							, IpManageService 	ipManagerService
							, DepartmentService departmentService
							, PositionService 	positionService
							, TransferHistoryService transferhistoryService) {
		this.employeeService 	= employeeService;
		this.ipManagerService 	= ipManagerService;
		this.departmentService 	= departmentService;
		this.positionService 	= positionService;
		this.transferhistoryService = transferhistoryService;
	}
	
	@Resource(name="memberPicturePath")
	private String picturePath;
	
	
	// 전직원 목록 조회 + 검색, 페이징 기능 추가
	@RequestMapping("admin/comp/member/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "admin/comp/member/list";
		
		Map<String, Object> dataMap = employeeService.getEmployeeList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("emp/list")
	public ModelAndView list(ModelAndView mnv) throws SQLException {
		String url = "emp/list";

		List<EmployeeVO> empList = employeeService.getList();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("empList", empList);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("emp/detail")
	public ModelAndView detail(String qrCode, ModelAndView mnv) throws SQLException {
		String url = "emp/detail";

		EmployeeVO emp = employeeService.getEmpByQr(qrCode);
		mnv.addObject("emp", emp);
		mnv.setViewName(url);

		return mnv;
	}

//	@RequestMapping("/comm/qr")
//	public String checkIn(@RequestParam String qrCode) {
//		String u
//		return "실패쓰";
//	}

	@RequestMapping("emp/qrRead")
	public String qrRead(HttpServletRequest request) throws SQLException {
		String url = "";
		
		List<IpManageVO> ipList = ipManagerService.getAvailableList();
		for(IpManageVO ip : ipList) {
			if((request.getRemoteAddr()).equals(ip.getIpAddress())) {
				System.out.println(":::::디비 내 허용 아이피:::::)))" + ip.getIpAddress());
				System.out.println(":::::::::접속 아이피:::::::::)))" + request.getRemoteAddr());
				url = "emp/qrRead";
				return url;
			} else {
				System.out.println(":::::::허용되지 않은 IP::::::)))" + request.getRemoteAddr());
				url = "emp/qrReadDenied";
			}
		}
		return url;
	}
	
	@RequestMapping("emp/qrDetail")
	public ModelAndView qrDetail(String qrCode, ModelAndView mnv) throws SQLException {
		String url = "emp/qrDetail";
		
		EmployeeVO emp = employeeService.getEmpByQr(qrCode);
		mnv.addObject("emp", emp);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 부서명 기준 해당 직원 조회 = jsTree 사용 코드
	@RequestMapping(value="admin/comp/group/getdeptCodeByName")
	@ResponseBody
	public ResponseEntity<List<EmployeeVO>> employeeListByDeptName(@RequestParam("deptName") String deptName) throws Exception {
		ResponseEntity<List<EmployeeVO>> entity = null;
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		
		try {
			employeeList = employeeService.getListByDeptName(deptName);
			
			entity = new ResponseEntity<List<EmployeeVO>>(employeeList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<EmployeeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 전직원 조회 ==> 비동기 코드
	@RequestMapping(value="admin/comp/group/getEmployee")
	@ResponseBody
	public ResponseEntity<List<EmployeeVO>> employeeListByDeptName() throws Exception{
		ResponseEntity<List<EmployeeVO>> entity = null;
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		
		try {
			employeeList = employeeService.getList();
			
			entity = new ResponseEntity<List<EmployeeVO>>(employeeList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<EmployeeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	
	
	// 인사등록 페이지 출력
	@RequestMapping("admin/comp/member/registForm")
	public ModelAndView memberRegist(ModelAndView mnv) throws SQLException {
		String url = "admin/comp/member/regist";
				
		List<DepartmentVO> departmentList = departmentService.getDepartmentListY();
		List<PositionVO> positionList = positionService.getPositionListY();
		mnv.addObject("departmentList",departmentList);
		mnv.addObject("positionList", positionList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 이미지 업로드
	// 파일 업로드 비동기 방식 ==> ajax에 처리 여부만 알림
	// 파일명 고유해야 하므로 savePicture 메서드 사용
	// Rest 방식으로 처리 결과를 보냄.(ResponseBody)
	// 한글 파일 명은 헤더에 오기 때문에 깨짐 방지로 produces = "text/plain;charset=utf-8"
	@RequestMapping(value = "admin/comp/member/picture", method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception{
		ResponseEntity<String> entity = null;
		
		String result = "";
		HttpStatus status = null;
		
		/*파일 저장 확인*/
		if((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}
		
		entity = new ResponseEntity<String>(result, status);
		
		return entity;
	}
	
	// 지워야 할 파일, 저장할 파일 확인
	// multiFile을 직접 받아와서 -> Java 형식으로 변경하면서 저장. (transferTo) ==> 별도의 Parser가 필요없어짐.
	//==> 지정된 경로에 지정한 파일이름으로 저장
	//사진 삭제
	// SpringMVC를 사용하는 이유? Spring 인프라 사용하며 Controller에 집중할 수있다. 나머지 제반 사항은 힘을 빼도 되는 것.
	//이미지 저장(DB 저장이 아닌 파일만 저장)
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;
		
		/*파일 유무 확인*/
		if(!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			/* 파일 저장 폴더 설정 */
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);
			
			storeFile.mkdirs();
			
			// local HDD 에 저장.
			multi.transferTo(storeFile);
			
			if(oldPicture != null && !oldPicture.isEmpty()) { // Empty보다 null 판단이 먼저
				File oldFile = new File(uploadPath, oldPicture);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
	// UUID 코드 반환
	@RequestMapping("admin/comp/member/createQR_UUID")
	@ResponseBody
	public ResponseEntity<String> picture() throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			String qrCodeUUID = UUID.randomUUID().toString();
			entity = new ResponseEntity<String>(qrCodeUUID,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 사번 비동기 체크
	@RequestMapping("admin/comp/member/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String empNo) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			EmployeeVO employee = employeeService.getEmployee(empNo);
			if(employee != null) {
				entity = new ResponseEntity<String>("duplicated",HttpStatus.OK);
			} else { 
				entity = new ResponseEntity<String>("",HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//사번 자동 발급
	@RequestMapping("admin/comp/member/getEmpNo")
	@ResponseBody
	public ResponseEntity<String> getEmpNo() throws Exception{
		ResponseEntity<String> entity = null;
		try {
			String empNo = String.valueOf(employeeService.getEmpNo());
			entity = new ResponseEntity<String>(empNo,HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 입사처리 
	@RequestMapping("admin/comp/member/regist")
	public String regist(EmployeeRegistCommand employeeReq) throws SQLException, IOException{
		String url = "admin/comp/member/regist_success";
		
		EmployeeVO employee = employeeReq.toEmployeeVO();
		employeeService.regist(employee);
		
		return url;
	}
	
	// 직원 상세 폼.
	@RequestMapping("admin/comp/member/detail")
	public ModelAndView adminMemberdetail(String empNo, ModelAndView mnv) throws SQLException{
		String url = "admin/comp/member/detail";
		
		EmployeeVO employee = employeeService.getEmployee(empNo);
		mnv.addObject("employee",employee);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 직원 상세정보창 - 이미지 내보내기
	@RequestMapping(value="admin/comp/member/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String empPhoto) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {
			in = new FileInputStream(new File(imgPath, empPhoto));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (IOException e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	// 직원 수정 폼
	@RequestMapping(value = "admin/comp/member/modifyForm", method = RequestMethod.GET)
	public ModelAndView modify(String empNo, ModelAndView mnv) throws SQLException {
		String url = "admin/comp/member/modify";
		
		EmployeeVO employee = employeeService.getEmployee(empNo);
		List<DepartmentVO> departmentList = departmentService.getDepartmentListY();
		List<PositionVO> positionList = positionService.getPositionListY();
		
		mnv.addObject("employee",employee);
		mnv.addObject("departmentList",departmentList);
		mnv.addObject("positionList", positionList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 수정 적용
	@RequestMapping(value="admin/comp/member/modify", method=RequestMethod.POST)
	public String modify(EmployeeModifyCommand modifyReq, HttpSession session, Model model) throws Exception {
		String url = "admin/comp/member/modify_success"; 
		EmployeeVO employee = modifyReq.toEmployee();
		
		// 신규 파일 변경 및 기존 파일 삭제
		String fileName = savePicture(modifyReq.getOldPicture(), modifyReq.getPicture());
		employee.setEmpPhoto(fileName);
		
		// 파일 변경 없을 시 기존 파일 명 유지
		if(modifyReq.getPicture().isEmpty()) {
			employee.setEmpPhoto(modifyReq.getOldPicture());
		}
		
		//DB 내용 수정
		employeeService.modify(employee);
		
		// 로그인한 사용자의 경우 수정된 정보로 session 업로드
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		if (loginUser != null && employee.getEmpNo().equals(loginUser.getEmpNo())) {
			session.setAttribute("loginUser", employee);
		}
		
		model.addAttribute("employee",employeeService.getEmployee(modifyReq.getEmpNo()));
		
		return url;
	}
	
	// 삭제
	// success 후 메시지를 넘길 때, member의 정보가 필요할 수 있어서 model에 member를 담는다.
	// 회원을 삭제할 때, 반드시 이미지를 삭제한 뒤, member를 삭제한다.
	@RequestMapping(value = "admin/comp/member/remove")
	@ResponseBody
	public ResponseEntity<String> remove(String empNo, HttpSession session) throws SQLException {
		ResponseEntity<String> entity = null;
		try {
			// 이미지 파일을 삭제
			 EmployeeVO employee = employeeService.getEmployee(empNo);
			
			String savePath = this.picturePath;
			if(employee.getEmpPhoto()!=null) {
				File imageFile = new File(savePath, employee.getEmpPhoto());
				if(imageFile.exists()) {
					imageFile.delete();
				}
			}
			
			
			// DB 삭제
			employeeService.remove(empNo);
			
			// 삭제되는 회원이 로그인 회원인 경우 로그아웃 해야함.
			EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			if(loginUser.getEmpNo().equals(employee.getEmpNo())) {
				session.invalidate();
			}
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 엑셀 Export
	@GetMapping("admin/comp/member/excelDownload")
	public void excelDownload(HttpServletResponse response, AdminCompMemberExcelCommand excelReq) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("직원 목록 출력");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		// Header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
        cell.setCellValue("NO");
        cell = row.createCell(1);
        cell.setCellValue("사번");
        cell = row.createCell(2);
        cell.setCellValue("이름");
        cell = row.createCell(3);
        cell.setCellValue("부서");
        cell = row.createCell(4);
        cell.setCellValue("직위");
        cell = row.createCell(5);
        cell.setCellValue("내선번호");
        cell = row.createCell(6);
        cell.setCellValue("입사일");
        cell = row.createCell(7);
        cell.setCellValue("상태");
        
        // Body
        for (int i = 0; i < excelReq.getEmpName().length; i++) {
        	row = sheet.createRow(rowNum++);
        	cell = row.createCell(0);
            cell.setCellValue(i+1);
            cell = row.createCell(1);
            cell.setCellValue(excelReq.getEmpNo()[i]);
            cell = row.createCell(2);
            cell.setCellValue(excelReq.getEmpName()[i]);
            cell = row.createCell(3);
            cell.setCellValue(excelReq.getDeptName()[i]);
            cell = row.createCell(4);
            cell.setCellValue(excelReq.getPsName()[i]);
            cell = row.createCell(5);
            cell.setCellValue(excelReq.getEmpTel()[i]);
            cell = row.createCell(6);
            cell.setCellValue(excelReq.getStrEmpCreateDate()[i]);
            cell = row.createCell(7);
            cell.setCellValue(excelReq.getEmpStatus()[i]);
        }
        // 컨텐츠 타입과 파일명 지정
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int year = cal.get(cal.YEAR);

        int month = cal.get(cal.MONTH)+1;

        
        response.setContentType("ms-vnd/excel;charset=utf-8");
        String title = String.valueOf(year) + String.valueOf(month) + "직원목록.xlsx";
        title = new String(title.getBytes("utf-8"), "8859_1");
        response.setHeader("Content-Disposition", "attachment;filename=" + title);
        
        
        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
	}
	
	// 인사이동 페이지 출력.
	@RequestMapping("admin/comp/member/status/modify")
	public ModelAndView employeeStatusModify(String empNo, ModelAndView mnv) throws SQLException{
		String url = "admin/comp/member/member_status_modify";
		EmployeeVO employee = employeeService.getEmployee(empNo);
		List<PositionVO> positionList = positionService.getPositionHighPosition(employee.getPsLevel());
		List<TransferHistoryVO> transferHistoryList = transferhistoryService.getTransferHistoryEmpNo(empNo);
		List<DepartmentVO> departmentList = departmentService.getDepartmentListY();
		List<PositionVO> positionListAll = positionService.getPositionListY();
		
		mnv.addObject("employee", employee);
		mnv.addObject("positionList", positionList);
		mnv.addObject("transferHistoryList", transferHistoryList);
		mnv.addObject("departmentList", departmentList);
		mnv.addObject("positionListAll", positionListAll);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 인사이동 - 승진처리
	@RequestMapping("admin/comp/member/promotion/modify")
	@ResponseBody
	public ResponseEntity<String> memberPromotionModify(AdminMemberStatusCommand req) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			EmployeeVO employee = req.toEmployeeVO();
			TransferHistoryVO transferHistory = req.toTransferHistoryVO();
			
			employeeService.modifyEmployeePsCodeByEmpNo(employee);
			transferhistoryService.regist(transferHistory);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 인사이동 - 이동처리
	@RequestMapping("admin/comp/member/change/modify")
	@ResponseBody
	public ResponseEntity<String> memberChangeModify(AdminMemberStatusCommand req) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			EmployeeVO employee = req.toEmployeeVO();
			TransferHistoryVO transferHistory = req.toTransferHistoryVO();
			
			employeeService.modifyEmployeePsCodeDeptCodeByEmpNo(employee);
			transferhistoryService.regist(transferHistory);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 인사이동 - 휴직처리
	@RequestMapping("admin/comp/member/leave/modify")
	@ResponseBody
	public ResponseEntity<String> memberLeaveModify(AdminMemberStatusCommand req) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			EmployeeVO employee = req.toEmployeeVO();
			TransferHistoryVO transferHistory = req.toTransferHistoryVO();
			
			employeeService.modifyEmployeeEmpStatusByEmpNo(employee);
			transferhistoryService.regist(transferHistory);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 인사이동 - 복직처리
	@RequestMapping("admin/comp/member/reinstate/modify")
	@ResponseBody
	public ResponseEntity<String> memberReinstateModify(AdminMemberStatusCommand req) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			EmployeeVO employee = req.toEmployeeVO();
			TransferHistoryVO transferHistory = req.toTransferHistoryVO();
			
			employeeService.modifyEmployeeEmpStatusByEmpNo(employee);
			transferhistoryService.regist(transferHistory);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 인사이동 - 퇴사처리
	@RequestMapping("admin/comp/member/resign/modify")
	@ResponseBody
	public ResponseEntity<String> memberResignModify(AdminMemberStatusCommand req) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			EmployeeVO employee = req.toEmployeeVO();
			TransferHistoryVO transferHistory = req.toTransferHistoryVO();
			
			employeeService.modifyEmployeeEmpStatusByEmpNo(employee);
			transferhistoryService.regist(transferHistory);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 조직도 페이지 출력.
	@RequestMapping("admin/comp/member/org/list")
	public String orgChart() throws SQLException{
		String url = "admin/comp/member/org/list";
		return url;
	}
	
	// 조직도 트리 세팅
	@RequestMapping(value="admin/comp/member/org/getJson",produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> memberGetJson() throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		//최종 완성될 JSONObject 선언(전체)
		Map<String,Object> dataSource = new HashMap<String,Object>();
        //person의 JSON정보를 담을 Array 선언
		
        int count = 1;
		EmployeeVO employee = employeeService.getEmployeeCEO();
        dataSource.put("id", count);
        dataSource.put("name", "대표이사");
        dataSource.put("className", employee.getEmpPhoto());
        dataSource.put("collapsed", false);
        dataSource.put("title", "<div class='table-responsive'><input type='hidden' id='"+ employee.getEmpNo() +"'/>"
        		+ "<table class='table table-hover' style='overflow:auto; text-align: center;'>"
        		+ "<tbody><tr><td>"+ employee.getEmpName() +"</td><td>" + employee.getPsName() + "</td></tr><tr><td colspan='2'>" + employee.getEmpTel() + "</td></tr></tbody>"
        		+ "</table></div>");
        
        List<EmployeeVO> employeeListDepartment = employeeService.getEmployeeDepartment();
        List<Map<String,Object>> children = new ArrayList<Map<String,Object>>();
        
        for(EmployeeVO employee1 : employeeListDepartment) {
        	count++;
        	Map<String,Object> employeeDepartment = new HashMap<String,Object>();
        	employeeDepartment.put("id", count);
        	employeeDepartment.put("name", employee1.getDeptName());
        	employeeDepartment.put("className", employee1.getEmpPhoto());
        	employeeDepartment.put("collapsed", false);
        	employeeDepartment.put("title", "<div class='table-responsive'><input type='hidden' id='" + employee1.getEmpNo() + "'/>"
            		+ "<table class='table table-hover' style='overflow:auto; text-align: center;'>"
            		+ "<tbody><tr><td>"+ employee1.getEmpName() +"</td><td>" + employee1.getPsName() + "</td></tr><tr><td colspan='2'>" + employee1.getEmpTel() + "</td></tr></tbody>"
            		+ "</table></div>");
        	
        	EmployeeVO deptSuper = new EmployeeVO();
        	deptSuper.setDeptSuper(employee1.getDeptCode());
        	List<EmployeeVO> teamJang = employeeService.getEmployeeTeamjang(deptSuper);
        	List<Map<String,Object>> children2 = new ArrayList<Map<String,Object>>();
        	
        	for(EmployeeVO employee2 : teamJang) {
        		count++;
        		Map<String,Object> employeeTeamJang = new HashMap<String,Object>();
        		employeeTeamJang.put("id", count);
        		employeeTeamJang.put("name", employee2.getDeptName());
        		employeeTeamJang.put("className", employee2.getEmpPhoto());
        		employeeTeamJang.put("collapsed", false);
        		employeeTeamJang.put("title", "<div class='table-responsive node2'><input type='hidden' id='" + employee2.getEmpNo() + "'/>"
                		+ "<table class='table table-hover' style='overflow:auto; text-align: center;'>"
                		+ "<tbody><tr><td>"+ employee2.getEmpName() +"</td><td>" + employee2.getPsName() + "</td></tr><tr><td colspan='2'>" + employee2.getEmpTel() + "</td></tr></tbody>"
                		+ "</table></div>");
        		
        		EmployeeVO deptCode = new EmployeeVO();
        		deptCode.setDeptCode(employee2.getDeptCode());
        		List<EmployeeVO> team = employeeService.getEmployeeTeam(deptCode);
        		List<Map<String,Object>> children3 = new ArrayList<Map<String,Object>>();
        		
        		for(EmployeeVO employee3 : team) {
        			count++;
        			Map<String,Object> employeeTeam = new HashMap<String,Object>();
        			employeeTeam.put("id", count);
        			employeeTeam.put("name", employee3.getDeptName());
        			employeeTeam.put("className", employee3.getEmpPhoto());
        			employeeTeam.put("collapsed", false);
        			employeeTeam.put("title", "<div class='table-responsive node3'><input type='hidden' id='" + employee3.getEmpNo() + "'/>"
                    		+ "<table class='table table-hover' style='overflow:auto; text-align: center;'>"
                    		+ "<tbody><tr><td>"+ employee3.getEmpName() +"</td><td>" + employee3.getPsName() + "</td></tr><tr><td colspan='2'>" + employee3.getEmpTel() + "</td></tr></tbody>"
                    		+ "</table></div>");
        			children3.add(employeeTeam);
        		}
        		employeeTeamJang.put("children", children3);
        		
        	children2.add(employeeTeamJang);
        	}
        	employeeDepartment.put("children", children2);
        	
        	children.add(employeeDepartment);
        }
        dataSource.put("children",children);
        entity = new ResponseEntity<Map<String,Object>>(dataSource,HttpStatus.OK);
        
        return entity;
	}
	
	
	
	// 즐겨찾는 직원 조회 조회 ==> 비동기 코드
	@RequestMapping(value="admin/comp/group/getEmployeeFavorite")
	@ResponseBody
	public ResponseEntity<List<EmployeeVO>> employeeListFavoirite(HttpSession session) throws Exception{
		ResponseEntity<List<EmployeeVO>> entity = null;
		List<EmployeeVO> employeeList = new ArrayList<EmployeeVO>();
		
		// 로그인한 사용자의 경우 수정된 정보로 session 업로드
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
			
		try {
			employeeList = employeeService.selectEmployeeFavorite(loginUser);
			for(EmployeeVO employee : employeeList) {
			}
			
			entity = new ResponseEntity<List<EmployeeVO>>(employeeList,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<EmployeeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//주소록 엑셀 출력// 엑셀 Export
	@RequestMapping("address/comp/memberExport")
	@ResponseBody
	public ResponseEntity<String> addressExcelDownload(HttpServletResponse response,@RequestBody List<Map<String,String>> excelReq) throws IOException {
		ResponseEntity<String> entity = null;
		try {
			response.setContentType("text/html; charset=UTF-8");
			Workbook wb = new XSSFWorkbook();
			Sheet sheet = wb.createSheet("직원 목록 출력");
			Row row = null;
			Cell cell = null;
			int rowNum = 0;
			
			// Header
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
	        cell.setCellValue("NO");
	        cell = row.createCell(1);
	        cell.setCellValue("사번");
	        cell = row.createCell(2);
	        cell.setCellValue("이름");
	        cell = row.createCell(3);
	        cell.setCellValue("부서");
	        cell = row.createCell(4);
	        cell.setCellValue("직위");
	        cell = row.createCell(5);
	        cell.setCellValue("내선번호");
	        cell = row.createCell(6);
	        cell.setCellValue("입사일");
	        cell = row.createCell(7);
	        cell.setCellValue("상태");
	        
	        // Body
	        for (int i = 0; i < excelReq.size(); i++) {
	        	row = sheet.createRow(rowNum++);
	        	cell = row.createCell(0);
	            cell.setCellValue(i+1);
	            cell = row.createCell(1);
	            cell.setCellValue(excelReq.get(i).get("empNo"));
	            cell = row.createCell(2);
	            cell.setCellValue(excelReq.get(i).get("empName"));
	            cell = row.createCell(3);
	            cell.setCellValue(excelReq.get(i).get("deptName"));
	            cell = row.createCell(4);
	            cell.setCellValue(excelReq.get(i).get("psName"));
	            cell = row.createCell(5);
	            cell.setCellValue(excelReq.get(i).get("empTel"));
	            cell = row.createCell(6);
	            cell.setCellValue(excelReq.get(i).get("empCreateDate"));
	            cell = row.createCell(7);
	            cell.setCellValue(excelReq.get(i).get("empStatus"));
	        }
	        // 컨텐츠 타입과 파일명 지정
	        java.util.Calendar cal = java.util.Calendar.getInstance();
	        int year = cal.get(cal.YEAR);
	
	        int month = cal.get(cal.MONTH)+1;
	              
	        response.setContentType("ms-vnd/excel;charset=utf-8");
	        String title = String.valueOf(year) + String.valueOf(month) + "직원목록.xlsx";
	        title = new String(title.getBytes("utf-8"), "8859_1");
	        response.setHeader("Content-Disposition", "attachment;filename=" + title);
	        
	        
	        // Excel File Output
	        wb.write(response.getOutputStream());
	        wb.close();
	        
	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
        
		return entity;
	}
}
