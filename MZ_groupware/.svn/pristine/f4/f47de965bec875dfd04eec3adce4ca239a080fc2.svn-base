package com.spring.notification.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.notification.dao.NotificationDAO;
import com.spring.notification.dto.NotificationVO;

public class NotificationServiceImpl implements NotificationService {

	private NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	
	@Override
	public List<NotificationVO> getNotificationList() throws SQLException {
		return notificationDAO.selectNotificationList();
	}

	@Override
	public List<NotificationVO> getMyNotificationList(NotificationVO notification) throws SQLException {
		return notificationDAO.selectMyNotificationList(notification);
	}
	
	@Override
	public int getMyNotificationCnt(NotificationVO notification) throws SQLException {
		return notificationDAO.selectMyNotificationCount(notification);
	}
	
	@Override
	public int insertNotification(NotificationVO notification) throws SQLException {
		notificationDAO.insertNotification(notification);
		return notificationDAO.selectLastNotificationNo();
	}
	
	@Override
	public void removeNotification(NotificationVO notification) throws SQLException {
		notificationDAO.deleteNotification(notification);
	}


}
