package com.spring.msg.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.EmployeeVO;
import com.spring.msg.dto.MessageVO;
import com.spring.msg.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/send/list")
	public String sendList(MessageVO msgVO, HttpSession session, Model model) throws SQLException{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		msgVO.setEmpNo(loginUser.getEmpNo());
		msgVO.setPageType("send");
		Map<String, Object> dataMap = messageService.getSendList(msgVO);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "send");
		model.addAttribute("perPageNum", 10);
		
		return "message/sendList";
		
	}
	@RequestMapping("/receive/list")
	public String recList(MessageVO msgVO, HttpSession session, Model model) throws SQLException{
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		msgVO.setEmpNo(loginUser.getEmpNo());
		msgVO.setPageType("receive");
		
		Map<String, Object> dataMap = messageService.getReceiveList(msgVO);
	
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("pageType", "receive");
		
		return "message/receiveList";
	
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Map<String, Object> detail(@RequestBody Map<String, Object> map) throws Exception{
		String mssNo = String.valueOf(map.get("mssNo"));
		String pageType = String.valueOf(map.get("pageType"));
		MessageVO msg = messageService.getMessage(Integer.parseInt(mssNo), pageType);
		map.put("msg", msg);
		return map;
	}
	@RequestMapping("/main/detail")
	public String mdetail(String mssNo, Model model) throws Exception{
//		String mssNo = String.valueOf(map.get("mssNo"));
		MessageVO msg = messageService.getMainMessage(Integer.parseInt(mssNo));
		model.addAttribute("msg", msg);
//		map.put("msg", msg);
		return "message/detail";
	}
	
	@RequestMapping("/regist")
	@ResponseBody
	public Map<String, Object> regist(@RequestBody Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		MessageVO msg = new MessageVO();
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		String empNo = emp.getEmpNo();
		String str = String.valueOf(map.get("mssReceiver"));
		str = str.substring(1, str.length()-1);
		String[] recEmpList = str.split(", ");
		int mssNo = 0;
		for(String recEmp : recEmpList) {
			msg.setMssReceiver(recEmp);
			msg.setMssContent(String.valueOf(map.get("mssContent")));
			msg.setEmpNo(empNo);
			messageService.regist(msg);
			mssNo = msg.getMssNo();
		}
		map.put("mssNo", mssNo);
		return map;
	}
	
	@RequestMapping("/recRemove")
	@ResponseBody
	public Map<String, Object> recRemove(@RequestBody Map<String, Object> map) throws Exception{
		String mssNo = String.valueOf(map.get("mssNo"));
		messageService.recRemove(Integer.parseInt(mssNo));
		
		return map;
	}
	
	@RequestMapping("/sendRemove")
	@ResponseBody
	public Map<String, Object> sendRemove(@RequestBody Map<String, Object> map) throws Exception{
		String mssNo = String.valueOf(map.get("mssNo"));
		messageService.sendRemove(Integer.parseInt(mssNo));
		
		return map;
	}
}
