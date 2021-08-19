package com.spring.task.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.command.PageMaker;
import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskDocVO;
import com.spring.task.service.TaskService;

@Controller
public class TaskDocController {

    private final TaskService taskService;

    @Autowired
    public TaskDocController(TaskService taskService) {
        this.taskService = taskService;
    }

    @RequestMapping("admin/task/report/template/list")
    public String list(Model model,
                       SearchCriteria cri) throws SQLException {

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(taskService.selectTaskDocTotalCount(cri));

        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("resultList", taskService.selectTaskDocList(cri));

        return "/task/taskDoc/list";
    }

    @RequestMapping("/admin/task/report/template/detail")
    public String detail(Model model,
                         TaskDocVO taskDocVO) throws SQLException {

        model.addAttribute("resultBean", taskService.selectTaskDoc(taskDocVO));

        return "/task/taskDoc/detail";
    }

    @RequestMapping("/admin/task/report/template/registForm")
    public String registForm(Model model,
                             TaskDocVO taskDocVO) throws SQLException {

        return "/task/taskDoc/regist";
    }

    @RequestMapping(value = "/admin/task/report/template/regist", method = RequestMethod.POST)
    public String regist(Model model,
                         TaskDocVO taskDocVO) throws SQLException {

        taskService.insertTaskDoc(taskDocVO);

        return "/task/save";
    }
    
    @RequestMapping(value="/admin/task/report/template/modifyForm", method = RequestMethod.GET)
    public String modifyForm(Model model,
    					     TaskDocVO taskDocVO) throws SQLException {
    	model.addAttribute("resultBean", taskService.selectTaskDoc(taskDocVO));
    	return "/task/taskDoc/modify";
    }
    
    @RequestMapping(value="/admin/task/report/template/modify", method = RequestMethod.POST)
    public String modify(Model model,
    					 TaskDocVO taskDocVO) throws SQLException {
    	taskService.updateTaskDoc(taskDocVO);
    	return "/task/modify_success";
    }
    
    
    
    @RequestMapping(value="/admin/task/report/template/update", method = RequestMethod.POST)
    public String update(TaskDocVO taskDocVO) throws SQLException {
    	taskService.updateUse(taskDocVO);
    	return "/task/taskDoc/updateUse";
    }
    
    @RequestMapping(value="/admin/task/report/template/remove", method = RequestMethod.POST)
    public String remove(TaskDocVO taskDocVO) throws SQLException {
    	taskService.deleteTaskDoc(taskDocVO);
    	return "/task/remove_success";
    }
    
    @RequestMapping(value="/admin/task/report/template/remove2", method = RequestMethod.POST)
    public String remove2(TaskDocVO taskDocVO) throws SQLException {
    	taskService.deleteTaskDoc(taskDocVO);
    	return "/task/remove_success2";
    }

}
