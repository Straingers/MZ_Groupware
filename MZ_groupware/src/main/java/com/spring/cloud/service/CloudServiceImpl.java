package com.spring.cloud.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.cloud.dao.CloudDAO;
import com.spring.cloud.dto.FileVO;
import com.spring.cloud.dto.FolderVO;
import com.spring.command.PageMaker;

public class CloudServiceImpl implements CloudService{

	private CloudDAO cloudDAO;
	public void setCloudDAO(CloudDAO cloudDAO) {
		this.cloudDAO = cloudDAO;
	}
	
	@Override
	public List<FolderVO> getFolederList(FolderVO folder) throws SQLException {
		List<FolderVO> cloudFolderList = cloudDAO.selectMyFolderList(folder);
		
		return cloudFolderList;
	}
	@Override
	public Map<String, Object> getFileListByFolderCodeAttacher(FileVO file) throws SQLException {
		
		List<FileVO> fileList = cloudDAO.selectFileByFolderCodeAttacher(file);
		if(fileList != null) {
			for(FileVO files : fileList) {
				String fileName = files.getCloudFilename().split("\\$\\$")[1];
				files.setFilename(fileName);
			}
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(file);
		pageMaker.setTotalCount(fileList.size());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("fileList", fileList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void uploadFile(FileVO file) throws SQLException {
		cloudDAO.insertFile(file);
	}

	@Override
	public FolderVO getFolder(String folderCode) throws SQLException {
		FolderVO folder = cloudDAO.selectFolderByFolderCode(folderCode);
		return folder;
	}
	
	@Override
	public FileVO getFile(int cloudNo) throws SQLException {
		FileVO file = cloudDAO.selectFileByCloudNo(cloudNo);
		return file;
	}

	@Override
	public void makeFolder(FolderVO folder) throws SQLException {
		 cloudDAO.insertFolder(folder);
	}

	@Override
	public void modifyFolder(FolderVO folder) throws SQLException {
		cloudDAO.updateFolder(folder);
	}

	@Override
	public void removeFolder(String folderCode) throws SQLException {
		cloudDAO.deleteFolder(folderCode);
		cloudDAO.deleteFileInFolder(folderCode);
	}

	@Override
	public Map<String, Object> getTrashFileListByAttacher(FileVO reqfile) throws SQLException {
		List<FileVO> fileList = cloudDAO.selectTrashFileListByAttacher(reqfile);
		if(fileList != null) {
			for(FileVO files : fileList) {
				String fileName = files.getCloudFilename().split("\\$\\$")[1];
				files.setFilename(fileName);
			}
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(reqfile);
		pageMaker.setTotalCount(fileList.size());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("fileList", fileList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void removeFile(int cloudNo) throws SQLException {
		cloudDAO.deleteFile(cloudNo);
	}

	@Override
	public void realRemoveFile(int cloudNo) throws SQLException {
		cloudDAO.realDeleteFile(cloudNo);
	}

	@Override
	public Map<String, Object> getClougLog(FileVO file) throws SQLException {
		List<FileVO> cloudList = cloudDAO.selectCloudLogList(file);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(file);
		pageMaker.setTotalCount(cloudDAO.selectCloudLogListCount(file));
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("cloudList", cloudList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<FileVO> getDeleteAttachList() throws SQLException {
		cloudDAO.deleteCloudAttach();
		return cloudDAO.deleteAttachList();
	}


}
