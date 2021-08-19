package com.spring.task.dto;

public class TaskDocVO {

    private int taskDocId;
    private String taskDocName;
    private String taskContent;
    private String isUse;
    private String isDel;
    private String taskDocType;

    public String getTaskDocType() {
		return taskDocType;
	}

	public void setTaskDocType(String taskDocType) {
		this.taskDocType = taskDocType;
	}

	public int getTaskDocId() {
        return taskDocId;
    }

    public void setTaskDocId(int taskDocId) {
        this.taskDocId = taskDocId;
    }

    public String getTaskDocName() {
        return taskDocName;
    }

    public void setTaskDocName(String taskDocName) {
        this.taskDocName = taskDocName;
    }

    public String getTaskContent() {
        return taskContent;
    }

    public void setTaskContent(String taskContent) {
        this.taskContent = taskContent;
    }

    public String getIsUse() {
        return isUse;
    }

    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }

    public String getIsDel() {
        return isDel;
    }

    public void setIsDel(String isDel) {
        this.isDel = isDel;
    }
}
