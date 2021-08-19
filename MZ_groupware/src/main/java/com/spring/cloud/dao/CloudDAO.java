package com.spring.cloud.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.cloud.dto.FileVO;
import com.spring.cloud.dto.FolderVO;
import com.spring.command.SearchCriteria;

public interface CloudDAO {

	//사번이 loginUser에 해당하는 모든 폴더 가져오기
	public List<FolderVO> selectMyFolderList(FolderVO folder)throws SQLException;
	
	//사번이 loginUser에 해당하는 모든 폴더 중 가장 깊은 depth 가져오기
	public int selectDeepestFolderDepth(String empNo)throws SQLException;
	
	public FolderVO selectFolderByFolderCode(String folderCode) throws SQLException;
	
	public FileVO selectFileByCloudNo(int cloudNo)throws SQLException;
	
	public List<FileVO> selectFileByFolderCodeAttacher(FileVO file)throws SQLException;
	
	public void insertFile(FileVO file) throws SQLException;
	
	public void deleteFile(int cloudNo)throws SQLException;
	
	public void realDeleteFile(int cloudNo)throws SQLException;
	
	public void deleteFileInFolder(String folderCode)throws SQLException;
	
	public void insertFolder(FolderVO folder) throws SQLException;

	public void updateFolder(FolderVO folder) throws SQLException;
	
	public void deleteFolder(String folderCode)throws SQLException;

	public List<FileVO> selectTrashFileListByAttacher(FileVO file)throws SQLException;
	
	
	// log list 용
	List<FileVO> selectCloudLogList(SearchCriteria cri) throws SQLException;
	int selectCloudLogListCount(SearchCriteria cri) throws SQLException;
	List<FileVO> deleteAttachList() throws SQLException;
	void deleteCloudAttach() throws SQLException;
	
}