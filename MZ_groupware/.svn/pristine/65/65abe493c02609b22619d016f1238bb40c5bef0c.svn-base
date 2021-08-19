package com.spring.cloud.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cloud.dto.FileVO;

public class GetCloudAsMultipartFiles {
	
	public static List<FileVO> save(List<MultipartFile> multiFiles, String savePath)throws Exception{
	
		List<FileVO> fileList = new ArrayList<FileVO>();

		if (multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);

				target.mkdirs();

				multi.transferTo(target);

				FileVO file = new FileVO();
				file.setCloudUploadpath(savePath);
				file.setCloudFilename(fileName);
				file.setCloudFiletype(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());

				fileList.add(file);
			}
		}
		return fileList;
		
	}
}
