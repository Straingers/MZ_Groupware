package com.spring.task.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.spring.task.dto.TaskAttachVO;

public class MakeFileName {
	
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}
	
	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1];
	}	
	
	public static List<TaskAttachVO> parseFileNameFromAttaches(List<TaskAttachVO> attachList, String delimiter) {
		
		List<TaskAttachVO> renamedAttachList = new ArrayList<TaskAttachVO>();
		
		if (attachList != null) {
			for (TaskAttachVO attach : attachList) {
				String fileName = attach.getAttachFilename();	//DB상의 fileName
				fileName = parseFileNameFromUUID(fileName, delimiter);	//uuid가 제거된 fileName
				
				attach.setAttachFilename(fileName);
				
				renamedAttachList.add(attach);
			}
		}
		return renamedAttachList;
	}
}
