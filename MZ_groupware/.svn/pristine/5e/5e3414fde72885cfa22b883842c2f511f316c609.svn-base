package com.spring.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.approval.dto.ApprovalAttachVO;

public class GetApprovalAttachesAsMultipartFiles {
	
	public static List<ApprovalAttachVO> save(List<MultipartFile> multiFiles, String savePath)throws Exception{
	
		List<ApprovalAttachVO> attachList = new ArrayList<ApprovalAttachVO>();

		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);

				target.mkdirs();

				multi.transferTo(target);

				ApprovalAttachVO attach = new ApprovalAttachVO();
				attach.setAttachUploadpath(savePath);
				attach.setAttachFilename(fileName);
				attach.setAttachFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

				attachList.add(attach);
			}
		}
		return attachList;
		
	}
}
