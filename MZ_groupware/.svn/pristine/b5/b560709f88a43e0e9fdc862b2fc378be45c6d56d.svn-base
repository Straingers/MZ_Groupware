package com.spring.pds.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.pds.dto.PdsVO;

public interface PdsDAO {
	// 회사내규 목록
	List<PdsVO> selectPdsList(PdsVO pds) throws SQLException;
	
	//회사내규 상세
	PdsVO selectPdsByPdsNo(int pdsNo) throws SQLException;
	
	//totalcount
	int selectPdsListCount(PdsVO pds) throws SQLException;
	
	//등록
	void insertPdsBoard(PdsVO Pds) throws SQLException;
	
	//수정
	void updatePdsBoard(PdsVO Pds) throws SQLException;
	
	//삭제
	void deletePdsBoard(int pdsNo) throws SQLException;
}
