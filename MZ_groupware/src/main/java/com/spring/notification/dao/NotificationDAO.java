package com.spring.notification.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.notification.dto.NotificationVO;

public interface NotificationDAO {
	
	List<NotificationVO> selectNotificationList() throws SQLException;
	
	List<NotificationVO> selectMyNotificationList(NotificationVO notification) throws SQLException;
	
	int selectLastNotificationNo() throws SQLException;
	
	int selectMyNotificationCount(NotificationVO notification) throws SQLException;
	
	void insertNotification(NotificationVO notification) throws SQLException;
	
	void deleteNotification(NotificationVO notification) throws SQLException;
	
	
}
