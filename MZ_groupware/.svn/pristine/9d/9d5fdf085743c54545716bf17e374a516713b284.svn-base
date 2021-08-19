package com.spring.task.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.command.TaskReportModifyCommand;
import com.spring.command.TaskReportRegistCommand;
import com.spring.dto.EmployeeVO;
import com.spring.mypage.dto.TaskReceiverLineVO;
import com.spring.mypage.service.TaskReceiverLineService;
import com.spring.task.dto.TaskAttachVO;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;
import com.spring.task.service.TaskHistoryService;
import com.spring.task.service.TaskService;
import com.spring.task.utils.GetTaskAttachesAsMultipartFiles;

@Controller
public class TaskReportController {

    private final TaskService taskService;
    private final TaskHistoryService taskHistoryService;
    private final TaskReceiverLineService taskLineService;

    @Autowired
    public TaskReportController(TaskService taskService, TaskHistoryService taskHistoryService, TaskReceiverLineService taskLineService) {
        this.taskService = taskService;
        this.taskHistoryService = taskHistoryService;
        this.taskLineService = taskLineService;
    }
    
    @Resource(name="reportAttachUploadPath")
    private String reportAttachUploadPath;

    @RequestMapping("/task/share/uncheck/list")
    public String uncheckList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("share");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String, Object> dataMap = taskService.getUncheckTaskList(taskReportVO);
    	model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "uncheck");
    	model.addAttribute("pageTaskType", "share");
    	
    	
        return "/task/taskReport/uncheckList";
    }

    @RequestMapping("/task/share/receive/list")
    public String receiveList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("share");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getReceiveTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
        model.addAttribute("pageType", "receive");
        model.addAttribute("pageTaskType", "share");

        return "/task/taskReport/receiveList";
    }

    @RequestMapping("/task/share/send/list")
    public String sendList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("share");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getSendTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "send");
    	model.addAttribute("pageTaskType", "share");

        return "/task/taskReport/sendList";
    }

    @RequestMapping("/task/share/temp/list")
    public String tempList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("share");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getTempTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "temp");
    	model.addAttribute("pageTaskType", "share");

        return "/task/taskReport/tempList";
    }
    
    @RequestMapping(value="/task/important/sendUpdate", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> updateSendImportant(@RequestBody Map<String, Object> dataMap) throws SQLException {
    	String taskNo = String.valueOf(dataMap.get("taskNo"));
    	String important = String.valueOf(dataMap.get("important"));
    	
    	TaskReportVO task = new TaskReportVO();
    	task.setTaskNo(Integer.parseInt(taskNo));
    	task.setTaskImportant(important);
    	
    	taskService.updateSendImportant(task);
    	
    	dataMap.put("star", important);
    	
    	return dataMap;	
    }
    
    @RequestMapping(value="/task/important/receiveUpdate", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> updateReceiveImportant(@RequestBody Map<String, Object> dataMap, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	String taskNo = String.valueOf(dataMap.get("taskNo"));
    	String important = String.valueOf(dataMap.get("important"));
    	
    	TaskHistoryVO task = new TaskHistoryVO();
    	task.setTaskNo(Integer.parseInt(taskNo));
    	task.setTaskReceiveImportant(important);
    	task.setTaskReceiver(loginUser.getEmpNo());
    	
    	taskService.updateReceiveImportant(task);;
    	
    	dataMap.put("star", important);
    	
    	return dataMap;	
    }
    
    @RequestMapping(value="/task/important/send/list")
    public String importantSendList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("important");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String, Object> dataMap = taskService.selectSendImportantList(taskReportVO);
    	model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "send");
    	
    	
        return "/task/taskReport/importantSendList";
    }
    
    @RequestMapping(value="/task/important/receive/list")
    public String importantReceiveList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("important");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String, Object> dataMap = taskService.selectReceiverImportantList(taskReportVO);
    	model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "receive");
    	
    	
    	return "/task/taskReport/importantReceiveList";
    }
    
    
    
    
    @RequestMapping("/task/share/registForm")
    public String registForm(Model model, TaskReceiverLineVO taskReceiverLineVO, HttpSession session) throws Exception {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		taskReceiverLineVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> lineList = taskLineService.getLineList(taskReceiverLineVO);
		model.addAttribute("lineList", lineList.get("lineList"));
    	
        return "/task/taskReport/regist";
    }
    
    @RequestMapping(value="/task/line/detail", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
	public Map<String, Object> taskReceiveDetail(@RequestBody TaskReceiverLineVO taskReceiverLineVO, Model model) throws Exception {
		Map<String, Object> dataMap = taskLineService.getLine(taskReceiverLineVO);
		
		return dataMap;
	}

    @RequestMapping(value = "/task/share/regist", method = RequestMethod.POST)
    public String regist(TaskReportVO taskReport,
    					 TaskReportRegistCommand registReq,
    					 HttpServletRequest request,
                         HttpSession session,
                         Model model) throws Exception {
    	
    	taskService.removeTempReport(taskReport);
    	
        EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
        
        TaskReportVO task = registReq.toTaskReportVO();
        List<TaskAttachVO> attachList = GetTaskAttachesAsMultipartFiles.save(registReq.getUploadFile(), reportAttachUploadPath);
        task.setEmpNo(loginUser.getEmpNo());
        task.setAttachList(attachList);
        task.setTaskType("share");
        task.setTaskSubtype("업무공유");

        taskService.registTaskReport(task);
        
        String[] rec = task.getRecEmp().split(",");
        String[] cc = task.getCcEmp().split(",");
        String tmpEmp = "";
        for(String tmp : rec) {
        	tmpEmp += tmp + "/";
        }
        for(String tmp : cc) {
        	tmpEmp += tmp + "/";
        }
        model.addAttribute("empNo", tmpEmp.substring(0, tmpEmp.length() - 1));
        model.addAttribute("taskNo", task.getTaskNo());
        model.addAttribute("taskTitle", task.getTaskTitle());
        
        return "/task/save";
    }
    
    @RequestMapping("/task/share/detail")
    public String detail(Model model, int taskNo, TaskReportVO taskReportVO, HttpSession session) throws Exception {
    	
    	EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
    	Map<String, Object> dataMap = taskService.getTaskReport(taskNo);
    	
    	TaskReportVO task = (TaskReportVO) dataMap.get("task");
    	
    	
		List<TaskAttachVO> attachList = task.getAttachList();
    	if(attachList != null) {
    		for(TaskAttachVO attach : attachList) {
    			String fileName = attach.getAttachFilename().split("\\$\\$")[1];
    			attach.setAttachFilename(fileName);
    		}
    	}
    	
    	List<TaskHistoryVO> taskHistoryCc = (List<TaskHistoryVO>) dataMap.get("taskHistoryCc");
    	for(TaskHistoryVO cc : taskHistoryCc) {
    		if(emp.getEmpNo().equals(cc.getEmpNo())) {
    			TaskHistoryVO taskHistory = new TaskHistoryVO();
    			taskHistory.setTaskNo(task.getTaskNo());
    			taskHistory.setTaskReceiver(emp.getEmpNo());
    			taskHistoryService.updateSignStatus(taskHistory);
    			model.addAttribute("type", cc.getTaskReceiverType());
    		}
    	}
    	List<TaskHistoryVO> taskHistoryRec = (List<TaskHistoryVO>) dataMap.get("taskHistoryRec");
    	for(TaskHistoryVO rec : taskHistoryRec) {
    		if(emp.getEmpNo().equals(rec.getEmpNo())) {
    			model.addAttribute("type", rec.getTaskReceiverType());
    		}
    	}
    	
    	
    	
    	model.addAttribute("task", dataMap.get("task"));  	
    	model.addAttribute("taskHistoryRec", dataMap.get("taskHistoryRec"));  	
    	model.addAttribute("taskHistoryCc", dataMap.get("taskHistoryCc"));  	
    	
    	
    	return "/task/taskReport/detail";
    }
    
    // 첨부파일 조회
    @RequestMapping("/task/getFiles")
    public String getFile(int attachNo, Model model) throws Exception {
    	TaskAttachVO attach = taskService.getAttach(attachNo);
    	
    	model.addAttribute("savePath", attach.getAttachUploadpath());
    	model.addAttribute("fileName", attach.getAttachFilename());
    	
    	return "downloadFile";
    }
    
    // 업무확인 처리
    @RequestMapping(value="/task/sign", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> sign(@RequestBody Map<String, Object> dataMap, HttpSession session) throws Exception {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	String taskNo = String.valueOf(dataMap.get("taskNo"));
    	
    	TaskHistoryVO task = new TaskHistoryVO();
    	task.setTaskNo(Integer.parseInt(taskNo));
    	task.setTaskReceiver(loginUser.getEmpNo());
    	
    	taskHistoryService.updateSignStatus(task);
    	
    	return dataMap;
    }
    
    // 임시저장 기능
    @RequestMapping(value = "/task/share/tempRegist", method = RequestMethod.POST)
    public String tempRegist(TaskReportRegistCommand registReq,
					    	 HttpServletRequest request,
					         HttpSession session) throws Exception {
					
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		TaskReportVO task = registReq.toTaskReportVO();
		List<TaskAttachVO> attachList = GetTaskAttachesAsMultipartFiles.save(registReq.getUploadFile(), reportAttachUploadPath);
		task.setEmpNo(loginUser.getEmpNo());
		task.setAttachList(attachList);
		task.setTaskType("share");
		
		taskService.registTempReport(task);
		
		return "/task/save";
    }
	
    @RequestMapping(value="/task/share/modify", method=RequestMethod.GET)
    public String tempModifyForm(Model model, int taskNo, TaskReportVO taskReportVO, TaskReceiverLineVO taskReceiverLineVO, HttpSession session) throws SQLException {
    	Map<String, Object> dataMap = taskService.getTaskReport(taskNo);
    	TaskReportVO task = (TaskReportVO) dataMap.get("task");
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		taskReceiverLineVO.setEmpNo(loginUser.getEmpNo());
		
		Map<String, Object> lineList = taskLineService.getLineList(taskReceiverLineVO);
		model.addAttribute("lineList", lineList.get("lineList"));
    	
    	List<TaskAttachVO> attachList = task.getAttachList();
    	if(attachList != null) {
    		for(TaskAttachVO attach : attachList) {
    			String fileName = attach.getAttachFilename().split("\\$\\$")[1];
    			attach.setAttachFilename(fileName);
    		}
    	}
    	model.addAttribute("task", dataMap.get("task")); 
    	
    	return "/task/taskReport/modify";
    }
    
    @RequestMapping(value="/task/share/modify", method=RequestMethod.POST)
    public String tempModify(TaskReportModifyCommand modifyReq,
					    	 HttpServletRequest request,
					         HttpSession session) throws Exception {
    	
    	if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
    		for(int attachNo : modifyReq.getDeleteFile()) {
    			String fileName = taskService.getAttach(attachNo).getAttachFilename();
    			File deleteFile = new File(reportAttachUploadPath, fileName);
    			taskService.removeAttach(attachNo);
    			if(deleteFile.exists()) {
    				deleteFile.delete();
    			}
    		}
    	}
    	
    	
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		TaskReportVO task = modifyReq.toTaskReportVO();
		List<TaskAttachVO> attachList = GetTaskAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), reportAttachUploadPath);
		task.setEmpNo(loginUser.getEmpNo());
		task.setAttachList(attachList);
		
		taskService.modifyTempReport(task);
		
		return "/task/save";
    }
    
    @RequestMapping(value="/task/share/remove", method=RequestMethod.POST)
    public String tempRemove(TaskReportVO taskReportVO) throws Exception {
    	taskService.removeTempReport(taskReportVO);
    	return "/task/remove_success2";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
