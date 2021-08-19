package com.spring.task.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dto.EmployeeVO;
import com.spring.task.dto.TaskReportVO;
import com.spring.task.service.TaskService;

@Controller
public class TaskSpController {
	
	private final TaskService taskService;

    @Autowired
    public TaskSpController(TaskService taskService) {
        this.taskService = taskService;
    }
	
    @RequestMapping("/task/sp/uncheck/list")
    public String uncheckList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("sp");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String, Object> dataMap = taskService.getUncheckTaskList(taskReportVO);
    	model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "uncheck");
    	model.addAttribute("pageTaskType", "sp");
    	
    	return "/task/taskReportSp/uncheckList";
    }
    
    @RequestMapping("/task/sp/receive/list")
    public String receiveList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("sp");
    	taskReportVO.setTaskReceiver(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getReceiveTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
        model.addAttribute("pageType", "receive");
        model.addAttribute("pageTaskType", "sp");

        return "/task/taskReportSp/receiveList";
    }
    
    @RequestMapping("/task/sp/send/list")
    public String sendList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("sp");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getSendTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "send");
    	model.addAttribute("pageTaskType", "sp");

        return "/task/taskReportSp/sendList";
    }
    
    @RequestMapping("/task/sp/temp/list")
    public String tempList(Model model, TaskReportVO taskReportVO, HttpSession session) throws SQLException {
    	EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
    	
    	taskReportVO.setTaskType("sp");
    	taskReportVO.setEmpNo(loginUser.getEmpNo());
    	
    	Map<String , Object> dataMap = taskService.getTempTaskList(taskReportVO);
        model.addAttribute("dataMap", dataMap);
    	model.addAttribute("pageType", "temp");
    	model.addAttribute("pageTaskType", "sp");

        return "/task/taskReportSp/tempList";
    }
}
