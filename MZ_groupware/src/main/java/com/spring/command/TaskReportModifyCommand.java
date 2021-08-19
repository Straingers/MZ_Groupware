package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.task.dto.TaskReportVO;

public class TaskReportModifyCommand {
	private int[] deleteFile;
	private int taskNo;

	private String empNo;
	private String taskType;
	private String taskTitle;
	private String taskContent;
	private String taskTemp;
	private int taskDocId;
	public int getTaskDocId() {
		return taskDocId;
	}

	public void setTaskDocId(int taskDocId) {
		this.taskDocId = taskDocId;
	}

	public String getTaskSubtype() {
		return taskSubtype;
	}

	public void setTaskSubtype(String taskSubtype) {
		this.taskSubtype = taskSubtype;
	}


	private String taskSubtype;

	private String recEmp;
	private String ccEmp;

	private List<MultipartFile> uploadFile;

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public String getTaskTemp() {
		return taskTemp;
	}

	public void setTaskTemp(String taskTemp) {
		this.taskTemp = taskTemp;
	}

	public String getRecEmp() {
		return recEmp;
	}

	public void setRecEmp(String recEmp) {
		this.recEmp = recEmp;
	}

	public String getCcEmp() {
		return ccEmp;
	}

	public void setCcEmp(String ccEmp) {
		this.ccEmp = ccEmp;
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	
	public TaskReportVO toTaskReportVO() {
		TaskReportVO task = new TaskReportVO();

		task.setTaskNo(this.taskNo);
		task.setEmpNo(this.empNo);
		task.setTaskType(this.taskType);
		task.setTaskTitle(this.taskTitle);
		task.setTaskContent(this.taskContent);
		task.setTaskTemp(this.taskTemp);
		
		task.setTaskDocId(this.taskDocId);
		task.setTaskSubtype(this.taskSubtype);

		task.setRecEmp(this.recEmp);
		task.setCcEmp(this.ccEmp);
		return task;
	}
}
