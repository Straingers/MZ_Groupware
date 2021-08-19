package com.spring.notification.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.notification.dto.NotificationVO;

public interface NotificationService {
	
	List<NotificationVO> getNotificationList() throws SQLException;
	
	List<NotificationVO> getMyNotificationList(NotificationVO notification) throws SQLException;
	int getMyNotificationCnt(NotificationVO notification) throws SQLException;
	
	int insertNotification(NotificationVO notification) throws SQLException;
	
	void removeNotification(NotificationVO notification) throws SQLException;
}
