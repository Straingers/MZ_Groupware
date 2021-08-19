package com.spring.task.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.task.dto.TaskAttachVO;

public class GetTaskAttachesAsMultipartFiles {
	
	public static List<TaskAttachVO> save(List<MultipartFile> multiFiles, String savePath)throws Exception{
	
		List<TaskAttachVO> attachList = new ArrayList<TaskAttachVO>();

		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);

				target.mkdirs();

				multi.transferTo(target);

				TaskAttachVO attach = new TaskAttachVO();
				attach.setAttachUploadpath(savePath);
				attach.setAttachFilename(fileName);
				attach.setAttachFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

				attachList.add(attach);
			}
		}
		return attachList;
		
	}
}
