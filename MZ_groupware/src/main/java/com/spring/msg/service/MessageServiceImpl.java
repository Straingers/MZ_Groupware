package com.spring.msg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.PageMaker;
import com.spring.msg.dao.MessageDAO;
import com.spring.msg.dto.MessageVO;

public class MessageServiceImpl implements MessageService {

	private MessageDAO messageDAO;
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	@Override
	public Map<String, Object> getReceiveList(MessageVO msgVO) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MessageVO> msgList = messageDAO.selectReceiveAllMessageList(msgVO);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(msgVO);
		pageMaker.setTotalCount(messageDAO.selectReceiveAllListCount(msgVO));
		
		dataMap.put("msgList", msgList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getSendList(MessageVO msgVO) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MessageVO> msgList = messageDAO.selectSendAllMessageList(msgVO);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(msgVO);
		pageMaker.setTotalCount(messageDAO.selectSendAllListCount(msgVO));
		
		dataMap.put("msgList", msgList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	

	@Override
	public MessageVO getMessage(int mssNo, String pageType) throws SQLException {
		MessageVO msg = messageDAO.selectMessageByMssNo(mssNo);
		if(msg.getMssOpenStatus().equals("N") && pageType.equals("receive")) {
			messageDAO.chmodOpenStat(mssNo);
		}
		return msg;
	}
	@Override
	public MessageVO getMainMessage(int mssNo) throws SQLException {
		MessageVO msg = messageDAO.selectMessageByMssNo(mssNo);
		return msg;
	}

	@Override
	public void regist(MessageVO msg) throws SQLException {
		messageDAO.insertMessage(msg);
	}

	@Override
	public void recRemove(int mssNo) throws SQLException {
		messageDAO.deleteRecMessage(mssNo);
	}

	@Override
	public void sendRemove(int mssNo) throws SQLException {
		messageDAO.deleteSendMessage(mssNo);
	}


}
