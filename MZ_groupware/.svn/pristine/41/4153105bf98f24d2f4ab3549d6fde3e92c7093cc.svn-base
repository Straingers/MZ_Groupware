package com.spring.task.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import com.spring.task.dto.TaskDocVO;
import com.spring.task.dto.TaskHistoryVO;
import com.spring.task.dto.TaskReportVO;
import com.spring.task.service.TaskHistoryService;
import com.spring.task.service.TaskService;
import com.spring.task.utils.GetTaskAttachesAsMultipartFiles;

@Controller
public class TaskDailyController {
	
	private final TaskService taskService;
	private final TaskHistoryService taskHistoryService;
	private final TaskReceiverLineService taskLineService;

    @Autowired
    public TaskDailyController(TaskService taskService, TaskHistoryService taskHistoryService, TaskReceiverLineService taskLineService) {
        this.taskService = taskService;
        this.taskHistoryService = taskHistoryService;
        this.taskLineService = taskLineService;
    }
    
    @Resource(name="reportAttachUploadPath")
    private String reportAttachUploadPath;
	
    @RequestMapping("/task/daily/uncheck/list")
    public String uncheckList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("daily");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String, Object> dataMap = taskService.getUncheckTaskList(taskReportVO);
    	model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "uncheck");
    	model.addAttribute("pageTaskType", "daily");
    	
    	return "/task/taskReportDaily/uncheckList";
    }
    
    @RequestMapping("/task/daily/receive/list")
    public String receiveList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("daily");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getReceiveTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
        model.addAttribute("pageType", "receive");
        model.addAttribute("pageTaskType", "daily");

        return "/task/taskReportDaily/receiveList";
    }
    
    @RequestMapping("/task/daily/send/list")
    public String sendList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("daily");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getSendTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "send");
    	model.addAttribute("pageTaskType", "daily");

        return "/task/taskReportDaily/sendList";
    }
    
    @RequestMapping("/task/daily/temp/list")
    public String tempList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("daily");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getTempTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "temp");
    	model.addAttribute("pageTaskType", "daily");

        return "/task/taskReportDaily/tempList";
    }
    
    @RequestMapping("/task/daily/registForm")
    public String registForm(Model model, TaskReceiverLineVO taskReceiverLineVO, TaskDocVO taskDoc, HttpSession session) throws Exception {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		taskReceiverLineVO.setEmpNo(loginUser.getEmpNo());
				
		Map<String, Object> lineList = taskLineService.getLineList(taskReceiverLineVO);
		taskDoc.setTaskDocType("일일보고");
		Map<String, Object> docList = taskService.selectUseTaskDocList(taskDoc);
		model.addAttribute("lineList", lineList.get("lineList"));
		model.addAttribute("taskDoc", docList.get("taskDoc"));
    	
        return "/task/taskReportDaily/regist";
    }
    
    @RequestMapping(value="/task/daily/taskDocList", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> taskDocList(@RequestBody TaskDocVO taskDocVO, Model model) throws Exception {
		Map<String, Object> taskDoc = taskService.selectUseTaskDocList(taskDocVO);
        return taskDoc;
    }
    
    @RequestMapping(value="/task/daily/taskDocDetail", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> taskDocDetail(@RequestBody TaskDocVO taskDocVO, Model model) throws Exception {
    	TaskDocVO detail = taskService.selectTaskDoc(taskDocVO);
    	Map<String, Object> dataMap = new HashMap<String, Object>();
    	
    	dataMap.put("detail", detail);
    	return dataMap;
    }
    
    @RequestMapping(value="/task/daily/regist", method=RequestMethod.POST)
    public String regist(TaskReportVO taskReport, TaskReportRegistCommand registReq, HttpSession session, Model model) throws Exception {
    	taskService.removeTempReport(taskReport);
    	
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	TaskReportVO task = registReq.toTaskReportVO();
        List<TaskAttachVO> attachList = GetTaskAttachesAsMultipartFiles.save(registReq.getUploadFile(), reportAttachUploadPath);
        task.setEmpNo(loginUser.getEmpNo());
        task.setAttachList(attachList);
        
        task.setTaskType("daily");
        task.setTaskSubtype(registReq.getTaskSubtype());
        
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
    
    @RequestMapping("/task/daily/detail")
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
    		}
    	}
    	
    	model.addAttribute("task", dataMap.get("task"));  	
    	model.addAttribute("taskHistoryRec", dataMap.get("taskHistoryRec"));  	
    	model.addAttribute("taskHistoryCc", dataMap.get("taskHistoryCc"));  	
    	
    	return "/task/taskReportDaily/detail";
    }
    
    // 임시저장 기능
    @RequestMapping(value="/task/daily/tempRegist", method=RequestMethod.POST)
    public String tempRegist(TaskReportVO taskReport, TaskReportRegistCommand registReq, HttpSession session) throws Exception {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	TaskReportVO task = registReq.toTaskReportVO();
        List<TaskAttachVO> attachList = GetTaskAttachesAsMultipartFiles.save(registReq.getUploadFile(), reportAttachUploadPath);
        task.setEmpNo(loginUser.getEmpNo());
        task.setAttachList(attachList);
        
        task.setTaskType("daily");
        task.setTaskSubtype(registReq.getTaskSubtype());
        
        taskService.registTempReport(task);
    	
    	return "/task/save";
    }
    
    @RequestMapping(value="/task/daily/modify", method=RequestMethod.GET)
    public String tempModifyForm(Model model, int taskNo, TaskReportVO taskReportVO, TaskReceiverLineVO taskReceiverLineVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		taskReceiverLineVO.setEmpNo(loginUser.getEmpNo());
    	Map<String, Object> dataMap = taskService.getTaskReport(taskNo);
    	TaskReportVO task = (TaskReportVO) dataMap.get("task");
    	
    	List<TaskAttachVO> attachList = task.getAttachList();
    	if(attachList != null) {
    		for(TaskAttachVO attach : attachList) {
    			String fileName = attach.getAttachFilename().split("\\$\\$")[1];
    			attach.setAttachFilename(fileName);
    		}
    	}
    	Map<String, Object> lineList = taskLineService.getLineList(taskReceiverLineVO);
		model.addAttribute("lineList", lineList.get("lineList"));
    	model.addAttribute("task", dataMap.get("task")); 
    	
    	return "/task/taskReportDaily/modify";
    }
    
    
    @RequestMapping(value="/task/daily/modify", method=RequestMethod.POST)
    public String tempModify(TaskReportVO taskReport, TaskReportModifyCommand modifyReq, HttpSession session) throws Exception {
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
    	
        task.setTaskType("daily");
        task.setTaskSubtype(modifyReq.getTaskSubtype());
        
        taskService.modifyTempReport(task);
    	
    	return "/task/save";
    }
    
    @RequestMapping(value="/task/daily/remove", method=RequestMethod.POST)
    public String tempRemove(TaskReportVO taskReportVO) throws Exception {
    	taskService.removeTempReport(taskReportVO);
    	return "/task/remove_success2";
    }
    
}
