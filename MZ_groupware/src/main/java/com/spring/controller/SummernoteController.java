package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.utils.MakeFileName;

@RestController
public class SummernoteController {
	@Resource(name="imgPath")
	private String imgPath;
	
	// 파일을 저장
	@RequestMapping("/uploadImg")
	public ResponseEntity<String> upladImg(MultipartFile file, HttpServletRequest request) throws Exception {
		ResponseEntity<String> result = null;
		
		// 용량 확인
		int fileSize = 5 * 1024 * 1024; // 5MB 제한
		
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.", HttpStatus.BAD_REQUEST);
		}
		
		String savePath = imgPath.replace("/", File.separator);
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); // 확장자만 추출하기 위함.
		String fileName = MakeFileName.toUUIDFileName("."+fileFormat, ""); // 서버에 저장하지 않고 화면에서만 보는 용으로 사용하기 때문에, UUID만 붙임 
		
		File saveFile = new File(savePath, fileName);
		
		saveFile.mkdirs();
		
		try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(request.getContextPath()+"/getImg.do?fileName="+fileName,
					HttpStatus.OK);
		} catch(IOException e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	//파일을 저장하고 바로 로드
	@RequestMapping("/getImg")
	public ResponseEntity<byte[]> getImg(String fileName, HttpServletRequest request)
		   throws Exception {
		ResponseEntity<byte[]> entity = null;
		
		String savePath = imgPath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		
		InputStream in = null;
		try {
			in = new FileInputStream(sendFile);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping("/deleteImg")
	public ResponseEntity<String> deleteImg(@RequestBody Map<String,String> data) throws Exception {
		ResponseEntity<String> result = null;
		
		String savePath = imgPath.replace("/", File.separator);
		File target = new File(savePath, data.get("fileName")); // jackson이 알아서 데이터를 사상하므로 json 데이터를 예상하고 파일이름을 추출
		
		if (!target.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		} else {
			try {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<String>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return result;
	}
}
