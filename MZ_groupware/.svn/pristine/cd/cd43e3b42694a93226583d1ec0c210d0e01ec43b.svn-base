package com.spring.cloud.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.cloud.dto.FileVO;
import com.spring.cloud.dto.FolderVO;
import com.spring.command.SearchCriteria;

public class CloudDAOImpl implements CloudDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) { // setSqlSession set메서드 이름으로 타겟 확인
		this.session=session;
	}
	
	@Override
	public List<FolderVO> selectMyFolderList(FolderVO folder) throws SQLException {
		List<FolderVO> folderList = session.selectList("Cloud-Mapper.selectMyFolderList", folder);
		return folderList;
	}

	@Override
	public FolderVO selectFolderByFolderCode(String folderCode) throws SQLException {
		FolderVO folder = session.selectOne("Cloud-Mapper.selectFolderByFolderCode", folderCode);
		return folder;
	}

	@Override
	public int selectDeepestFolderDepth(String empNo) throws SQLException {
		int depth = session.selectOne("Cloud-Mapper.selectDeepestFolderDepth", empNo);
		return depth;
	}

	@Override
	public FileVO selectFileByCloudNo(int cloudNo) throws SQLException {
		FileVO cloud = session.selectOne("Cloud-Mapper.selectFileByCloudNo",cloudNo);
		return cloud;
	}

	@Override
	public List<FileVO> selectFileByFolderCodeAttacher(FileVO file) throws SQLException {
		int offset = file.getStartRowNum();
		int limit = file.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<FileVO> cloudList = session.selectList("Cloud-Mapper.selectFileListByFolderCodeAttacher", file, rowBounds);
		return cloudList;
	}
	
	@Override
	public void insertFile(FileVO file) throws SQLException {
		session.update("Cloud-Mapper.insertFile", file);
	}

	@Override
	public void insertFolder(FolderVO folder) throws SQLException {
		session.update("Cloud-Mapper.insertFolder", folder);
	}

	@Override
	public void deleteFolder(String folderCode) throws SQLException {
		session.update("Cloud-Mapper.deleteFolder", folderCode);
	}

	@Override
	public void deleteFile(int cloudNo) throws SQLException {
		session.update("Cloud-Mapper.deleteFile", cloudNo);
	}

	@Override
	public void deleteFileInFolder(String folderCode) throws SQLException {
		session.update("Cloud-Mapper.deleteFileInFolder", folderCode);
	}

	@Override
	public List<FileVO> selectTrashFileListByAttacher(FileVO file) throws SQLException {
		int offset = file.getStartRowNum();
		int limit = file.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<FileVO> fileList = session.selectList("Cloud-Mapper.selectTrashFileListByAttacher", file, rowBounds);
		return fileList;
	}

	@Override
	public void realDeleteFile(int cloudNo) throws SQLException {
		session.update("Cloud-Mapper.realDeleteFile", cloudNo);
	}

	@Override
	public void updateFolder(FolderVO folder) throws SQLException {
		session.update("Cloud-Mapper.updateFolder", folder);
	}

	@Override
	public List<FileVO> selectCloudLogList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("Cloud-Mapper.selectCloudLogList", cri, rowBounds);
	}

	@Override
	public int selectCloudLogListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Cloud-Mapper.selectCloudLogListCount", cri);
	}

	@Override
	public List<FileVO> deleteAttachList() throws SQLException {
		return session.selectList("Cloud-Mapper.deleteAttachList");
	}

	@Override
	public void deleteCloudAttach() throws SQLException {
		session.delete("Cloud-Mapper.deleteCloutAttach");
	}
}
