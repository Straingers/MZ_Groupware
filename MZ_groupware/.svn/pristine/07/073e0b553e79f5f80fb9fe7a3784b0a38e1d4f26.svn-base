package com.spring.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteria;
import com.spring.task.dto.TaskDocVO;

public interface TaskDocDAO {

    // 전체 조회
    List<TaskDocVO> selectTaskDocList(SearchCriteria cri) throws SQLException;
    
    // 사용하는 목록 조회
    List<TaskDocVO> selectUseTaskDocList(TaskDocVO taskDoc) throws SQLException;

    // 한개 조회
    TaskDocVO selectTaskDoc(TaskDocVO taskDoc) throws SQLException;

    // 등록
    void insertTaskDoc(TaskDocVO taskDoc) throws SQLException;

    // 수정
    void updateTaskDoc(TaskDocVO taskDoc) throws SQLException;

    // 사용여부 변경 IS_USE 
    void updateUse(TaskDocVO taskDoc) throws SQLException;
    
    // 삭제 IS_DEL = 'Y'
    void deleteTaskDoc(TaskDocVO taskDoc) throws SQLException;

    // 리스트 수
    int selectTaskDocTotalCount(SearchCriteria cri) throws SQLException;
    
}
