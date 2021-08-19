package com.spring.cloud.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.cloud.dto.FileVO;
import com.spring.cloud.dto.FolderVO;

public interface CloudService {
	//folder js tree List
	List<FolderVO> getFolederList(FolderVO folder)throws SQLException;
	
	//File List ByFolderCode or attacher
	Map<String, Object> getFileListByFolderCodeAttacher(FileVO file)throws SQLException;
	
	FolderVO getFolder(String folderCode)throws SQLException;
	FileVO getFile(int cloudNo)throws SQLException;
	//file upload
	void uploadFile(FileVO file)throws SQLException;

	void removeFile(int cloudNo) throws SQLException;
	
	void realRemoveFile(int cloudNo) throws SQLException;
	
	void makeFolder(FolderVO folder) throws SQLException;

	void modifyFolder(FolderVO folder) throws SQLException;
	
	void removeFolder(String folderCode) throws SQLException;

	Map<String, Object> getTrashFileListByAttacher(FileVO reqfile)throws SQLException;
	
	// 로그용
	Map<String, Object> getClougLog(FileVO file) throws SQLException;
	List<FileVO> getDeleteAttachList() throws SQLException;
}
