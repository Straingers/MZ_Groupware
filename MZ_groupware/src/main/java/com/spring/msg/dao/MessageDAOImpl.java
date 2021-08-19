package com.spring.msg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.msg.dto.MessageVO;

public class MessageDAOImpl implements MessageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	//수신함 리스트
	@Override
	public List<MessageVO> selectReceiveAllMessageList(MessageVO msgVO) throws SQLException {
		int offset = msgVO.getStartRowNum();
		int limit = msgVO.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<MessageVO> recList = session.selectList("Message-Mapper.selectAllMessageList", msgVO, rowBounds);
		return recList;
	}
	//발신함 리스트
	@Override
	public List<MessageVO> selectSendAllMessageList(MessageVO msgVO) throws SQLException {
		int offset = msgVO.getStartRowNum();
		int limit = msgVO.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MessageVO> sendList = session.selectList("Message-Mapper.selectAllMessageList", msgVO, rowBounds);
		return sendList;
	}
	

	//쪽지 상세
	@Override
	public MessageVO selectMessageByMssNo(int mssNo) throws SQLException {
		MessageVO msg = session.selectOne("Message-Mapper.selectMessageByMssNo", mssNo);
		System.out.println(msg.getEmpNo());
		return msg;
	}
	
	//수신함 쪽지 개수
	@Override
	public int selectReceiveAllListCount(MessageVO msgVO) throws SQLException {
		int count = 0;
		count = session.selectOne("Message-Mapper.selectReceiveAllListCount", msgVO);
		return count;
	}

	//발신함 쪽지 개수
	@Override
	public int selectSendAllListCount(MessageVO msgVO) throws SQLException {
		int count = 0;
		count = session.selectOne("Message-Mapper.selectSendAllListCount", msgVO);
		return count;
	}

	@Override
	public void insertMessage(MessageVO msg) throws SQLException {
		session.update("Message-Mapper.insertMessage", msg);
	}

	@Override
	public void deleteRecMessage(int mssNo) throws SQLException {
		session.update("Message-Mapper.deleteRecMessage", mssNo);
	}

	@Override
	public void deleteSendMessage(int mssNo) throws SQLException {
		session.update("Message-Mapper.deleteSendMessage", mssNo);
	}

	@Override
	public void chmodOpenStat(int mssNo) throws SQLException {
		session.update("Message-Mapper.chmodOpenStat", mssNo);
	}


}