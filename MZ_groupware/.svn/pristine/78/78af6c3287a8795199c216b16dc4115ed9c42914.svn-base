package com.spring.task.dto;

import java.util.Date;
import java.util.List;

import com.spring.command.SearchCriteria;

public class TaskReportVO extends SearchCriteria {

    private int taskNo;						// 문서번호
    private String empNo;					// 문서작성자
    private int taskDocId;					// 서류양식코드
    private String taskType;				// 업무유형
    private String taskTitle;				// 업무제목
    private String taskContent;				// 업무내용
    private String taskTemp;				// 임시저장여부
    private Date taskDate;					// 업무제출일
    private String taskImportant;			// 중요여부
    private String taskSubtype;				// 업무서브유형
    
    private String taskReceiverType;
    public String getTaskReceiverType() {
		return taskReceiverType;
	}
	public void setTaskReceiverType(String taskReceiverType) {
		this.taskReceiverType = taskReceiverType;
	}

	// 수신, 참조자
    private String recEmp;
	private String ccEmp;
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

	// count 정보
    private Integer receiverCount;			// 수신자 수
    private Integer receiverSign;			// 수신자 중 확인한 직원 수
    private Integer ccCount; 				// 참조자 수
	public Integer getReceiverCount() {
		return receiverCount;
	}
	public void setReceiverCount(Integer receiverCount) {
		this.receiverCount = receiverCount;
	}
	public Integer getReceiverSign() {
		return receiverSign;
	}
	public void setReceiverSign(Integer receiverSign) {
		this.receiverSign = receiverSign;
	}
	public Integer getCcCount() {
		return ccCount;
	}
	public void setCcCount(Integer ccCount) {
		this.ccCount = ccCount;
	}

	// view 정보 (이름, 부서명, 직위명)
    private String empName;
    private String deptName;
    private String psName;
    public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPsName() {
		return psName;
	}
	public void setPsName(String psName) {
		this.psName = psName;
	}

	// history 테이블의 receiver, sign, important 정보
    private String taskReceiver;
    private String taskSign;
    private String taskReceiveImportant;
    public String getTaskReceiveImportant() {
		return taskReceiveImportant;
	}
	public void setTaskReceiveImportant(String taskReceiveImportant) {
		this.taskReceiveImportant = taskReceiveImportant;
	}
	public String getTaskReceiver() {
		return taskReceiver;
	}
	public void setTaskReceiver(String taskReceiver) {
		this.taskReceiver = taskReceiver;
	}
	public String getTaskSign() {
		return taskSign;
	}
	public void setTaskSign(String taskSign) {
		this.taskSign = taskSign;
	}
	
	// 첨부파일
	private List<TaskAttachVO> attachList;
	public List<TaskAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<TaskAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	// reply
	private List<TaskReportVO> replyList;
	public List<TaskReportVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<TaskReportVO> replyList) {
		this.replyList = replyList;
	}
	
	
	public int getTaskNo() {
		return taskNo;
	}
	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getTaskDocId() {
		return taskDocId;
	}
	public void setTaskDocId(int taskDocId) {
		this.taskDocId = taskDocId;
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
	public Date getTaskDate() {
		return taskDate;
	}
	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}
	public String getTaskImportant() {
		return taskImportant;
	}
	public void setTaskImportant(String taskImportant) {
		this.taskImportant = taskImportant;
	}
	public String getTaskSubtype() {
		return taskSubtype;
	}
	public void setTaskSubtype(String taskSubtype) {
		this.taskSubtype = taskSubtype;
	}
}
